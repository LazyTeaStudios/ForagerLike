using UnityEngine;
using TMPro;
using UnityEngine.UI;

public class DragVisualManager : MonoBehaviour
{
    public static DragVisualManager Instance { get; private set; }

    [Header("Settings")]
    [SerializeField] TMP_FontAsset fontAsset;
    [SerializeField] Vector2 visualSize = new Vector2(51, 51);
    [SerializeField] int fontSize = 32;

    GameObject dragVisual;
    Image dragIcon;
    TextMeshProUGUI quantityText;

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

    void CreateDragVisual()
    {
        // Container
        dragVisual = new GameObject("DragVisual");
        dragVisual.transform.SetParent(transform);

        var rect = dragVisual.AddComponent<RectTransform>();
        rect.sizeDelta = visualSize;

        // Canvas for rendering on top
        var canvas = dragVisual.AddComponent<Canvas>();
        canvas.overrideSorting = true;
        canvas.sortingOrder = 100;

        var canvasGroup = dragVisual.AddComponent<CanvasGroup>();
        canvasGroup.blocksRaycasts = false;

        // Icon
        GameObject iconObj = new GameObject("Icon");
        iconObj.transform.SetParent(dragVisual.transform);

        var iconRect = iconObj.AddComponent<RectTransform>();
        iconRect.anchorMin = Vector2.zero;
        iconRect.anchorMax = Vector2.one;
        iconRect.offsetMin = Vector2.zero;
        iconRect.offsetMax = Vector2.zero;

        dragIcon = iconObj.AddComponent<Image>();
        dragIcon.raycastTarget = false;

        // Quantity text
        GameObject quantityObj = new GameObject("Quantity");
        quantityObj.transform.SetParent(dragVisual.transform);

        var quantityRect = quantityObj.AddComponent<RectTransform>();
        quantityRect.anchorMin = new Vector2(1, 0);
        quantityRect.anchorMax = new Vector2(1, 0);
        quantityRect.pivot = new Vector2(1, 0);
        quantityRect.anchoredPosition = new Vector2(8, -12);

        quantityText = quantityObj.AddComponent<TextMeshProUGUI>();
        quantityText.fontSize = fontSize;
        quantityText.font = fontAsset;
        quantityText.color = Color.white;
        quantityText.alignment = TextAlignmentOptions.BottomRight;
        quantityText.raycastTarget = false;

        dragVisual.SetActive(false);
    }

    public void StartDrag(Sprite icon, int quantity, Canvas canvas, Vector2 screenPosition)
    {
        if (!dragVisual || !canvas) return;

        dragIcon.sprite = icon;
        quantityText.text = quantity > 1 ? quantity.ToString() : "";
        quantityText.gameObject.SetActive(quantity > 1);

        dragVisual.transform.SetParent(canvas.transform);
        dragVisual.transform.SetAsLastSibling();
        UpdatePosition(canvas, screenPosition);
        dragVisual.SetActive(true);
    }

    public void UpdateQuantity(int quantity)
    {
        if (!dragVisual.activeInHierarchy) return;

        quantityText.text = quantity > 1 ? quantity.ToString() : "";
        quantityText.gameObject.SetActive(quantity > 1);
    }

    public void UpdatePosition(Canvas canvas, Vector2 screenPosition)
    {
        if (!dragVisual.activeInHierarchy) return;

        RectTransformUtility.ScreenPointToLocalPointInRectangle(
            canvas.transform as RectTransform,
            screenPosition,
            canvas.worldCamera,
            out Vector2 localPoint
        );

        dragVisual.transform.localPosition = localPoint;
    }

    public void EndDrag()
    {
        dragVisual.SetActive(false);
        dragVisual.transform.SetParent(transform);
    }
}