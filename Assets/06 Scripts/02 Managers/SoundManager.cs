using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Audio;
using UnityEngine.UI;

/// <summary>
/// Categories routed through the AudioMixer.
/// </summary>
public enum AudioCategory { Music, SFX, UI, Ambience }


/// <summary>
/// Static class for quick one-line access to the global <see cref="SoundManager"/>.
/// Call examples:
///   Sound.PlaySound("Jump");
///   Sound.PlayMusic("MainTheme", fade:2f, targetVolume:0.9f);
/// </summary>
public static class Sound
{
    private static SoundManager Mgr => SoundManager.Instance;

    /// <inheritdoc cref="SoundManager.PlaySound(string,float,float,bool,bool,float)"/>
    public static AudioSource PlaySound(
        string id,
        float volume = 1f,
        float pitchVariation = 0f,
        bool loop = false,
        bool stopWithFade = false,
        float fadeOut = 0.5f)
    {
        if (Mgr == null) return null;
        return Mgr.PlaySound(id, volume, pitchVariation, loop, stopWithFade, fadeOut);
    }

    /// <inheritdoc cref="SoundManager.PlaySound(AudioClip,AudioCategory,float,float,bool,bool,float)"/>
    public static AudioSource PlaySound(
        AudioClip clip,
        AudioCategory category,
        float volume = 1f,
        float pitchVariation = 0f,
        bool loop = false,
        bool stopWithFade = false,
        float fadeOut = 0.5f)
    {
        if (Mgr == null) return null;
        return Mgr.PlaySound(clip, category, volume, pitchVariation, loop, stopWithFade, fadeOut);
    }


    /// <inheritdoc cref="SoundManager.PlayMusic(string,float,float)"/>
    public static void PlayMusic(
        string id,
        float targetVolume = 1f,
        float fade = 1f
        )
    {
        if (Mgr == null) return;
        Mgr.PlayMusic(id, fade, targetVolume);
    }

    /// <inheritdoc cref="SoundManager.PlayMusic(AudioClip,float,float)"/>
    public static void PlayMusic(
        AudioClip clip,
        float targetVolume = 1f,
        float fade = 1f
        )
    {
        if (Mgr == null) return;
        Mgr.PlayMusic(clip, fade, targetVolume);
    }
}


/// <summary>
/// Centralised playback, mixing and persistence of all game audio.
/// </summary>
[DefaultExecutionOrder(-300)]
public class SoundManager : Singleton<SoundManager>
{
    #region PrefKeys
    const string PREF_MASTER = "Volume_Master";
    const string PREF_MUSIC = "Volume_Music";
    const string PREF_SFX = "Volume_SFX";
    const string PREF_UI = "Volume_UI";
    const string PREF_AMBIENCE = "Volume_Ambience";
    #endregion

    #region MixerGroups
    [Header("Audio Mixer / Groups")]
    [SerializeField] AudioMixer mixer;
    [SerializeField] AudioMixerGroup masterGroup;
    [SerializeField] AudioMixerGroup musicGroup;
    [SerializeField] AudioMixerGroup sfxGroup;
    [SerializeField] AudioMixerGroup uiGroup;
    [SerializeField] AudioMixerGroup ambienceGroup;
    #endregion

    #region Pooling
    [Header("Pooling")]
    [SerializeField] int initialPoolSize = 20;
    readonly Queue<AudioSource> pool = new();
    #endregion

    #region Fields
    AudioSource musicA, musicB;
    AudioLibrary audioLibrary;
    bool usingA = true;
    bool restoring;
    #endregion

    #region Unity
    public override void Awake()
    {
        base.Awake();

        // Build pool, music sources, etc…
        for (int i = 0; i < initialPoolSize; i++) pool.Enqueue(CreatePooledSource());
        musicA = CreateMusicSource("Music_A");
        musicB = CreateMusicSource("Music_B");

        audioLibrary = GetComponent<AudioLibrary>();
    }

    IEnumerator Start()
    {
        yield return null;

        //Debug.Log("Test");
        LoadPersistedVolumes();
    }


    void OnApplicationQuit() => PlayerPrefs.Save();
    #endregion

    #region Persistence
    void LoadPersistedVolumes()
    {
        restoring = true;

        SetMasterVolume(PlayerPrefs.GetFloat(PREF_MASTER, 10f));
        SetMusicVolume(PlayerPrefs.GetFloat(PREF_MUSIC, 10f));
        SetSFXVolume(PlayerPrefs.GetFloat(PREF_SFX, 10f));
        SetUIVolume(PlayerPrefs.GetFloat(PREF_UI, 10f));
        SetAmbienceVolume(PlayerPrefs.GetFloat(PREF_AMBIENCE, 10f));

        restoring = false;
    }

    void PersistVolume(string key, float tenths)
    {
        if (restoring) return;
        PlayerPrefs.SetFloat(key, Mathf.Clamp(tenths, 0f, 10f));
        PlayerPrefs.Save();
    }
    #endregion

    #region Public API (string)
    public AudioSource PlaySound(string id, float volume = 1f,
                                 float pitchVar = 0f, bool loop = false,
                                 bool stopWithFade = false, float fadeOut = 0.5f)
    {
        if (!audioLibrary || !audioLibrary.TryGetClip(id, out var clip)) return null;
        var cat = audioLibrary.GetCategory(id);
        return PlaySound(clip, cat, volume, pitchVar, loop, stopWithFade, fadeOut);
    }

    public void PlayMusic(string id, float tgtVol = 1f, float fade = 1f)
    {
        if (!audioLibrary || !audioLibrary.TryGetClip(id, out var clip)) return;
        PlayMusic(clip, fade, tgtVol);
    }
    #endregion

    #region Public API (clip)
    public AudioSource PlaySound(AudioClip clip, AudioCategory cat,
                                 float vol = 1f, float pitchVar = 0f,
                                 bool loop = false, bool stopWithFade = false,
                                 float fadeOut = 0.5f)
    {
        if (!clip) return null;

        var src = GetPooledSource();
        src.clip = clip;
        src.loop = loop;
        src.pitch = 1f + Random.Range(-pitchVar, pitchVar);
        src.volume = vol;
        src.outputAudioMixerGroup = GetGroup(cat);
        src.Play();

        if (!loop) StartCoroutine(ReturnWhenFinished(src));
        else if (stopWithFade) StartCoroutine(FadeOutAndReturn(src, fadeOut));

        return src;
    }

    public void PlayMusic(AudioClip clip, float tgtVol = 0.1f, float fade = 5f)
    {
        if (!clip || IsMusicAlreadyPlaying(clip)) return;

        var incoming = usingA ? musicB : musicA;
        var outgoing = usingA ? musicA : musicB;
        usingA = !usingA;

        incoming.clip = clip;
        incoming.volume = 0f;
        incoming.Play();

        StartCoroutine(CrossFade(outgoing, incoming, fade, tgtVol));
    }
    #endregion

    #region SourceCreation
    AudioSource CreatePooledSource()
    {
        var src = new GameObject("Pooled_AudioSource").AddComponent<AudioSource>();
        src.transform.parent = transform;
        src.playOnAwake = false;
        return src;
    }

    AudioSource CreateMusicSource(string name)
    {
        var src = gameObject.AddComponent<AudioSource>();
        src.name = name;
        src.outputAudioMixerGroup = musicGroup;
        src.loop = false;
        src.playOnAwake = false;
        return src;
    }
    #endregion

    #region Coroutines
    IEnumerator CrossFade(AudioSource from, AudioSource to, float time, float tgtVol)
    {
        float t = 0f, vFrom = from.volume;
        while (t < time)
        {
            t += Time.unscaledDeltaTime;
            float k = t / time;
            to.volume = Mathf.Lerp(0f, tgtVol, k);
            from.volume = Mathf.Lerp(vFrom, 0f, k);
            yield return null;
        }
        from.Stop();
    }

    IEnumerator ReturnWhenFinished(AudioSource src)
    {
        yield return new WaitUntil(() => !src.isPlaying);
        ReturnToPool(src);
    }

    IEnumerator FadeOutAndReturn(AudioSource src, float time)
    {
        float start = src.volume, t = 0f;
        while (t < time && src)
        {
            t += Time.unscaledDeltaTime;
            src.volume = Mathf.Lerp(start, 0f, t / time);
            yield return null;
        }
        ReturnToPool(src);
    }
    #endregion

    #region PoolHelpers
    AudioSource GetPooledSource()
    {
        if (pool.Count == 0) pool.Enqueue(CreatePooledSource());
        return pool.Dequeue();
    }

    void ReturnToPool(AudioSource src)
    {
        if (!src) return;
        src.Stop();
        src.clip = null;
        src.transform.parent = transform;
        pool.Enqueue(src);
    }
    #endregion

    #region Mixers
    AudioMixerGroup GetGroup(AudioCategory cat) => cat switch
    {
        AudioCategory.Music => musicGroup,
        AudioCategory.UI => uiGroup,
        AudioCategory.Ambience => ambienceGroup,
        _ => sfxGroup
    };

    void SetMixerTenths(string param, float tenths)
    {
        float linear = Mathf.Clamp01(tenths * 0.1f);
        float dB = Mathf.Approximately(linear, 0f) ? -80f : Mathf.Log10(linear) * 20f;

        if (!mixer.SetFloat(param, dB))
            Debug.LogWarning($"AudioMixer parameter \"{param}\" not found.");
    }
    #endregion

    #region Setters
    public void SetMasterVolume(float v) { SetMixerTenths("MasterVol", v); PersistVolume(PREF_MASTER, v); }
    public void SetMusicVolume(float v) { SetMixerTenths("MusicVol", v); PersistVolume(PREF_MUSIC, v); }
    public void SetSFXVolume(float v) { SetMixerTenths("SFXVol", v); PersistVolume(PREF_SFX, v); }
    public void SetUIVolume(float v) { SetMixerTenths("UIVol", v); PersistVolume(PREF_UI, v); }
    public void SetAmbienceVolume(float v) { SetMixerTenths("AmbienceVol", v); PersistVolume(PREF_AMBIENCE, v); }
    #endregion

    #region Getters
    float GetMixerTenths(string param)
    {
        if (!mixer.GetFloat(param, out float dB) || dB <= -79.9f) return 0f;
        return Mathf.Clamp(Mathf.Pow(10f, dB / 20f) * 10f, 0f, 10f);
    }

    public float GetMasterVolume() => GetMixerTenths("MasterVol");
    public float GetMusicVolume() => GetMixerTenths("MusicVol");
    public float GetSFXVolume() => GetMixerTenths("SFXVol");
    public float GetUIVolume() => GetMixerTenths("UIVol");
    public float GetAmbienceVolume() => GetMixerTenths("AmbienceVol");
    #endregion

    #region Helpers
    bool IsMusicAlreadyPlaying(AudioClip clip) =>
        (musicA.isPlaying && musicA.clip == clip) ||
        (musicB.isPlaying && musicB.clip == clip);
    #endregion
}


