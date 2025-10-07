using System.Collections;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

/// <summary>
/// Simple, persistent scene–transition manager with fade-to-black and an optional load-progress bar.
/// Call from anywhere:
///     SceneTransitionManager.LoadScene(targetSceneField);
///     SceneTransitionManager.LoadScene("Level02");
/// </summary>
public class SceneTransitionManager : Singleton<SceneTransitionManager>
{

    [Header("UI")]
    [Tooltip("Full-screen black Image with a CanvasGroup component.")]
    [SerializeField] private CanvasGroup fadeGroup;

    [Tooltip("Slider used as a loading-progress bar (optional but recommended).")]
    [SerializeField] private Slider progressBar;

    [Header("Timing")]
    [Min(0f)]
    [SerializeField] private float fadeDuration = 0.5f;

    public static void LoadScene(SceneField target) => Instance.BeginTransition(target?.SceneName);
    public static void LoadScene(string sceneName) => Instance.BeginTransition(sceneName);

    bool _busy;

    void Start()
    {
        if (fadeGroup) fadeGroup.alpha = 0f;
        if (progressBar) progressBar.gameObject.SetActive(false);
    }

    void BeginTransition(string sceneName)
    {
        if (_busy || string.IsNullOrEmpty(sceneName)) return;
        StartCoroutine(TransitionRoutine(sceneName));
    }

    IEnumerator TransitionRoutine(string sceneName)
    {
        _busy = true;

        GameManagerHandler.Pause();
        InputHandler.SetMap(ActionMap.Disabled);
        yield return Fade(1f);

        if (progressBar) progressBar.gameObject.SetActive(true);
        var op = SceneManager.LoadSceneAsync(sceneName);
        op.allowSceneActivation = false;

        while (op.progress < 0.9f)
        {
            if (progressBar) progressBar.value = op.progress;
            yield return null;
        }

        if (progressBar) progressBar.value = 1f;
        op.allowSceneActivation = true;
        yield return new WaitUntil(() => op.isDone);

        if (progressBar) progressBar.gameObject.SetActive(false);
        yield return Fade(0f);

        InputHandler.SetMap(ActionMap.Gameplay);
        GameManagerHandler.Resume();
        _busy = false;
    }

    IEnumerator Fade(float targetAlpha)
    {
        if (!fadeGroup) yield break;

        float start = fadeGroup.alpha, t = 0f;
        while (t < fadeDuration)
        {
            t += Time.unscaledDeltaTime;
            fadeGroup.alpha = Mathf.Lerp(start, targetAlpha, t / fadeDuration);
            yield return null;
        }
        fadeGroup.alpha = targetAlpha;
    }
}
