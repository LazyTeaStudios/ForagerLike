using UnityEngine;

public abstract class Interactable : MonoBehaviour
{
    [Header("Interactable Settings")]
    [SerializeField] protected float interactRange = 5f;

    [SerializeField] protected Outline outlineComponent; // our Outline script
    protected bool isHighlighted;

    protected virtual void Awake()
    {
        if (outlineComponent == null)
            outlineComponent = GetComponent<Outline>();

        if (outlineComponent == null)
            outlineComponent = gameObject.AddComponent<Outline>();

        // These now exist on the Outline script
        outlineComponent.OutlineMode = Outline.Mode.OutlineAll;
        outlineComponent.OutlineColor = Color.white;

        // Keep your original intent: width "3" maps to shader width ~0.03 via WidthToShaderScale=0.01
        outlineComponent.OutlineWidth = 3f;

        outlineComponent.enabled = false;
    }

    public virtual void Interact() { }

    public virtual void SetHighlighted(bool highlighted)
    {
        if (isHighlighted == highlighted) return;
        isHighlighted = highlighted;

        if (outlineComponent != null)
            outlineComponent.enabled = highlighted;
    }

    public float GetInteractRange() => interactRange;
}
