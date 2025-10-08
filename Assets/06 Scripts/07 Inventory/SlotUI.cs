using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;
using TMPro;

public class SlotUI : MonoBehaviour, IPointerClickHandler, IBeginDragHandler, IDragHandler, IEndDragHandler, IDropHandler
{
    [Header("UI Elements")]
    [SerializeField] Image iconImage;
    [SerializeField] TextMeshProUGUI quantityText;
    [SerializeField] Image outlineImage;

    [Header("Colors")]
    [SerializeField] Color normalColor = Color.white;
    [SerializeField] Color selectedColor = Color.yellow;

    int slotIndex;
    bool isHotbar;
    Canvas canvas;

    // Drag context (shared across all SlotUI)
    static SlotUI dragSource;
    static bool dropHandled;

    // Local visual state
    bool isGhosted; // when true, render as empty while dragging from this slot

    void Awake()
    {
        canvas = GetComponentInParent<Canvas>();
    }

    public void Setup(int index, bool hotbar)
    {
        slotIndex = index;
        isHotbar = hotbar;
        UpdateDisplay();
    }

    public void UpdateDisplay()
    {
        // If ghosted, show as visually empty without touching data
        if (isGhosted)
        {
            if (iconImage) iconImage.enabled = false;
            if (quantityText) quantityText.text = "";
            return;
        }

        InventorySlot slot = GetSlot();
        if (slot == null || slot.IsEmpty())
        {
            if (iconImage) iconImage.enabled = false;
            if (quantityText) quantityText.text = "";
        }
        else
        {
            if (iconImage)
            {
                iconImage.enabled = true;
                iconImage.sprite = slot.item.icon;
                iconImage.raycastTarget = false; // avoid blocking OnDrop
            }
            if (quantityText)
            {
                quantityText.text = slot.quantity > 1 ? slot.quantity.ToString() : "";
                quantityText.raycastTarget = false; // avoid blocking OnDrop
            }
        }
    }

    public void SetSelected(bool selected)
    {
        if (outlineImage != null)
        {
            outlineImage.enabled = selected;
        }
    }

    InventorySlot GetSlot()
    {
        if (isHotbar)
            return InventoryManager.Instance.GetHotbarSlot(slotIndex);
        else
            return InventoryManager.Instance.GetInventorySlot(slotIndex);
    }

    public void OnPointerClick(PointerEventData eventData)
    {
        if (isHotbar && eventData.button == PointerEventData.InputButton.Left)
        {
            InventoryManager.Instance.SelectHotbarSlot(slotIndex);
        }
    }

    public void OnBeginDrag(PointerEventData eventData)
    {
        InventorySlot slot = GetSlot();
        if (slot == null || slot.IsEmpty()) return;

        dragSource = this;
        dropHandled = false;

        // Ghost-out the source slot visually so only one stack appears (the drag visual)
        isGhosted = true;
        UpdateDisplay();

        if (DragVisualManager.Instance != null && canvas != null)
        {
            DragVisualManager.Instance.StartDrag(slot.item.icon, slot.quantity, canvas, eventData.position);
        }
    }

    public void OnDrag(PointerEventData eventData)
    {
        if (dragSource == null) return;

        if (DragVisualManager.Instance != null && canvas != null)
        {
            DragVisualManager.Instance.UpdatePosition(canvas, eventData.position);
        }
    }

    public void OnEndDrag(PointerEventData eventData)
    {
        if (DragVisualManager.Instance != null)
        {
            DragVisualManager.Instance.EndDrag();
        }

        // If no slot handled OnDrop, restore source visuals
        if (!dropHandled && dragSource == this)
        {
            isGhosted = false;
            UpdateDisplay();
        }

        // Clear drag context next frame to avoid racing OnDrop
        if (gameObject.activeInHierarchy)
            StartCoroutine(ClearDragNextFrame());
    }

    System.Collections.IEnumerator ClearDragNextFrame()
    {
        yield return null;
        dragSource = null;
        dropHandled = false;
    }

    public void OnDrop(PointerEventData eventData)
    {
        if (dragSource == null) return;

        if (dragSource == this)
        {
            // Dropped back onto itself — just unghost and bail
            dragSource.isGhosted = false;
            dragSource.UpdateDisplay();
            dropHandled = true;
            return;
        }

        // Merge if possible, else move/swap
        InventoryManager.Instance.MergeOrSwapSlots(
            dragSource.slotIndex, dragSource.isHotbar,
            this.slotIndex, this.isHotbar
        );

        // Clear ghosting and refresh visuals
        dragSource.isGhosted = false;
        this.isGhosted = false;

        dragSource.UpdateDisplay();
        this.UpdateDisplay();

        dropHandled = true;
    }

}
