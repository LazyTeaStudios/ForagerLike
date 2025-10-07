using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;
using UnityEngine.EventSystems;



#if UNITY_EDITOR
using UnityEditor;
#endif

/// <summary>
/// Simple main-menu controller with Start, Load and Quit buttons.
/// Works with the custom SceneField type supplied by the user.
/// </summary>
public class MainMenuController : MenuBase
{
    [Header("Scene References")]
    [Tooltip("Scene loaded when the Start button is pressed.")]
    [SerializeField] private SceneField startScene;

    [Header("Menu Container")]
    [SerializeField] private GameObject mainMenuContainer;
    [SerializeField] private GameObject optionsMenuContainer;

    [Header("Buttons")]
    [SerializeField] private Button startGame;
    [SerializeField] private Button optionsButton;
    [SerializeField] private Button optionsBackButton;
    [SerializeField] private Button quitGame;


    #region OnEnable/Disable

    /// <summary>
    /// Subscribes to GameManager PauseStateChanged to handle pause logic.
    /// </summary>
    private void OnEnable()
    {
        startGame.onClick.AddListener(OnStartPressed);
        optionsButton.onClick.AddListener(OnOptions);
        optionsBackButton.onClick.AddListener(OnOptionsBack);
        quitGame.onClick.AddListener(OnQuitPressed);
    }

    #endregion

    private void Start()
    {
        EventSystem.current.firstSelectedGameObject = startGame.gameObject;

        if (optionsMenuContainer == null) return;

        if (optionsMenuContainer.activeInHierarchy)
        {
            optionsMenuContainer.SetActive(false);
        }
    }



    /// <summary>
    /// Called by the Start button.
    /// </summary>
    public void OnStartPressed()
    {
        SceneTransitionManager.LoadScene(startScene);
        Sound.PlaySound("ButtonPressed", 1f, 0.3f);
    }


    private void OnOptions()
    {
        Sound.PlaySound("ButtonPressed", 1f, 0.3f);

        mainMenuContainer.SetActive(false);
        optionsMenuContainer.SetActive(true);
    }

    private void OnOptionsBack()
    {
        Sound.PlaySound("ButtonPressed", 1f, 0.3f);

        optionsMenuContainer.SetActive(false);
        mainMenuContainer.SetActive(true);
    }


    /// <summary>
    /// Called by the Quit button
    /// </summary>
    public void OnQuitPressed()
    {
        Sound.PlaySound("ButtonPressed", 1f, 0.3f);

#if UNITY_EDITOR
        EditorApplication.isPlaying = false;
#else
            // Close the standalone/player build
            Application.Quit();
#endif


    }
}
