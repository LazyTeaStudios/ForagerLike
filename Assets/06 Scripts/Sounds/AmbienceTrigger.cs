using UnityEngine;

[RequireComponent(typeof(Collider))]
public class AmbienceTrigger : MonoBehaviour
{
    [SerializeField, AudioId(AudioCategory.Ambience)] string ambienceId;
    [SerializeField, Range(0f, 1f)] float volume = 1f;
    [SerializeField] float fadeOut = 5f;

    AudioSource playing;

    void Reset()
    {
        var c = GetComponent<Collider>();
        c.isTrigger = true;
    }

    void OnTriggerEnter(Collider other)
    {
        if (!other.CompareTag("Player")) return;
        if (playing) return;
        if (string.IsNullOrEmpty(ambienceId)) return;

        playing = Sound.PlaySound(ambienceId, volume, 0f, loop: true);
    }

    void OnTriggerExit(Collider other)
    {
        if (!other.CompareTag("Player")) return;
        if (!playing) return;

        Sound.Stop(playing, fadeOut);
        playing = null;
    }
}
