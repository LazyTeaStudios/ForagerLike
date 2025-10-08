using System;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;
using TMPro;

public class InventorySlotUI : MonoBehaviour,
    IPointerClickHandler, IBeginDragHandler, IDragHandler, IEndDragHandler,
    IDropHandler, IPointerEnterHandler, IPointerExitHandler
{
    public enum SlotContext { Inventory, Hotbar, CraftingInput, CraftingOutput }

    [Header("UI")]
    public Image itemIcon;
    public TextMeshProUGUI quantityText;
    public Image background;

    [Header("Colors")]
    public Color normalColor = Color.white;
    public Color selectedColor = Color.yellow;
    public Color dragHighlightColor = new Color(0.5f, 1f, 0.5f, 0.85f);

    [Header("Context (set by UI managers)")]
    [SerializeField] private SlotContext context = SlotContext.Inventory;

    [SerializeField] private int slotIndex = -1;   // Inventory/Hotbar index
    [SerializeField] private bool isHotbar = false;

    [SerializeField] private InventorySlot craftingSlotRef; // for CraftingInput/Output

    // legacy requirement fields (no longer used for gating)
    [SerializeField] private ItemData requiredItem;
    [SerializeField] private int requiredQuantity;

    private Color originalBg;
    private static InventorySlotUI draggingFrom;

    // Global event—any slot change can tell UIs to re-evaluate buttons, etc.
    public static event Action OnAnySlotChanged;

    // === Public helpers ===
    public SlotContext Context => context;
    public int GetSlotIndex() => slotIndex;
    public bool IsHotbarSlot() => isHotbar;
    public InventorySlot GetSlotData() => ResolveSlot();

    public void SetCraftRequirement(ItemData item, int qty)
    {
        // no-op now (left for compatibility)
        requiredItem = item;
        requiredQuantity = qty;
        OnAnySlotChanged?.Invoke();
    }

    public void SetupInventory(int index, bool hotbar)
    {
        context = hotbar ? SlotContext.Hotbar : SlotContext.Inventory;
        slotIndex = index;
        isHotbar = hotbar;
        craftingSlotRef = null;
        CacheBg();
        UpdateDisplay();
    }

    public void SetupCrafting(InventorySlot slotRef, SlotContext craftingContext /* Input or Output */)
    {
        context = craftingContext;
        craftingSlotRef = slotRef;
        slotIndex = -1;
        isHotbar = false;
        CacheBg();
        UpdateDisplay();
    }

    public void SetSelected(bool selected)
    {
        if (background == null) return;
        background.color = selected ? selectedColor : normalColor;
    }

    InventorySlot ResolveSlot()
    {
        switch (context)
        {
            case SlotContext.Inventory: return InventorySystem.Instance.GetInventorySlot(slotIndex);
            case SlotContext.Hotbar: return InventorySystem.Instance.GetHotbarSlot(slotIndex);
            case SlotContext.CraftingInput:
            case SlotContext.CraftingOutput:
                return craftingSlotRef;
            default: return null;
        }
    }

    void CacheBg()
    {
        if (background != null) originalBg = background.color;
    }

    public void UpdateDisplay()
    {
        var slot = ResolveSlot();

        if (background != null)
        {
            if (context == SlotContext.Hotbar &&
                InventorySystem.Instance.GetSelectedHotbarIndex() == slotIndex)
            {
                background.color = selectedColor;
            }
            else
            {
                background.color = normalColor;
            }
        }

        if (slot == null || slot.IsEmpty)
        {
            if (itemIcon != null)
            {
                itemIcon.sprite = null;
                itemIcon.color = Color.clear;
                itemIcon.rectTransform.localScale = Vector3.one;
            }
            if (quantityText != null)
            {
                quantityText.text = "";
                quantityText.color = Color.white;
            }
            return;
        }

        if (itemIcon != null)
        {
            itemIcon.sprite = slot.item.icon;
            itemIcon.color = Color.white;
            FitSprite(itemIcon);
        }

        if (quantityText != null)
        {
            quantityText.text = slot.quantity > 1 ? slot.quantity.ToString() : "";
            quantityText.color = Color.white;
        }
    }

    void FitSprite(Image icon)
    {
        if (icon.sprite == null) return;

        icon.preserveAspect = true;
        icon.rectTransform.localScale = Vector3.one;

        var parent = icon.rectTransform.parent as RectTransform;
        float padding = 12f;
        float size = Mathf.Min(parent.rect.width, parent.rect.height) - (padding * 2);

        icon.rectTransform.anchorMin = icon.rectTransform.anchorMax = new Vector2(0.5f, 0.5f);
        icon.rectTransform.sizeDelta = new Vector2(size, size);
        icon.rectTransform.anchoredPosition = Vector2.zero;
    }

    // ===== Input / Drag & Drop / Shift-click =====
    public void OnPointerClick(PointerEventData eventData)
    {
        if (!InputHandler.IsMapActive(ActionMap.UI)) return;

        bool shift = InputHandler.Held(GameAction.ShiftModifier);

        if (shift)
        {
            var slot = ResolveSlot();
            if (slot == null || slot.IsEmpty) return;

            // A) From Inventory/Hotbar -> Inputs (if a crafting UI is open)
            if (context == SlotContext.Inventory || context == SlotContext.Hotbar)
            {
                var openUI = CraftingUI.OpenInstance;
                if (openUI != null)
                {
                    int toMove = slot.quantity;
                    int moved = openUI.AddToInputs(slot.item, toMove);
                    if (moved > 0)
                    {
                        // remove from player's inventory slot
                        InventorySystem.Instance.RemoveItem(slotIndex, isHotbar, moved);
                        UpdateDisplay();
                        OnAnySlotChanged?.Invoke();
                    }
                }
                return; // shift handled
            }

            // B) From Crafting Input/Output -> back to Inventory
            if (context == SlotContext.CraftingInput || context == SlotContext.CraftingOutput)
            {
                int qty = slot.quantity;
                int added = InventorySystem.Instance.AddAsMuchAsPossible(slot.item, qty);
                if (added > 0)
                {
                    slot.RemoveItem(added);
                    UpdateDisplay();

                    var openUI = CraftingUI.OpenInstance;
                    if (openUI != null) openUI.RefreshCraftingSlots();

                    OnAnySlotChanged?.Invoke();
                }
                return; // shift handled
            }
        }

        if (eventData.button == PointerEventData.InputButton.Right)
        {
            if (context == SlotContext.Hotbar)
            {
                InventorySystem.Instance.SelectHotbarSlot(slotIndex);
                return;
            }

            // Quick return from crafting slots to inventory
            if (context == SlotContext.CraftingInput || context == SlotContext.CraftingOutput)
            {
                var slot = ResolveSlot();
                if (slot != null && !slot.IsEmpty)
                {
                    if (InventorySystem.Instance.AddItem(slot.item, slot.quantity))
                    {
                        slot.Clear();
                        UpdateDisplay();
                        OnAnySlotChanged?.Invoke();
                    }
                }
            }
        }
        else if (eventData.button == PointerEventData.InputButton.Left)
        {
            if (context == SlotContext.Hotbar)
                InventorySystem.Instance.SelectHotbarSlot(slotIndex);
        }
    }

    public void OnBeginDrag(PointerEventData eventData)
    {
        if (!InputHandler.IsMapActive(ActionMap.UI)) return;

        var slot = ResolveSlot();
        if (slot == null || slot.IsEmpty) return;

        draggingFrom = this;

        Canvas canvas = GetComponentInParent<Canvas>();
        if (canvas == null) canvas = FindFirstObjectByType<Canvas>();
        if (canvas != null && DragVisualManager.Instance != null)
            DragVisualManager.Instance.StartDrag(slot.item.icon, slot.quantity, canvas, eventData.position);

        if (itemIcon != null) itemIcon.color = Color.clear;
        if (quantityText != null) quantityText.color = Color.clear;
        CacheBg();
    }

    public void OnDrag(PointerEventData eventData)
    {
        if (!InputHandler.IsMapActive(ActionMap.UI)) return;

        Canvas canvas = GetComponentInParent<Canvas>();
        if (canvas == null) canvas = FindFirstObjectByType<Canvas>();
        if (canvas != null && DragVisualManager.Instance != null)
            DragVisualManager.Instance.UpdatePosition(canvas, eventData.position);
    }

    public void OnEndDrag(PointerEventData eventData)
    {
        if (!InputHandler.IsMapActive(ActionMap.UI)) return;

        if (DragVisualManager.Instance != null)
            DragVisualManager.Instance.EndDrag();

        UpdateDisplay();
        draggingFrom = null;
        ResetHighlight();
    }

    public void OnDrop(PointerEventData eventData)
    {
        if (!InputHandler.IsMapActive(ActionMap.UI)) return;

        var from = eventData.pointerDrag?.GetComponent<InventorySlotUI>();
        if (from == null || from == this) { ResetHighlight(); return; }

        // anything that touches an OUTPUT is blocked (one-way)
        if (this.context == SlotContext.CraftingOutput || from.context == SlotContext.CraftingOutput)
        {
            ResetHighlight();
            return;
        }

        // Inventory/Hotbar <-> Inventory/Hotbar (swap)
        if (IsInvLike(from) && IsInvLike(this))
        {
            InventorySystem.Instance.MoveItem(
                from.slotIndex, from.isHotbar,
                this.slotIndex, this.isHotbar
            );
            from.UpdateDisplay();
            UpdateDisplay();
            ResetHighlight();
            return;
        }

        // Inventory -> CraftingInput (stack or swap if different item)
        if (IsInvLike(from) && IsCraftLike(this))
        {
            var toSlot = this.ResolveSlot();
            var fromSlot = from.ResolveSlot();

            if (toSlot != null && !toSlot.IsEmpty && fromSlot != null && !fromSlot.IsEmpty && toSlot.item != fromSlot.item)
            {
                // different item present ? swap contents
                SwapInventoryWithCrafting(from, this);
            }
            else
            {
                // same item or empty ? normal transfer/stack
                TransferFromInventoryToCrafting(from, this);
            }

            from.UpdateDisplay();
            UpdateDisplay();
            OnAnySlotChanged?.Invoke();
            ResetHighlight();
            return;
        }

        // Crafting -> Inventory (stack/return)
        if (IsCraftLike(from) && IsInvLike(this))
        {
            TransferFromCraftingToInventory(from, this);
            from.UpdateDisplay();
            UpdateDisplay();
            OnAnySlotChanged?.Invoke();
            ResetHighlight();
            return;
        }

        // Crafting <-> Crafting (swap references) — allowed for flexible inputs
        if (IsCraftLike(from) && IsCraftLike(this))
        {
            var tmp = from.craftingSlotRef;
            from.craftingSlotRef = this.craftingSlotRef;
            this.craftingSlotRef = tmp;
            from.UpdateDisplay();
            UpdateDisplay();
            OnAnySlotChanged?.Invoke();
            ResetHighlight();
        }
    }

    public void OnPointerEnter(PointerEventData eventData)
    {
        if (!InputHandler.IsMapActive(ActionMap.UI)) return;
        if (draggingFrom != null && draggingFrom != this && background != null)
            background.color = dragHighlightColor;
    }

    public void OnPointerExit(PointerEventData eventData)
    {
        if (!InputHandler.IsMapActive(ActionMap.UI)) return;
        ResetHighlight();
    }

    void ResetHighlight()
    {
        if (background == null) return;

        if (context == SlotContext.Hotbar &&
            InventorySystem.Instance.GetSelectedHotbarIndex() == slotIndex)
            background.color = selectedColor;
        else
            background.color = normalColor;
    }

    static bool IsInvLike(InventorySlotUI s) =>
        s.context == SlotContext.Inventory || s.context == SlotContext.Hotbar;

    static bool IsCraftLike(InventorySlotUI s) =>
        s.context == SlotContext.CraftingInput || s.context == SlotContext.CraftingOutput;

    static void SwapInventoryWithCrafting(InventorySlotUI inv, InventorySlotUI craft)
    {
        var invSlot = inv.ResolveSlot();
        var craftSlot = craft.ResolveSlot();
        if (invSlot == null || craftSlot == null) return;

        var tmpItem = invSlot.item; var tmpQty = invSlot.quantity;
        invSlot.item = craftSlot.item; invSlot.quantity = craftSlot.quantity;
        craftSlot.item = tmpItem; craftSlot.quantity = tmpQty;

        inv.UpdateDisplay();
        craft.UpdateDisplay();
        OnAnySlotChanged?.Invoke();
    }

    static void TransferFromInventoryToCrafting(InventorySlotUI from, InventorySlotUI to)
    {
        var fromSlot = from.ResolveSlot();
        var toSlot = to.ResolveSlot();
        if (fromSlot == null || toSlot == null || fromSlot.IsEmpty) return;

        if (toSlot.IsEmpty || toSlot.item == fromSlot.item)
        {
            int max = (toSlot.IsEmpty ? fromSlot.item.maxStackSize : toSlot.item.maxStackSize);
            int space = max - toSlot.quantity;
            if (space <= 0) return;

            int xfer = Mathf.Min(fromSlot.quantity, space);
            var removed = InventorySystem.Instance.RemoveItem(from.slotIndex, from.isHotbar, xfer);
            if (removed.quantity > 0)
                toSlot.AddItem(removed.item, removed.quantity);
        }
    }

    static void TransferFromCraftingToInventory(InventorySlotUI from, InventorySlotUI to)
    {
        var fromSlot = from.ResolveSlot();
        var toSlot = to.ResolveSlot();
        if (fromSlot == null || toSlot == null || fromSlot.IsEmpty) return;

        // Try stacking into target first
        if (toSlot.IsEmpty || toSlot.item == fromSlot.item)
        {
            int max = (toSlot.IsEmpty ? fromSlot.item.maxStackSize : toSlot.item.maxStackSize);
            int space = max - toSlot.quantity;
            if (space > 0)
            {
                int xfer = Mathf.Min(fromSlot.quantity, space);
                toSlot.AddItem(fromSlot.item, xfer);
                fromSlot.RemoveItem(xfer);
                return;
            }
        }

        // Otherwise push into general inventory
        if (InventorySystem.Instance.AddItem(fromSlot.item, fromSlot.quantity))
        {
            fromSlot.Clear();
        }
    }
}
