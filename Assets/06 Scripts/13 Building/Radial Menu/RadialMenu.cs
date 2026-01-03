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
    [SerializeField] private float deadZoneRadius = 50f;

    [Header("Colors")]
    [SerializeField] private Color normalColor = new Color(1, 1, 1, 0.5f);
    [SerializeField] private Color hoverColor = Color.white;
    [SerializeField] private float normalScale = 1f;
    [SerializeField] private float hoverScale = 1.25f;

    private List<RadialMenuButton> buttons = new List<RadialMenuButton>();
    private RadialMenuButton selectedButton;
    private float fillAmount;
    private bool isOpen;
    private bool clickProcessed = false;

    public bool IsOpen => isOpen;
    public System.Action OnClosed;

    private void Start()
    {
        Close();
    }

    public void Open()
    {
        isOpen = true;
        clickProcessed = false;
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

    public void SetButtons(List<RadialButtonData> buttonData, int defaultSelectionIndex = 0)
    {
        ClearButtons();
        clickProcessed = false;

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

        // Set default selection
        if (buttons.Count > 0 && defaultSelectionIndex >= 0 && defaultSelectionIndex < buttons.Count)
        {
            selectedButton = buttons[defaultSelectionIndex];
        }
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
    }

    private void HandleInput()
    {
        // Reset click flag when mouse is released
        if (!Input.GetMouseButton(0))
        {
            clickProcessed = false;
        }

        // Handle click on the currently selected button
        if (Input.GetMouseButtonDown(0) && selectedButton != null && !clickProcessed)
        {
            clickProcessed = true;
            selectedButton.TriggerAction();
        }
    }

    private void UpdateSelection()
    {
        if (buttons.Count == 0) return;

        Vector2 screenCenter = new Vector2(Screen.width * 0.5f, Screen.height * 0.5f);
        Vector2 mousePos = Input.mousePosition;
        Vector2 mouseDir = (Vector2)mousePos - screenCenter;

        float distanceFromCenter = mouseDir.magnitude;

        // Only update selection if mouse is outside the dead zone
        // If inside dead zone, keep the current selection (don't clear it)
        if (distanceFromCenter < deadZoneRadius)
        {
            // Don't change selection when hovering over center
            return;
        }

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