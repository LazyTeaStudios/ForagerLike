using UnityEngine;

[DisallowMultipleComponent]
public class Outline : MonoBehaviour
{
    [Header("Visual Outline")]
    [SerializeField] Behaviour outlineEffect;
    [SerializeField] bool useScalePop = true;

    [Header("Scale Pop")]
    public float scaleMultiplier = 1.1f;
    public float lerpSpeed = 20f;

    Vector3 _baseScale;
    Vector3 _targetScale;
    bool _highlighted;

    void Awake()
    {
        if (outlineEffect == null)
            outlineEffect = GetComponent<Behaviour>();

        _baseScale = transform.localScale;
        _targetScale = _baseScale;

        if (outlineEffect != null)
            outlineEffect.enabled = false;
    }

    void OnEnable()
    {
        _baseScale = transform.localScale;
        _targetScale = _baseScale;
        _highlighted = false;

        if (outlineEffect != null)
            outlineEffect.enabled = false;
    }

    public void SetHighlighted(bool highlighted)
    {
        _highlighted = highlighted;

        if (outlineEffect != null)
            outlineEffect.enabled = highlighted;

        if (!useScalePop)
            return;

        _targetScale = _baseScale * (highlighted ? scaleMultiplier : 1f);
    }

    void Update()
    {
        if (!useScalePop)
            return;

        float t = 1f - Mathf.Exp(-lerpSpeed * Time.deltaTime);
        transform.localScale = Vector3.Lerp(transform.localScale, _targetScale, t);
    }
}
