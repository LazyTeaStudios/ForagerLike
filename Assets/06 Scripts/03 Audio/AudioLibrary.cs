using System.Collections.Generic;
using UnityEngine;

[System.Serializable]
public struct ClipEntry
{
    public string id;
    public AudioClip clip;
}

[AddComponentMenu("Audio/Audio Library")]
public class AudioLibrary : MonoBehaviour
{
    [SerializeField] ClipEntry[] music = { };
    [SerializeField] ClipEntry[] sfx = { };
    [SerializeField] ClipEntry[] ui = { };
    [SerializeField] ClipEntry[] ambience = { };

    struct LookupEntry
    {
        public AudioClip clip;
        public AudioCategory category;
        public LookupEntry(AudioClip c, AudioCategory cat) { clip = c; category = cat; }
    }

    Dictionary<string, LookupEntry> lookup;
    public static AudioLibrary Instance { get; private set; }

    void Awake()
    {
        Instance = this;
        lookup = new Dictionary<string, LookupEntry>(CountAll());
        AddRange(music, AudioCategory.Music);
        AddRange(sfx, AudioCategory.SFX);
        AddRange(ui, AudioCategory.UI);
        AddRange(ambience, AudioCategory.Ambience);
    }

    int CountAll() => (music?.Length ?? 0) + (sfx?.Length ?? 0) + (ui?.Length ?? 0) + (ambience?.Length ?? 0);

    void AddRange(ClipEntry[] arr, AudioCategory cat)
    {
        if (arr == null) return;
        for (int i = 0; i < arr.Length; i++)
        {
            var e = arr[i];
            if (string.IsNullOrEmpty(e.id) || !e.clip) continue;
            if (lookup.ContainsKey(e.id)) continue;
            lookup.Add(e.id, new LookupEntry(e.clip, cat));
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
        lookup != null && lookup.TryGetValue(id, out var e) ? e.category : AudioCategory.SFX;

#if UNITY_EDITOR
    public IEnumerable<string> EditorGetIds(AudioCategory cat)
    {
        var arr = cat switch
        {
            AudioCategory.Music => music,
            AudioCategory.SFX => sfx,
            AudioCategory.UI => ui,
            AudioCategory.Ambience => ambience,
            _ => null
        };

        if (arr == null) yield break;

        for (int i = 0; i < arr.Length; i++)
        {
            var id = arr[i].id;
            if (!string.IsNullOrEmpty(id)) yield return id;
        }
    }
#endif
}
