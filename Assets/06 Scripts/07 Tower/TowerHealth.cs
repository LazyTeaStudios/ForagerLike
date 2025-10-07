using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;

/// <summary>
/// Holds the tower’s health, updates the on-screen slider,
/// and shows a simple Game-Over panel when health reaches zero.
/// </summary>
public class TowerHealth : MonoBehaviour
{
    public static TowerHealth Instance { get; private set; }

    [Header("UI")]
    [SerializeField] private Slider healthSlider;       
    [SerializeField] private GameObject gameOverPanel;     
    [SerializeField] private Button retryButton;
    [SerializeField] private Button menuButton;

    [Header("Config")]
    [SerializeField, Min(1)] private int maxHealth = 10;
    [SerializeField] private SceneField mainMenuScene;   

    int _current;

    void Awake()
    {
        if (Instance && Instance != this) { Destroy(gameObject); return; }
        Instance = this;
    }

    void Start()
    {
        _current = maxHealth;

        if (healthSlider)
        {
            healthSlider.minValue = 0;
            healthSlider.maxValue = maxHealth;
            healthSlider.wholeNumbers = true;
            healthSlider.value = _current;
        }

        gameOverPanel.SetActive(false); 

        retryButton.onClick.AddListener(Reload);
        menuButton.onClick.AddListener(ReturnToMenu);
    }

    public void Damage(int amount = 1)
    {
        if (_current <= 0) return;

        _current = Mathf.Max(0, _current - amount);
        if (healthSlider) healthSlider.value = _current;

        if (_current == 0) OnTowerDestroyed();
    }

    void OnTowerDestroyed()
    {
        GameManager.Pause();
        Input.SetMap(ActionMap.UI);

        gameOverPanel.SetActive(true);
        EventSystem.current.SetSelectedGameObject(retryButton.gameObject);
    }

    void Reload() => SceneTransitionManager.ReloadCurrentScene();
    void ReturnToMenu() => SceneTransitionManager.LoadScene(mainMenuScene);
}