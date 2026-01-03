using UnityEngine;
using UnityEngine.UI;
using UnityEngine.Events;

public class RadialMenuButton : MonoBehaviour
{
    [SerializeField] private RawImage iconImage;
    [SerializeField] private Text label;
    
    private string description;
    
    public string Label => label != null ? label.text : "";
    public string Description => description;
    public Texture Icon => iconImage != null ? iconImage.texture : null;
    public UnityAction OnClick;
    
    public void Setup(string name, Texture2D icon, string description, UnityAction action)
    {
        if (label != null) label.text = name;
        if (iconImage != null && icon != null) iconImage.texture = icon;
        this.description = description ?? "";
        OnClick = action;
    }
    
    public void SetHighlight(bool highlighted, Color normalColor, Color hoverColor, float normalScale, float hoverScale)
    {
        if (iconImage != null) iconImage.color = highlighted ? hoverColor : normalColor;
        transform.localScale = Vector3.one * (highlighted ? hoverScale : normalScale);
    }
}
