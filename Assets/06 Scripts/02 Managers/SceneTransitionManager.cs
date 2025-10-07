using System.Collections;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class SceneTransitionManager : Singleton<SceneTransitionManager>
{

    [Header("UI")]
    [Tooltip("Full-screen black Image with a CanvasGroup component.")]
    [SerializeField] private CanvasGroup fadeGroup;

    [Tooltip("Slider used as a loading-progress bar (optional).")]
    [SerializeField] private Slider progressBar;

    [Header("Timing")]
    [Min(0f)]
    [SerializeField] private float fadeDuration = 0.5f;

    public static void LoadScene(SceneField target) => Instance.BeginTransition(target?.SceneName);
    public static void LoadScene(string sceneName) => Instance.BeginTransition(sceneName);
    public static void ReloadCurrentScene() => Instance.BeginTransition(SceneManager.GetActiveScene().name);

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

        GameManager.Pause();
        Input.SetMap(ActionMap.Disabled);

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

        Input.SetMap(ActionMap.Gameplay);
        GameManager.Resume();
        _busy = false;
    }

    IEnumerator Fade(float targetAlpha)
    {
        if (!fadeGroup) yield break;

        float start = fadeGroup.alpha;
        if (Mathf.Approximately(start, targetAlpha) || fadeDuration <= 0f)
        {
            fadeGroup.alpha = targetAlpha;
            yield break;
        }

        float t = 0f;
        while (t < fadeDuration)
        {
            t += Time.unscaledDeltaTime;
            fadeGroup.alpha = Mathf.Lerp(start, targetAlpha, t / fadeDuration);
            yield return null;
        }
        fadeGroup.alpha = targetAlpha;
    }
}