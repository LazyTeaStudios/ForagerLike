using UnityEngine;
using UnityEngine.UI;

public class ResearchConnectionSlider : MonoBehaviour
{
    [Header("Setup")]
    [SerializeField] private ResearchAbility fromAbility;
    [SerializeField] private ResearchAbility toAbility;
    [SerializeField] private Slider connectionSlider;

    [SerializeField] private float fillSpeed = 2f;
    private float targetFill = 0f;

    void Awake()
    {
        if (connectionSlider == null)
            connectionSlider = GetComponent<Slider>();

        if (connectionSlider != null)
        {
            connectionSlider.value = 0f;
            connectionSlider.interactable = false;
        }
    }

    void OnEnable()
    {
        RefreshConnection();
    }

    void Update()
    {
        if (connectionSlider == null) return;

        if (!Mathf.Approximately(connectionSlider.value, targetFill))
            connectionSlider.value = Mathf.MoveTowards(connectionSlider.value, targetFill, fillSpeed * Time.unscaledDeltaTime);
    }

    public void RefreshConnection()
    {
        if (fromAbility == null)
        {
            targetFill = 0f;
            return;
        }

        targetFill = fromAbility.IsUnlocked ? 1f : 0f;
    }

    public void SetAbilities(ResearchAbility from, ResearchAbility to)
    {
        fromAbility = from;
        toAbility = to;
        RefreshConnection();
    }
}
