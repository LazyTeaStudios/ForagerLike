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
    [SerializeField] private GameObject lockOverlay;
    [SerializeField] private GameObject unlockedGlow;

    private ResearchTableUI tableUI;

    public ResearchAbility Ability => ability;

    void Awake()
    {
        if (button == null)
            button = GetComponent<Button>();

        tableUI = GetComponentInParent<ResearchTableUI>();

        if (button != null)
            button.onClick.AddListener(OnClicked);
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

        // Check if prerequisites are met
        bool prerequisitesMet = true;
        foreach (var prereq in ability.prerequisites)
        {
            if (prereq != null && !prereq.IsUnlocked)
            {
                prerequisitesMet = false;
                break;
            }
        }

        // Show/hide based on prerequisites
        gameObject.SetActive(prerequisitesMet);

        if (!prerequisitesMet) return;

        // Update icon
        if (iconImage != null && ability.icon != null)
            iconImage.sprite = ability.icon;

        // Update lock overlay
        if (lockOverlay != null)
            lockOverlay.SetActive(!ability.IsUnlocked);

        // Update unlocked glow
        if (unlockedGlow != null)
            unlockedGlow.SetActive(ability.IsUnlocked);

        // Update button interactability
        if (button != null)
            button.interactable = true;
    }

    void OnClicked()
    {
        if (tableUI != null)
            tableUI.OnAbilityButtonClicked(this);
    }
}