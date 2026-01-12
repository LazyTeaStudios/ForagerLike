using UnityEngine;

public abstract class Interactable : MonoBehaviour
{
    [Header("Interactable Settings")]
    [SerializeField] protected bool usePlayerDataRange = true;
    [SerializeField] protected float customInteractRange = 5f;
    [SerializeField] protected Outline outlineComponent;

    protected bool isHighlighted;

    static int uiLockCount;
    bool uiLockAcquired;

    public static bool IsUIOpen => uiLockCount > 0;

    protected virtual void Awake()
    {
        SetupOutline();
    }

    void SetupOutline()
    {
        if (outlineComponent == null)
            outlineComponent = GetComponent<Outline>();
        if (outlineComponent == null)
            outlineComponent = gameObject.AddComponent<Outline>();

        outlineComponent.OutlineMode = Outline.Mode.OutlineAll;
        outlineComponent.OutlineColor = Color.white;
        outlineComponent.OutlineWidth = 3f;
        outlineComponent.enabled = false;
    }

    protected void AcquireUILock()
    {
        if (uiLockAcquired) return;
        uiLockAcquired = true;
        uiLockCount++;
    }

    protected void ReleaseUILock()
    {
        if (!uiLockAcquired) return;
        uiLockAcquired = false;
        uiLockCount = Mathf.Max(0, uiLockCount - 1);
    }

    public virtual void Interact() { }

    public virtual void SetHighlighted(bool highlighted)
    {
        if (isHighlighted == highlighted) return;
        isHighlighted = highlighted;
        if (outlineComponent != null)
            outlineComponent.enabled = highlighted;
    }

    public float GetInteractRange()
    {
        if (usePlayerDataRange && PlayerDataHandler.Data != null)
            return PlayerDataHandler.Data.interactRange;
        return customInteractRange;
    }

    protected virtual void OnDestroy()
    {
        ReleaseUILock();
    }
}
