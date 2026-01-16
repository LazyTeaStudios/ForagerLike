using UnityEngine;

/// <summary>
/// Cross-fades to a music track when the player enters the trigger.
/// Only changes music if the track is different from what's currently playing.
/// </summary>
[RequireComponent(typeof(Collider))]
public class MusicTrigger : MonoBehaviour
{
    [Header("Music")]
    [SerializeField] private AudioClip musicClip;
    [SerializeField] private float targetVolume = 1f;
    [SerializeField] private float crossfadeDuration = 2f;

    [Header("Player Detection")]
    [SerializeField] private string playerTag = "Player";

    [Header("Gizmo")]
    [SerializeField] private Color triggerColor = new Color(1f, 0.5f, 0f, 0.3f);

    void OnTriggerEnter(Collider other)
    {
        if (!other.CompareTag(playerTag)) return;
        if (musicClip == null) return;

        Sound.PlayMusic(musicClip, targetVolume, crossfadeDuration);
    }

    void OnDrawGizmosSelected()
    {
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