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

    [Header("State Visuals")]
    [SerializeField] private GameObject lockedStateObject;
    [SerializeField] private GameObject canUnlockStateObject;
    [SerializeField] private GameObject unlockedStateObject;

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

        bool isUnlocked = ability.IsUnlocked;
        bool hasPrerequisites = ability.ArePrerequisitesMet();
        bool canUnlock = !isUnlocked && ability.CanUnlock();

        if (lockedStateObject != null) lockedStateObject.SetActive(false);
        if (canUnlockStateObject != null) canUnlockStateObject.SetActive(false);
        if (unlockedStateObject != null) unlockedStateObject.SetActive(false);

        if (isUnlocked)
        {
            if (unlockedStateObject != null) unlockedStateObject.SetActive(true);
        }
        else if (hasPrerequisites && canUnlock)
        {
            if (canUnlockStateObject != null) canUnlockStateObject.SetActive(true);
        }
        else
        {
            if (lockedStateObject != null) lockedStateObject.SetActive(true);
        }

        if (button != null)
            button.interactable = true;
    }

    void OnClicked()
    {
        if (tableUI != null)
            tableUI.OnAbilityButtonClicked(this);
    }
}