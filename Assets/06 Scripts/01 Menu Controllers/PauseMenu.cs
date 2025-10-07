using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class PauseMenu : MenuBase
{
    [Header("Menu Container")]
    [SerializeField] private GameObject pauseMenuContainer;
    [SerializeField] private GameObject optionsMenuContainer;

    [Header("Buttons")]
    [SerializeField] private Button resumeButton;
    [SerializeField] private Button optionsButton;
    [SerializeField] private Button optionsBackButton;
    [SerializeField] private Button quitToMenuButton;

    [Header("Main Menu Scene")]
    [SerializeField] private SceneField mainMenuScene;


    #region OnEnable/Disable

    private void OnEnable()
    {
        resumeButton.onClick.AddListener(OnResume);
        optionsButton.onClick.AddListener(OnOptions);
        optionsBackButton.onClick.AddListener(OnOptionsBack);
        quitToMenuButton.onClick.AddListener(QuitToMenu);
    }
        
    #endregion


    private void Start()
    {
        if (pauseMenuContainer == null || optionsMenuContainer == null) return;

        if (pauseMenuContainer.activeInHierarchy)
        {
            pauseMenuContainer.SetActive(false);
        }
        
        if (optionsMenuContainer.activeInHierarchy)
        {
            optionsMenuContainer.SetActive(false);
        }

    }

    private void Update()
    {
        if (Input.Pressed(GameAction.Pause))
        {
            OnPause();
        }

        if (Input.Pressed(GameAction.Resume))
        {
            OnResume();
        }
    }

    private void OnPause()
    {
        Sound.PlaySound("ButtonPressed", 1f, 0.3f);
        GameManager.Pause();

        Input.SetMap(ActionMap.UI);
        RefreshSelection(resumeButton.gameObject);

        pauseMenuContainer.SetActive(true);
    }

    private void OnResume()
    {
        Sound.PlaySound("ButtonPressed", 1f, 0.3f);
        GameManager.Resume();

        Input.SetMap(ActionMap.Gameplay);

        pauseMenuContainer.SetActive(false);
        optionsMenuContainer.SetActive(false);
    }

    private void OnOptions()
    {
        Sound.PlaySound("ButtonPressed", 1f, 0.3f);

        pauseMenuContainer.SetActive(false);
        optionsMenuContainer.SetActive(true);

        RefreshSelection(optionsBackButton.gameObject);
    }

    private void OnOptionsBack()
    {
        Sound.PlaySound("ButtonPressed", 1f, 0.3f);

        optionsMenuContainer.SetActive(false);
        pauseMenuContainer.SetActive(true);

        RefreshSelection(resumeButton.gameObject);
    }

    private void QuitToMenu()
    {
        Sound.PlaySound("ButtonPressed", 1f, 0.3f);
        GameManager.Resume();

        SceneTransitionManager.LoadScene(mainMenuScene);
    }
}
