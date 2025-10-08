using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class DragVisualManager : MonoBehaviour
{
    public static DragVisualManager Instance { get; private set; }

    [SerializeField] GameObject dragVisualPrefab;
    [SerializeField] Canvas overlayCanvas;

    GameObject activeDragVisual;
    Image dragIcon;
    TextMeshProUGUI quantityText;

    void Awake()
    {
        Instance = this;
    }

    public void StartDrag(Sprite icon, int quantity, Vector2 screenPosition)
    {
        if (activeDragVisual == null)
        {
            activeDragVisual = Instantiate(dragVisualPrefab, overlayCanvas.transform);
            dragIcon = activeDragVisual.GetComponentInChildren<Image>();
            quantityText = activeDragVisual.GetComponentInChildren<TextMeshProUGUI>();
        }

        dragIcon.sprite = icon;
        quantityText.text = quantity > 1 ? quantity.ToString() : "";

        UpdatePosition(screenPosition);
        activeDragVisual.SetActive(true);
    }

    public void UpdatePosition(Vector2 screenPosition)
    {
        if (activeDragVisual == null) return;

        RectTransformUtility.ScreenPointToLocalPointInRectangle(
            overlayCanvas.transform as RectTransform,
            screenPosition,
            overlayCanvas.worldCamera,
            out Vector2 localPoint
        );

        activeDragVisual.transform.localPosition = localPoint;
    }

    public void EndDrag()
    {
        if (activeDragVisual != null)
            activeDragVisual.SetActive(false);
    }
}