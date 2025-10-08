using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;

/// <summary>
/// Shows an outline Image when hovering. If persistWhenSelected is true, the outline
/// remains visible when selected (even if the Button becomes non-interactable).
/// Hover highlighting is disabled while the Button is not interactable.
/// </summary>
[RequireComponent(typeof(Button))]
public class UIButtonOutline : MonoBehaviour, IPointerEnterHandler, IPointerExitHandler
{
    [Header("Outline")]
    [Tooltip("Outline image to toggle (child). If left null, tries to find a child named 'Outline'.")]
    [SerializeField] private Image outline;

    [Tooltip("If true, the outline stays visible when selected via SetSelected(true).")]
    [SerializeField] private bool persistWhenSelected = false;

    private bool isSelected;
    private Button button;

    private bool IsInteractable => button == null || button.interactable;

    private void Awake()
    {
        button = GetComponent<Button>();
        if (outline == null)
        {
            var t = transform.Find("Outline");
            if (t) outline = t.GetComponent<Image>();
        }
        RefreshOutline();
    }

    private void OnEnable() => RefreshOutline();

    public void OnPointerEnter(PointerEventData eventData)
    {
        // No hover when disabled/locked
        if (!IsInteractable) return;

        if (!persistWhenSelected || !isSelected)
            SetOutlineActive(true);
    }

    public void OnPointerExit(PointerEventData eventData)
    {
        // No hover when disabled/locked
        if (!IsInteractable) return;

        if (!persistWhenSelected || !isSelected)
            SetOutlineActive(false);
    }

    /// <summary>
    /// Called by owner to toggle selection state. If persist is enabled, the outline will
    /// remain on even while the Button is disabled.
    /// </summary>
    public void SetSelected(bool selected)
    {
        if (!persistWhenSelected)
        {
            isSelected = false;
            RefreshOutline();
            return;
        }

        isSelected = selected;
        RefreshOutline();
    }

    /// <summary>
    /// Switch between hover-only and persistent selection behavior.
    /// </summary>
    public void SetPersistWhenSelected(bool persist)
    {
        persistWhenSelected = persist;
        if (!persistWhenSelected) isSelected = false;
        RefreshOutline();
    }

    private void RefreshOutline()
    {
        if (outline == null) return;

        // If persistent & selected, show regardless of interactable state (gives "locked" feel)
        if (persistWhenSelected && isSelected)
        {
            SetOutlineActive(true);
            return;
        }

        // Otherwise: idle state keeps outline off (hover will toggle only if interactable)
        SetOutlineActive(false);
    }

    private void SetOutlineActive(bool active)
    {
        if (outline != null && outline.gameObject.activeSelf != active)
            outline.gameObject.SetActive(active);
    }
}
