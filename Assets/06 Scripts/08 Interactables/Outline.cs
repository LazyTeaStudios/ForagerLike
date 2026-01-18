using UnityEngine;

[DisallowMultipleComponent]
public class Outline : MonoBehaviour
{
    public float scaleMultiplier = 1.1f;
    public float lerpSpeed = 20f;

    Vector3 _baseScale;
    Vector3 _targetScale;
    bool _highlighted;

    void Awake()
    {
        _baseScale = transform.localScale;
        _targetScale = _baseScale;
    }

    public void SetHighlighted(bool highlighted)
    {
        if (_highlighted == highlighted) return;

        _highlighted = highlighted;
        _targetScale = _baseScale * (_highlighted ? scaleMultiplier : 1f);

        
    }

    void OnEnable()
    {
        _baseScale = transform.localScale;
        _targetScale = _baseScale;
        _highlighted = false;
    }

    void Update()
    {
        float t = 1f - Mathf.Exp(-lerpSpeed * Time.deltaTime);
        transform.localScale = Vector3.Lerp(transform.localScale, _targetScale, t);
    }
}
