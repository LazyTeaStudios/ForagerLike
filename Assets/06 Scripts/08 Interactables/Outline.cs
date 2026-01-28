using UnityEngine;

[DisallowMultipleComponent]
public class Outline : MonoBehaviour
{
    [SerializeField] Behaviour outlineEffect;

    void Awake()
    {
        if (outlineEffect != null)
            outlineEffect.enabled = false;
    }

    void OnEnable()
    {
        if (outlineEffect != null)
            outlineEffect.enabled = false;
    }

    public void SetHighlighted(bool highlighted)
    {
        if (outlineEffect != null)
            outlineEffect.enabled = highlighted;
    }
}
