using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;

/// <summary>
/// Shows an outline Image when hovering.
/// The outline is always visible, regardless of button state.
/// </summary>
[RequireComponent(typeof(Button))]
public class UIButtonOutline : MonoBehaviour, IPointerEnterHandler, IPointerExitHandler
{
    [Header("Outline")]
    [SerializeField] private Image outline;

    private Button button;

    private void Awake()
    {
        button = GetComponent<Button>();
        if (outline == null)
        {
            var t = transform.Find("Outline");
            if (t) outline = t.GetComponent<Image>();
        }

        // Start with outline hidden
        SetOutlineActive(false);
    }

    private void OnEnable()
    {
        SetOutlineActive(false);
    }

    public void OnPointerEnter(PointerEventData eventData)
    {
        SetOutlineActive(true);
    }

    public void OnPointerExit(PointerEventData eventData)
    {
        SetOutlineActive(false);
    }

    private void SetOutlineActive(bool active)
    {
        if (outline != null && outline.gameObject.activeSelf != active)
            outline.gameObject.SetActive(active);
    }

    // Legacy methods for compatibility - do nothing now
    public void SetSelected(bool selected) { }
    public void SetPersistWhenSelected(bool persist) { }
}