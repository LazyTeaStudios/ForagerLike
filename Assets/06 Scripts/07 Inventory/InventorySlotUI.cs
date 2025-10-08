using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;
using TMPro;

public class SlotUI : MonoBehaviour, IPointerClickHandler, IBeginDragHandler, IEndDragHandler, IDropHandler
{
    [Header("UI Elements")]
    [SerializeField] Image iconImage;
    [SerializeField] TextMeshProUGUI quantityText;
    [SerializeField] Image backgroundImage;

    [Header("Colors")]
    [SerializeField] Color normalColor = Color.white;
    [SerializeField] Color selectedColor = Color.yellow;

    int slotIndex;
    bool isHotbar;

    static SlotUI dragSource;

    public void Setup(int index, bool hotbar)
    {
        slotIndex = index;
        isHotbar = hotbar;
        UpdateDisplay();
    }

    public void UpdateDisplay()
    {
        InventorySlot slot = GetSlot();

        if (slot == null || slot.IsEmpty())
        {
            iconImage.enabled = false;
            quantityText.text = "";
        }
        else
        {
            iconImage.enabled = true;
            iconImage.sprite = slot.item.icon;
            quantityText.text = slot.quantity > 1 ? slot.quantity.ToString() : "";
        }
    }

    public void SetSelected(bool selected)
    {
        if (backgroundImage != null)
        {
            backgroundImage.color = selected ? selectedColor : normalColor;
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
    }

    public void OnEndDrag(PointerEventData eventData)
    {
        dragSource = null;
    }

    public void OnDrop(PointerEventData eventData)
    {
        if (dragSource == null || dragSource == this) return;

        InventoryManager.Instance.SwapSlots(
            dragSource.slotIndex, dragSource.isHotbar,
            this.slotIndex, this.isHotbar
        );

        dragSource.UpdateDisplay();
        this.UpdateDisplay();
    }
}