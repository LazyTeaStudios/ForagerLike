using UnityEngine;
using TMPro;
using UnityEngine.UI;

public class DragVisualManager : MonoBehaviour
{
    public static DragVisualManager Instance { get; private set; }

    public TMP_FontAsset fontAsset;

    private GameObject dragVisual;
    private Image dragIcon;
    private TextMeshProUGUI dragQuantityText;
    private CanvasGroup dragCanvasGroup;

    /// summary
    /// Sets singleton and creates visual
    /// summary
    void Awake()
    {
        if (Instance != null)
        {
            Destroy(gameObject);
            return;
        }

        Instance = this;
        CreateDragVisual();
        DontDestroyOnLoad(gameObject);
    }

    /// summary
    /// Constructs the floating drag ui
    /// summary
    void CreateDragVisual()
    {
        dragVisual = new GameObject("DragVisual");
        dragVisual.transform.SetParent(transform);
        var containerRect = dragVisual.AddComponent<RectTransform>();
        containerRect.sizeDelta = new Vector2(51, 51);

        var dragCanvas = dragVisual.AddComponent<Canvas>();
        dragCanvas.overrideSorting = true;
        dragCanvas.sortingOrder = 100;

        dragCanvasGroup = dragVisual.AddComponent<CanvasGroup>();
        dragCanvasGroup.alpha = 1f;
        dragCanvasGroup.blocksRaycasts = false;

        var iconObj = new GameObject("Icon");
        iconObj.transform.SetParent(dragVisual.transform);
        var iconRect = iconObj.AddComponent<RectTransform>();
        iconRect.anchorMin = Vector2.zero;
        iconRect.anchorMax = Vector2.one;
        iconRect.offsetMin = Vector2.zero;
        iconRect.offsetMax = Vector2.zero;
        dragIcon = iconObj.AddComponent<Image>();
        dragIcon.raycastTarget = false;

        var quantityObj = new GameObject("Quantity");
        quantityObj.transform.SetParent(dragVisual.transform);
        var quantityRect = quantityObj.AddComponent<RectTransform>();
        quantityRect.anchorMin = new Vector2(1, 0);
        quantityRect.anchorMax = new Vector2(1, 0);
        quantityRect.pivot = new Vector2(1, 0);
        quantityRect.anchoredPosition = new Vector2(-2, 2);
        quantityRect.sizeDelta = new Vector2(30, 20);

        dragQuantityText = quantityObj.AddComponent<TextMeshProUGUI>();
        dragQuantityText.fontSize = 32;
        dragQuantityText.font = fontAsset;
        dragQuantityText.color = Color.white;
        dragQuantityText.raycastTarget = false;
        dragQuantityText.alignment = TextAlignmentOptions.BottomRight;

        dragVisual.SetActive(false);
    }

    /// summary
    /// Shows the visual at a position
    /// summary
    public void StartDrag(Sprite icon, int quantity, Canvas canvas, Vector2 screenPosition)
    {
        dragIcon.sprite = icon;

        if (quantity > 1)
        {
            dragQuantityText.text = quantity.ToString();
            dragQuantityText.gameObject.SetActive(true);
        }
        else
        {
            dragQuantityText.gameObject.SetActive(false);
        }

        dragVisual.transform.SetParent(canvas.transform);
        dragVisual.transform.SetAsLastSibling();
        UpdatePosition(canvas, screenPosition);
        dragVisual.SetActive(true);
    }

    /// summary
    /// Update the shown stack size during drag
    /// summary
    public void UpdateQuantity(int quantity)
    {
        if (!dragVisual.activeInHierarchy) return;

        if (quantity > 1)
        {
            dragQuantityText.text = quantity.ToString();
            dragQuantityText.gameObject.SetActive(true);
        }
        else
        {
            // 0 or 1: hide the number for a single
            dragQuantityText.gameObject.SetActive(false);
        }
    }

    /// summary
    /// Moves the visual with cursor
    /// summary
    public void UpdatePosition(Canvas canvas, Vector2 screenPosition)
    {
        if (!dragVisual.activeInHierarchy) return;

        Vector2 localPoint;
        RectTransformUtility.ScreenPointToLocalPointInRectangle(canvas.transform as RectTransform, screenPosition, canvas.worldCamera, out localPoint);
        dragVisual.transform.localPosition = localPoint;
    }

    /// summary
    /// Hides and detaches the visual
    /// summary
    public void EndDrag()
    {
        dragVisual.SetActive(false);
        dragVisual.transform.SetParent(transform);
    }
}
