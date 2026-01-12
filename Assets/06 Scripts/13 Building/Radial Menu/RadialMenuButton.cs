using UnityEngine;
using UnityEngine.UI;
using UnityEngine.Events;

public class RadialMenuButton : MonoBehaviour
{
    [SerializeField] private RawImage iconImage;
    [SerializeField] private Text label;

    string description;
    UnityAction storedAction;

    public string Label => label != null ? label.text : "";
    public string Description => description;
    public Texture Icon => iconImage != null ? iconImage.texture : null;

    public void Setup(string name, Texture2D icon, string description, UnityAction action)
    {
        if (label != null) label.text = name;
        if (iconImage != null && icon != null) iconImage.texture = icon;
        this.description = description ?? "";
        this.storedAction = action;
    }

    public void TriggerAction() => storedAction?.Invoke();

    public void SetHighlight(bool highlighted, Color normalColor, Color hoverColor, float normalScale, float hoverScale)
    {
        if (iconImage != null)
            iconImage.color = highlighted ? hoverColor : normalColor;
        transform.localScale = Vector3.one * (highlighted ? hoverScale : normalScale);
    }
}