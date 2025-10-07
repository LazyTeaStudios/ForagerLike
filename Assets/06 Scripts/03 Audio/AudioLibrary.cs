using System.Collections.Generic;
using UnityEngine;

/// One row in the inspector
[System.Serializable]
public struct AudioEntry
{
    public string id;        // unique key
    public AudioClip clip;      // the asset
    public AudioCategory category;  // routing hint
}

/// <summary>
/// Lightweight, dictionary-backed sound catalogue.
/// *No* playback helpers here – it’s purely for reference access.
/// </summary>
[AddComponentMenu("Audio/Audio Library")]
public class AudioLibrary : MonoBehaviour
{
    [Tooltip("Register every clip you want globally available.")]
    [SerializeField] private AudioEntry[] entries = { };

    private Dictionary<string, AudioEntry> lookup;
    public static AudioLibrary Instance { get; private set; }

    void Awake()
    {
        lookup = new Dictionary<string, AudioEntry>(entries.Length);
        foreach (var e in entries)
        {
            if (!string.IsNullOrEmpty(e.id) && e.clip && !lookup.ContainsKey(e.id))
                lookup.Add(e.id, e);
        }
    }

    public bool TryGetClip(string id, out AudioClip clip)
    {
        if (lookup != null && lookup.TryGetValue(id, out var e))
        {
            clip = e.clip;
            return true;
        }
        clip = null;
        return false;
    }

    public AudioClip GetClip(string id) =>
        lookup != null && lookup.TryGetValue(id, out var e) ? e.clip : null;

    public AudioCategory GetCategory(string id) =>
        lookup != null && lookup.TryGetValue(id, out var e) ? e.category
                                                           : AudioCategory.SFX;
}