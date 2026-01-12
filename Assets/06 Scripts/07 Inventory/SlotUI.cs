using TMPro;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;
using System;

public class SlotUI : MonoBehaviour,
    IPointerClickHandler,
    IBeginDragHandler,
    IDragHandler,
    IEndDragHandler,
    IDropHandler
{
    [SerializeField] Image iconImage;
    [SerializeField] TextMeshProUGUI quantityText;
    [SerializeField] GameObject outlineImage;
    [SerializeField] Color selectedColor = Color.yellow;

    int slotIndex;
    bool isHotbar;

    Func<InventorySlot> customSlotProvider;
    Action<int, int> customSwapHandler;

    static int draggingFromIndex = -1;
    static bool isDragging = false;
    static bool draggingFromHotbar = false;
    static SlotUI dragSource;

    public void Setup(int index, bool hotbar)
    {
        slotIndex = index;
        isHotbar = hotbar;
        UpdateDisplay();
    }

    public void SetCustomSlotProvider(Func<InventorySlot> provider)
    {
        customSlotProvider = provider;
    }

    public void SetSwapHandler(Action<int, int> handler)
    {
        customSwapHandler = handler;
    }

    InventorySlot GetSlot()
    {
        if (customSlotProvider != null)
            return customSlotProvider();

        if (isHotbar)
            return InventoryManager.Instance.GetHotbarSlot(slotIndex);

        return null;
    }

    public void UpdateDisplay()
    {
        InventorySlot slot = GetSlot();
        bool isEmpty = slot == null || slot.IsEmpty();

        if (iconImage)
        {
            iconImage.enabled = !isEmpty;
            if (!isEmpty) iconImage.sprite = slot.item.icon;
        }

        if (quantityText)
            quantityText.text = isEmpty || slot.quantity <= 1 ? "" : slot.quantity.ToString();
    }

    public void SetSelected(bool selected)
    {
        if (outlineImage)
            outlineImage.SetActive(selected);
    }

    public void OnPointerClick(PointerEventData eventData)
    {
        if (eventData.button == PointerEventData.InputButton.Left && isHotbar)
            InventoryManager.Instance.SelectHotbarSlot(slotIndex);
    }

    public void OnBeginDrag(PointerEventData eventData)
    {
        if (eventData.button != PointerEventData.InputButton.Left) return;

        InventorySlot slot = GetSlot();
        if (slot == null || slot.IsEmpty()) return;

        draggingFromIndex = slotIndex;
        isDragging = true;
        draggingFromHotbar = isHotbar;
        dragSource = this;

        if (DragVisualManager.Instance != null)
            DragVisualManager.Instance.StartDrag(slot.item.icon, slot.quantity, eventData.position);
    }

    public void OnDrag(PointerEventData eventData)
    {
        if (!isDragging) return;

        if (DragVisualManager.Instance != null)
            DragVisualManager.Instance.UpdatePosition(eventData.position);
    }

    public void OnEndDrag(PointerEventData eventData)
    {
        if (!isDragging) return;

        isDragging = false;
        draggingFromIndex = -1;
        draggingFromHotbar = false;
        dragSource = null;

        if (DragVisualManager.Instance != null)
            DragVisualManager.Instance.EndDrag();
    }

    public void OnDrop(PointerEventData eventData)
    {
        if (!isDragging || dragSource == null) return;
        if (draggingFromIndex < 0) return;

        InventorySlot sourceSlot = dragSource.GetSlot();
        InventorySlot targetSlot = GetSlot();

        if (sourceSlot == null || targetSlot == null) return;

        /// Swap the items
        ItemData tempItem = sourceSlot.item;
        int tempQty = sourceSlot.quantity;

        sourceSlot.Set(targetSlot.item, targetSlot.quantity);
        targetSlot.Set(tempItem, tempQty);

        /// Update displays
        dragSource.UpdateDisplay();
        UpdateDisplay();

        /// Trigger inventory events if hotbar was involved
        if (draggingFromHotbar || isHotbar)
        {
            InventoryManager.Instance.OnInventoryChanged?.Invoke();
        }

        isDragging = false;
        draggingFromIndex = -1;
        draggingFromHotbar = false;
        dragSource = null;

        if (DragVisualManager.Instance != null)
            DragVisualManager.Instance.EndDrag();
    }
}