using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Audio;

public enum AudioCategory { Music, SFX, UI, Ambience }

public static class Sound
{
    private static SoundManager Mgr => SoundManager.Instance;

    public static AudioSource PlaySound(string id, float volume = 1f, float pitchVariation = 0f, bool loop = false, bool stopWithFade = false, float fadeOut = 0.5f)
    {
        if (Mgr == null) return null;
        return Mgr.PlaySound(id, volume, pitchVariation, loop, stopWithFade, fadeOut);
    }

    public static AudioSource PlaySound(AudioClip clip, AudioCategory category, float volume = 1f, float pitchVariation = 0f, bool loop = false, bool stopWithFade = false, float fadeOut = 0.5f)
    {
        if (Mgr == null) return null;
        return Mgr.PlaySound(clip, category, volume, pitchVariation, loop, stopWithFade, fadeOut);
    }

    public static void Stop(AudioSource src, float fadeOut = 0f)
    {
        if (Mgr == null) return;
        Mgr.Stop(src, fadeOut);
    }
}

[DefaultExecutionOrder(-300)]
public class SoundManager : Singleton<SoundManager>
{
    const string PREF_MASTER = "Volume_Master";
    const string PREF_MUSIC = "Volume_Music";
    const string PREF_SFX = "Volume_SFX";
    const string PREF_UI = "Volume_UI";
    const string PREF_AMBIENCE = "Volume_Ambience";

    [Header("Audio Mixer / Groups")]
    [SerializeField] AudioMixer mixer;
    [SerializeField] AudioMixerGroup masterGroup;
    [SerializeField] AudioMixerGroup musicGroup;
    [SerializeField] AudioMixerGroup sfxGroup;
    [SerializeField] AudioMixerGroup uiGroup;
    [SerializeField] AudioMixerGroup ambienceGroup;

    [Header("Pooling")]
    [SerializeField] int initialPoolSize = 20;
    readonly Queue<AudioSource> pool = new();

    AudioLibrary audioLibrary;
    bool restoring;

    public override void Awake()
    {
        base.Awake();

        for (int i = 0; i < initialPoolSize; i++) pool.Enqueue(CreatePooledSource());
        audioLibrary = GetComponent<AudioLibrary>();
    }

    IEnumerator Start()
    {
        yield return null;
        LoadPersistedVolumes();
    }

    void OnApplicationQuit() => PlayerPrefs.Save();

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

    public AudioSource PlaySound(string id, float volume = 1f, float pitchVar = 0f, bool loop = false, bool stopWithFade = false, float fadeOut = 0.5f)
    {
        if (!audioLibrary || !audioLibrary.TryGetClip(id, out var clip)) return null;
        var cat = audioLibrary.GetCategory(id);
        return PlaySound(clip, cat, volume, pitchVar, loop, stopWithFade, fadeOut);
    }

    public AudioSource PlaySound(AudioClip clip, AudioCategory cat, float vol = 1f, float pitchVar = 0f, bool loop = false, bool stopWithFade = false, float fadeOut = 0.5f)
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

    public void Stop(AudioSource src, float fadeOut = 0f)
    {
        if (!src) return;
        if (fadeOut <= 0f) ReturnToPool(src);
        else StartCoroutine(FadeOutAndReturn(src, fadeOut));
    }

    AudioSource CreatePooledSource()
    {
        var src = new GameObject("Pooled_AudioSource").AddComponent<AudioSource>();
        src.transform.parent = transform;
        src.playOnAwake = false;
        return src;
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
            src.volume = Mathf.Lerp(start, 0f, time <= 0f ? 1f : t / time);
            yield return null;
        }
        ReturnToPool(src);
    }

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
        mixer.SetFloat(param, dB);
    }

    public void SetMasterVolume(float v) { SetMixerTenths("MasterVol", v); PersistVolume(PREF_MASTER, v); }
    public void SetMusicVolume(float v) { SetMixerTenths("MusicVol", v); PersistVolume(PREF_MUSIC, v); }
    public void SetSFXVolume(float v) { SetMixerTenths("SFXVol", v); PersistVolume(PREF_SFX, v); }
    public void SetUIVolume(float v) { SetMixerTenths("UIVol", v); PersistVolume(PREF_UI, v); }
    public void SetAmbienceVolume(float v) { SetMixerTenths("AmbienceVol", v); PersistVolume(PREF_AMBIENCE, v); }

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
}
