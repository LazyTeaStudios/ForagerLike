using TMPro;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class SlotUI : MonoBehaviour, IPointerClickHandler
{
    [SerializeField] Image iconImage;
    [SerializeField] TextMeshProUGUI quantityText;
    [SerializeField] Image outlineImage;
    [SerializeField] Color selectedColor = Color.yellow;

    int slotIndex;

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
}