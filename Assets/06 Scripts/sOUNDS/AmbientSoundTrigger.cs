using System.Collections;
using UnityEngine;
using UnityEngine.Audio;

/// <summary>
/// Plays a 3D positional sound when the player enters the trigger and stops when they leave.
/// Fades in on enter and fades out on exit.
/// </summary>
[RequireComponent(typeof(Collider))]
[RequireComponent(typeof(AudioSource))]
public class AmbientSoundTrigger : MonoBehaviour
{
    [Header("Audio")]
    [SerializeField] private AudioClip clip;
    [SerializeField] private AudioMixerGroup mixerGroup;
    [SerializeField] private bool loop = true;

    [Header("Playback")]
    [SerializeField] private float targetVolume = 1f;
    [SerializeField] private float fadeInDuration = 1f;
    [SerializeField] private float fadeOutDuration = 1f;

    [Header("Player Detection")]
    [SerializeField] private string playerTag = "Player";

    [Header("Gizmo")]
    [SerializeField] private Color minDistanceColor = new Color(0f, 1f, 0.5f, 0.3f);
    [SerializeField] private Color maxDistanceColor = new Color(0f, 1f, 0.5f, 0.1f);
    [SerializeField] private Color triggerColor = new Color(1f, 1f, 0f, 0.2f);

    private AudioSource audioSource;
    private Coroutine fadeCoroutine;
    private bool playerInside;

    void Awake()
    {
        audioSource = GetComponent<AudioSource>();

        if (clip != null)
            audioSource.clip = clip;

        if (mixerGroup != null)
            audioSource.outputAudioMixerGroup = mixerGroup;

        audioSource.loop = loop;
        audioSource.volume = 0f;
        audioSource.playOnAwake = false;
    }

    void OnTriggerEnter(Collider other)
    {
        if (!other.CompareTag(playerTag) || playerInside) return;

        playerInside = true;
        StartFade(targetVolume, fadeInDuration, true);
    }

    void OnTriggerExit(Collider other)
    {
        if (!other.CompareTag(playerTag) || !playerInside) return;

        playerInside = false;
        StartFade(0f, fadeOutDuration, false);
    }

    void StartFade(float target, float duration, bool startPlaying)
    {
        if (fadeCoroutine != null)
            StopCoroutine(fadeCoroutine);

        fadeCoroutine = StartCoroutine(FadeVolume(target, duration, startPlaying));
    }

    IEnumerator FadeVolume(float target, float duration, bool startPlaying)
    {
        if (startPlaying && !audioSource.isPlaying)
            audioSource.Play();

        float startVolume = audioSource.volume;
        float elapsed = 0f;

        if (duration <= 0f)
        {
            audioSource.volume = target;
        }
        else
        {
            while (elapsed < duration)
            {
                elapsed += Time.deltaTime;
                audioSource.volume = Mathf.Lerp(startVolume, target, elapsed / duration);
                yield return null;
            }
            audioSource.volume = target;
        }

        if (target <= 0f && audioSource.isPlaying)
            audioSource.Stop();

        fadeCoroutine = null;
    }

    void OnDisable()
    {
        if (fadeCoroutine != null)
            StopCoroutine(fadeCoroutine);

        if (audioSource != null)
        {
            audioSource.Stop();
            audioSource.volume = 0f;
        }

        playerInside = false;
    }
}