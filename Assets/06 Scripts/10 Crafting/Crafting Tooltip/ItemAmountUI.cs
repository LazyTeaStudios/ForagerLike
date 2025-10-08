using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class ItemAmountUI : MonoBehaviour
{
    [Header("UI")]
    [SerializeField] private Image icon;
    [SerializeField] private TextMeshProUGUI amountText;

    /// <summary>
    /// Configure with an item and a quantity. If item is null, clears the view.
    /// </summary>
    public void Set(ItemData item, int quantity)
    {
        if (icon != null)
        {
            icon.sprite = item != null ? item.icon : null;
            icon.enabled = (item != null && item.icon != null);
        }

        if (amountText != null)
            amountText.text = (item != null && quantity > 0) ? quantity.ToString() : string.Empty;

        gameObject.SetActive(item != null && quantity > 0);
    }
}
