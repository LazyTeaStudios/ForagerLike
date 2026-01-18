using UnityEngine;

public abstract class Interactable : MonoBehaviour
{
    [Header("Interactable Settings")]
    [SerializeField] protected bool usePlayerDataRange = true;
    [SerializeField] protected float customInteractRange = 5f;
    [SerializeField] protected Outline highlightComponent;

    [Header("Hover Scale Settings")]
    [SerializeField] protected float hoverScaleMultiplier = 1.1f;
    [SerializeField] protected float hoverLerpSpeed = 20f;

    protected bool isHighlighted;

    static int uiLockCount;
    bool hasUILock;

    public static bool IsUILocked => uiLockCount > 0;

    protected virtual void Awake()
    {
        SetupHighlight();
    }

    void SetupHighlight()
    {
        if (highlightComponent == null)
            highlightComponent = GetComponent<Outline>();
        if (highlightComponent == null)
            highlightComponent = gameObject.AddComponent<Outline>();

        highlightComponent.scaleMultiplier = hoverScaleMultiplier;
        highlightComponent.lerpSpeed = hoverLerpSpeed;
        highlightComponent.SetHighlighted(false);
    }

    protected void LockUI()
    {
        if (hasUILock) return;
        hasUILock = true;
        uiLockCount++;
    }

    protected void UnlockUI()
    {
        if (!hasUILock) return;
        hasUILock = false;
        uiLockCount = Mathf.Max(0, uiLockCount - 1);
    }

    public virtual void Interact() { }

    public virtual void SetHighlighted(bool highlighted)
    {
        if (isHighlighted == highlighted) return;

        if (highlighted && !isHighlighted)
            Sound.PlaySound("SFX_Hover_Outline", 0.05f, 0.3f);

        isHighlighted = highlighted;

        if (highlightComponent != null)
            highlightComponent.SetHighlighted(highlighted);
    }

    public float GetInteractRange()
    {
        if (usePlayerDataRange && PlayerDataHandler.Data != null)
            return PlayerDataHandler.Data.interactRange;
        return customInteractRange;
    }

    protected virtual void OnDestroy()
    {
        UnlockUI();
    }
}