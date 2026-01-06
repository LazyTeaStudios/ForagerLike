using TMPro;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class SlotUI : MonoBehaviour,
    IPointerClickHandler,
    IBeginDragHandler,
    IDragHandler,
    IEndDragHandler,
    IDropHandler
{
    [SerializeField] Image iconImage;
    [SerializeField] TextMeshProUGUI quantityText;
    [SerializeField] Image outlineImage;
    [SerializeField] Color selectedColor = Color.yellow;

    int slotIndex;

    // Shared drag state across all slots
    private static int draggingFromIndex = -1;
    private static bool isDragging = false;

    public void Setup(int index, bool hotbar)
    {
        slotIndex = index;
        UpdateDisplay();
    }

    public void UpdateDisplay()
    {
        InventorySlot slot = InventoryManager.Instance.GetHotbarSlot(slotIndex);
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
        {
            outlineImage.enabled = selected;
            outlineImage.color = selectedColor;
        }
    }

    public void OnPointerClick(PointerEventData eventData)
    {
        if (eventData.button == PointerEventData.InputButton.Left)
            InventoryManager.Instance.SelectHotbarSlot(slotIndex);
    }

    public void OnBeginDrag(PointerEventData eventData)
    {
        if (eventData.button != PointerEventData.InputButton.Left) return;

        InventorySlot slot = InventoryManager.Instance.GetHotbarSlot(slotIndex);
        if (slot == null || slot.IsEmpty()) return;

        draggingFromIndex = slotIndex;
        isDragging = true;

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

        if (DragVisualManager.Instance != null)
            DragVisualManager.Instance.EndDrag();
    }

    public void OnDrop(PointerEventData eventData)
    {
        if (!isDragging) return;
        if (draggingFromIndex < 0) return;

        // Swap the dragged slot with this slot
        InventoryManager.Instance.SwapHotbarSlots(draggingFromIndex, slotIndex);

        // End drag visual immediately
        isDragging = false;
        draggingFromIndex = -1;

        if (DragVisualManager.Instance != null)
            DragVisualManager.Instance.EndDrag();
    }
}
