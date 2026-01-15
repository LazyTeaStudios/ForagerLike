using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class ResearchAbilityButton : MonoBehaviour
{
    [Header("Setup")]
    [SerializeField] private ResearchAbility ability;

    [Header("UI References")]
    [SerializeField] private Button button;
    [SerializeField] private Image iconImage;

    // Show this when the ability CANNOT be unlocked right now (locked state)
    [SerializeField] private GameObject lockOverlay;

    // Your existing "unlocked" visual (keep using this, no new GO needed)
    [SerializeField] private GameObject unlockedGlow;

    private ResearchTableUI tableUI;

    public ResearchAbility Ability => ability;

    void Awake()
    {
        if (button == null)
            button = GetComponent<Button>();

        tableUI = GetComponentInParent<ResearchTableUI>();

        if (button != null)
        {
            button.onClick.RemoveListener(OnClicked);
            button.onClick.AddListener(OnClicked);

            // Never disable the button
            button.interactable = true;
        }
    }

    void Start()
    {
        RefreshDisplay();
    }

    public void RefreshDisplay()
    {
        if (ability == null)
        {
            // If there truly is no ability assigned, hiding is reasonable
            gameObject.SetActive(false);
            return;
        }

        // Always show the button (do not hide based on prerequisites)
        gameObject.SetActive(true);

        // Update icon
        if (iconImage != null && ability.icon != null)
            iconImage.sprite = ability.icon;

        bool isUnlocked = ability.IsUnlocked;
        bool canUnlockNow = !isUnlocked && ability.CanUnlock();

        // Lock overlay should be visible only when the ability cannot be unlocked right now
        if (lockOverlay != null)
            lockOverlay.SetActive(!isUnlocked && !canUnlockNow);

        // Unlocked visual enabled only when unlocked
        if (unlockedGlow != null)
            unlockedGlow.SetActive(isUnlocked);

        // Never disable the button
        if (button != null)
            button.interactable = true;
    }

    void OnClicked()
    {
        if (tableUI != null)
            tableUI.OnAbilityButtonClicked(this);
    }
}
