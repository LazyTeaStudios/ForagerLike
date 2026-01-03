using UnityEngine;
using UnityEngine.UI;
using UnityEngine.Events;

public class RadialMenuButton : MonoBehaviour
{
    [SerializeField] private Button button;
    [SerializeField] private RawImage iconImage;
    [SerializeField] private Text label;

    private string description;
    private UnityAction storedAction;

    public string Label => label != null ? label.text : "";
    public string Description => description;
    public Texture Icon => iconImage != null ? iconImage.texture : null;

    private void Awake()
    {
        if (button == null)
            button = GetComponent<Button>();

        // Disable the button's raycast target so it doesn't intercept clicks
        if (button != null)
        {
            button.interactable = false; // Disable normal button interaction
        }
    }

    public void Setup(string name, Texture2D icon, string description, UnityAction action)
    {
        if (label != null) label.text = name;
        if (iconImage != null && icon != null) iconImage.texture = icon;
        this.description = description ?? "";
        this.storedAction = action;
    }

    public void TriggerAction()
    {
        storedAction?.Invoke();
    }

    public void SetHighlight(bool highlighted, Color normalColor, Color hoverColor, float normalScale, float hoverScale)
    {
        if (iconImage != null) iconImage.color = highlighted ? hoverColor : normalColor;
        transform.localScale = Vector3.one * (highlighted ? hoverScale : normalScale);
    }
}