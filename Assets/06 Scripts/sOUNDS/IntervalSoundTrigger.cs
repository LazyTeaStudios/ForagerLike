using UnityEngine;

/// <summary>
/// Plays a sound at regular intervals while the player is within the trigger area.
/// Uses an assigned AudioSource for 3D positioning.
/// </summary>
[RequireComponent(typeof(Collider))]
[RequireComponent(typeof(AudioSource))]
public class IntervalSoundTrigger : MonoBehaviour
{
    [Header("Sound Settings")]
    [Tooltip("Multiple clips to randomly choose from")]
    [SerializeField] private AudioClip[] clips;

    [Header("Playback")]
    [SerializeField] private float volume = 1f;
    [SerializeField] private float volumeVariation = 0.1f;
    [SerializeField] private float pitchVariation = 0.1f;

    [Header("Interval")]
    [SerializeField] private float minInterval = 3f;
    [SerializeField] private float maxInterval = 8f;
    [Tooltip("Play immediately when player enters")]
    [SerializeField] private bool playOnEnter = false;

    [Header("Player Detection")]
    [SerializeField] private string playerTag = "Player";

    [Header("Gizmo")]
    [SerializeField] private Color minDistanceColor = new Color(0.5f, 0.5f, 1f, 0.3f);
    [SerializeField] private Color maxDistanceColor = new Color(0.5f, 0.5f, 1f, 0.1f);
    [SerializeField] private Color triggerColor = new Color(1f, 1f, 0f, 0.2f);

    private AudioSource audioSource;
    private bool playerInside;
    private float nextPlayTime;

    void Awake()
    {
        audioSource = GetComponent<AudioSource>();
        audioSource.playOnAwake = false;
    }

    void OnTriggerEnter(Collider other)
    {
        if (!other.CompareTag(playerTag) || playerInside) return;

        playerInside = true;

        if (playOnEnter)
        {
            PlaySound();
            ScheduleNext();
        }
        else
        {
            ScheduleNext();
        }
    }

    void OnTriggerExit(Collider other)
    {
        if (!other.CompareTag(playerTag)) return;

        playerInside = false;
    }

    void Update()
    {
        if (!playerInside) return;

        if (Time.time >= nextPlayTime)
        {
            PlaySound();
            ScheduleNext();
        }
    }

    void ScheduleNext()
    {
        nextPlayTime = Time.time + Random.Range(minInterval, maxInterval);
    }

    void PlaySound()
    {
        AudioClip clip = GetRandomClip();
        if (clip == null) return;

        float vol = volume + Random.Range(-volumeVariation, volumeVariation);
        audioSource.volume = Mathf.Clamp01(vol);
        audioSource.pitch = 1f + Random.Range(-pitchVariation, pitchVariation);
        audioSource.clip = clip;
        audioSource.Play();
    }

    AudioClip GetRandomClip()
    {
        if (clips == null || clips.Length == 0)
            return audioSource.clip; // Fall back to clip assigned directly on AudioSource

        return clips[Random.Range(0, clips.Length)];
    }

    void OnDisable()
    {
        playerInside = false;
    }

    void OnDrawGizmosSelected()
    {
        var source = GetComponent<AudioSource>();
        if (source == null) return;

        // Draw max distance sphere
        Gizmos.color = maxDistanceColor;
        Gizmos.DrawSphere(transform.position, source.maxDistance);
        Gizmos.color = new Color(maxDistanceColor.r, maxDistanceColor.g, maxDistanceColor.b, 0.8f);
        Gizmos.DrawWireSphere(transform.position, source.maxDistance);

        // Draw min distance sphere
        Gizmos.color = minDistanceColor;
        Gizmos.DrawSphere(transform.position, source.minDistance);
        Gizmos.color = new Color(minDistanceColor.r, minDistanceColor.g, minDistanceColor.b, 0.8f);
        Gizmos.DrawWireSphere(transform.position, source.minDistance);

        // Draw trigger bounds
        Gizmos.color = triggerColor;
        var col = GetComponent<Collider>();
        if (col is BoxCollider box)
        {
            Gizmos.DrawCube(transform.position + box.center, box.size);
            Gizmos.color = new Color(triggerColor.r, triggerColor.g, triggerColor.b, 0.8f);
            Gizmos.DrawWireCube(transform.position + box.center, box.size);
        }
        else if (col is SphereCollider sphere)
        {
            Gizmos.DrawSphere(transform.position + sphere.center, sphere.radius);
            Gizmos.color = new Color(triggerColor.r, triggerColor.g, triggerColor.b, 0.8f);
            Gizmos.DrawWireSphere(transform.position + sphere.center, sphere.radius);
        }
    }
}