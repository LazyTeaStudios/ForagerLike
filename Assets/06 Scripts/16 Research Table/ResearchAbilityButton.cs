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
    // Show this when prerequisites are NOT met (truly locked)
    [SerializeField] private GameObject lockOverlay;
    // Show this when the ability is unlocked
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
            gameObject.SetActive(false);
            return;
        }

        gameObject.SetActive(true);

        // Update icon
        //if (iconImage != null && ability.icon != null)
         //   iconImage.sprite = ability.icon;

        bool isUnlocked = ability.IsUnlocked;
        bool hasPrerequisites = ability.ArePrerequisitesMet();
        bool hasResources = ability.HasRequiredItems();

        // Lock overlay only shows when prerequisites are not met
        // NOT when you simply lack resources
        if (lockOverlay != null)
            lockOverlay.SetActive(!isUnlocked && !hasPrerequisites);

        // Unlocked visual only when actually unlocked
        if (unlockedGlow != null)
            unlockedGlow.SetActive(isUnlocked);

        // Button is always interactable for clicking/viewing
        if (button != null)
            button.interactable = true;
    }

    void OnClicked()
    {
        if (tableUI != null)
            tableUI.OnAbilityButtonClicked(this);
    }
}