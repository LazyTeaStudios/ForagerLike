using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class RadialMenu : MonoBehaviour
{
    [Header("References")]
    [SerializeField] private CanvasGroup canvasGroup;
    [SerializeField] private RectTransform buttonContainer;
    [SerializeField] private RadialMenuButton buttonPrefab;
    [SerializeField] private Image selectionFill;
    [SerializeField] private Image selectionFillInner;

    [Header("Center Display")]
    [SerializeField] private RawImage centerIcon;
    [SerializeField] private Text centerLabel;
    [SerializeField] private Text centerDescription;

    [Header("Layout")]
    [SerializeField] private float radius = 160f;

    [Header("Colors")]
    [SerializeField] private Color normalColor = new Color(1, 1, 1, 0.5f);
    [SerializeField] private Color hoverColor = Color.white;
    [SerializeField] private float normalScale = 1f;
    [SerializeField] private float hoverScale = 1.25f;

    private List<RadialMenuButton> buttons = new List<RadialMenuButton>();
    private RadialMenuButton selectedButton;
    private float fillAmount;
    private bool isOpen;
    private bool inputCooldown;

    // NEW: latch to prevent one held click from firing multiple times
    private bool clickHeld;

    public bool IsOpen => isOpen;
    public System.Action OnClosed;

    public void Open()
    {
        isOpen = true;
        inputCooldown = true;

        // Ignore any click that is currently being held when we open
        clickHeld = true;

        gameObject.SetActive(true);
        Cursor.lockState = CursorLockMode.None;
        Cursor.visible = true;
    }

    public void Close()
    {
        isOpen = false;
        gameObject.SetActive(false);
        OnClosed?.Invoke();
    }

    public void SetButtons(List<RadialButtonData> buttonData)
    {
        ClearButtons();
        inputCooldown = true;

        // Ignore current held click during menu rebuild
        clickHeld = true;

        int count = buttonData.Count;
        if (count == 0) return;

        fillAmount = 1f / count;
        float angleStep = 360f / count;

        for (int i = 0; i < count; i++)
        {
            var btn = Instantiate(buttonPrefab, buttonContainer);
            btn.gameObject.SetActive(true);

            float angle = i * angleStep + 270f;
            float positionRad = angle * Mathf.Deg2Rad;
            btn.transform.localPosition = new Vector2(Mathf.Cos(positionRad), Mathf.Sin(positionRad)) * radius;
            btn.name = (i * angleStep).ToString();

            var data = buttonData[i];
            btn.Setup(data.name, data.icon, data.description, data.action);
            buttons.Add(btn);
        }

        if (selectionFill != null)
            selectionFill.fillAmount = fillAmount;
        if (selectionFillInner != null)
            selectionFillInner.fillAmount = fillAmount;
    }

    private void ClearButtons()
    {
        foreach (var btn in buttons)
            if (btn != null) Destroy(btn.gameObject);
        buttons.Clear();
        selectedButton = null;

        if (centerLabel != null) centerLabel.text = "";
        if (centerDescription != null) centerDescription.text = "";
        if (centerIcon != null) centerIcon.texture = null;
    }

    private void Update()
    {
        if (!isOpen) return;

        UpdateSelection();
        UpdateVisuals();
        HandleInput();

        // You can keep this if you like your cooldown pattern,
        // the clickHeld latch now prevents multi-fire.
        inputCooldown = false;
    }

    private void UpdateSelection()
    {
        if (buttons.Count == 0) return;

        Vector2 screenCenter = new Vector2(Screen.width * 0.5f, Screen.height * 0.5f);
        Vector2 mouseDir = (Vector2)Input.mousePosition - screenCenter;

        float mouseAngle = Mathf.Atan2(mouseDir.y, mouseDir.x) * Mathf.Rad2Deg - 270f;
        if (mouseAngle < 0) mouseAngle += 360f;

        float minDist = float.MaxValue;
        RadialMenuButton nearest = null;

        foreach (var btn in buttons)
        {
            float btnAngle = float.Parse(btn.name);
            float dist = Mathf.Abs(Mathf.DeltaAngle(btnAngle, mouseAngle));
            if (dist < minDist)
            {
                minDist = dist;
                nearest = btn;
            }
        }

        selectedButton = nearest;
    }

    private void UpdateVisuals()
    {
        foreach (var btn in buttons)
            btn.SetHighlight(btn == selectedButton, normalColor, hoverColor, normalScale, hoverScale);

        if (selectedButton != null)
        {
            if (centerLabel != null)
                centerLabel.text = selectedButton.Label;
            if (centerDescription != null)
                centerDescription.text = selectedButton.Description;
            if (centerIcon != null)
                centerIcon.texture = selectedButton.Icon;

            float btnAngle = float.Parse(selectedButton.name);
            float halfFillDegrees = fillAmount * 180f;
            float targetRotation = btnAngle + halfFillDegrees;

            Quaternion targetQuat = Quaternion.Euler(0, 0, targetRotation + 180);

            if (selectionFill != null)
            {
                selectionFill.transform.localRotation = Quaternion.Slerp(
                    selectionFill.transform.localRotation,
                    targetQuat,
                    15f * Time.unscaledDeltaTime
                );
            }

            if (selectionFillInner != null && selectionFillInner.transform.parent != selectionFill.transform)
            {
                selectionFillInner.transform.localRotation = Quaternion.Slerp(
                    selectionFillInner.transform.localRotation,
                    targetQuat,
                    15f * Time.unscaledDeltaTime
                );
            }
        }

        if (canvasGroup != null)
            canvasGroup.alpha = Mathf.Lerp(canvasGroup.alpha, 1f, 10f * Time.unscaledDeltaTime);
    }

    private void HandleInput()
    {
        // When the mouse button is released, allow a new click
        if (Input.GetMouseButtonUp(0))
            clickHeld = false;

        // Don't do anything if we're still holding the click that was already used
        if (clickHeld)
            return;

        if (!inputCooldown && InputHandler.Pressed(GameAction.Click) && selectedButton != null)
        {
            // Mark that this physical press has been consumed
            clickHeld = true;
            inputCooldown = true;

            selectedButton.OnClick?.Invoke();
        }
    }
}


public struct RadialButtonData
{
    public string name;
    public string description;
    public Texture2D icon;
    public UnityEngine.Events.UnityAction action;

    public RadialButtonData(string name, Texture2D icon, UnityEngine.Events.UnityAction action)
    {
        this.name = name;
        this.description = "";
        this.icon = icon;
        this.action = action;
    }

    public RadialButtonData(string name, string description, Texture2D icon, UnityEngine.Events.UnityAction action)
    {
        this.name = name;
        this.description = description;
        this.icon = icon;
        this.action = action;
    }
}