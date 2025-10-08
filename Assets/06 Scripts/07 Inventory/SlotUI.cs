using TMPro;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class SlotUI : MonoBehaviour, IPointerClickHandler, IBeginDragHandler, IDragHandler, IEndDragHandler, IDropHandler
{
    [SerializeField] Image iconImage;
    [SerializeField] TextMeshProUGUI quantityText;
    [SerializeField] Image outlineImage;
    [SerializeField] Color selectedColor = Color.yellow;

    int slotIndex;
    bool isHotbar;

    static SlotUI dragSource;
    bool isGhosted;

    public void Setup(int index, bool hotbar)
    {
        slotIndex = index;
        isHotbar = hotbar;
        UpdateDisplay();
    }

    public void UpdateDisplay()
    {
        InventorySlot slot = GetSlot();
        bool isEmpty = isGhosted || slot == null || slot.IsEmpty();

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

    InventorySlot GetSlot() => isHotbar
        ? InventoryManager.Instance.GetHotbarSlot(slotIndex)
        : InventoryManager.Instance.GetInventorySlot(slotIndex);

    public void OnPointerClick(PointerEventData eventData)
    {
        if (isHotbar && eventData.button == PointerEventData.InputButton.Left)
            InventoryManager.Instance.SelectHotbarSlot(slotIndex);
    }

    public void OnBeginDrag(PointerEventData eventData)
    {
        InventorySlot slot = GetSlot();
        if (slot == null || slot.IsEmpty()) return;

        dragSource = this;
        isGhosted = true;
        UpdateDisplay();

        DragVisualManager.Instance?.StartDrag(slot.item.icon, slot.quantity, eventData.position);
    }

    public void OnDrag(PointerEventData eventData)
    {
        DragVisualManager.Instance?.UpdatePosition(eventData.position);
    }

    public void OnEndDrag(PointerEventData eventData)
    {
        DragVisualManager.Instance?.EndDrag();

        if (dragSource == this)
        {
            isGhosted = false;
            UpdateDisplay();
        }

        dragSource = null;
    }

    public void OnDrop(PointerEventData eventData)
    {
        if (dragSource == null || dragSource == this) return;

        InventoryManager.Instance.MergeOrSwapSlots(
            dragSource.slotIndex, dragSource.isHotbar,
            slotIndex, isHotbar
        );

        dragSource.isGhosted = false;
        dragSource.UpdateDisplay();
        UpdateDisplay();
    }
}