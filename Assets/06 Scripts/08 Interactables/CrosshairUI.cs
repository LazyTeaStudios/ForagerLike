using UnityEngine;
using UnityEngine.UI;

public class CrosshairUI : MonoBehaviour
{
    [SerializeField] Image image;
    [SerializeField] Sprite normalSprite;
    [SerializeField] Sprite hoverSprite;
    [SerializeField] float normalScale = 0.1f;
    [SerializeField] float hoverScale = 0.5f;
    [SerializeField] float lerpSpeed = 20f;

    [SerializeField] GameObject hoverObject;

    Vector3 targetScale;
    bool isHovering;

    void Awake()
    {
        if (image == null)
            image = GetComponent<Image>();

        transform.localScale = Vector3.one * normalScale;
        targetScale = transform.localScale;

        SetHover(false);
        hoverObject.SetActive(false);
    }

    public void SetHover(bool hovering)
    {
        if (isHovering == hovering)
            return;

        isHovering = hovering;

        if (image != null)
            image.sprite = hovering ? hoverSprite : normalSprite;

        float s = hovering ? hoverScale : normalScale;
        targetScale = Vector3.one * s;

        if (hoverObject != null)
            hoverObject.SetActive(hovering);
    }

    void Update()
    {
        float t = 1f - Mathf.Exp(-lerpSpeed * Time.deltaTime);
        transform.localScale = Vector3.Lerp(transform.localScale, targetScale, t);
    }
}
