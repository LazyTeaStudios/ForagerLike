using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class Workbench : ProcessingMachine
{
    [Header("Workbench UI")]
    [SerializeField] private Button craftButton;
    [SerializeField] private TMP_Text craftButtonLabel; // optional (can be null)

    private bool startRequested;

    protected override void Awake()
    {
        base.Awake();

        if (craftButton != null)
        {
            craftButton.onClick.RemoveListener(OnCraftPressed);
            craftButton.onClick.AddListener(OnCraftPressed);
        }

        UpdateCraftButtonState();
    }

    protected override void Update()
    {
        base.Update();

        // Keep the button state in sync while the panel is open (covers item changes via UI)
        if (machinePanel != null && machinePanel.activeSelf)
            UpdateCraftButtonState();
    }

    private void OnCraftPressed()
    {
        if (IsProcessing) return;

        startRequested = true;

        // Try immediately (instead of waiting for next frame)
        TryStartProcessing();

        UpdateCraftButtonState();
    }

    public override void TryStartProcessing()
    {
        // Block auto-start: only allow starting when the player pressed the button
        if (!startRequested)
            return;

        startRequested = false;

        // This will only start if items are present AND a recipe matches (your base logic)
        base.TryStartProcessing();
    }

    public override void RefreshDisplay()
    {
        base.RefreshDisplay();
        UpdateCraftButtonState();
    }

    private void UpdateCraftButtonState()
    {
        if (craftButton == null) return;

        bool hasValidRecipe = (!IsProcessing) && (FindMatchingRecipe() != null);

        craftButton.interactable = hasValidRecipe;

        if (craftButtonLabel != null)
            craftButtonLabel.text = IsProcessing ? "Crafting..." : "Craft";

        // Optional: if you prefer the button to hide when unusable, uncomment:
        // craftButton.gameObject.SetActive(hasValidRecipe || IsProcessing);
    }
}
