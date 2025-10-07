// MixerVolumeSlider.cs
using UnityEngine;
using UnityEngine.UI;

/// <summary>
/// Binds a Slider to one mixer bus in <see cref="SoundManager"/>.
/// </summary>
[RequireComponent(typeof(Slider))]
public class MixerVolumeSlider : MonoBehaviour
{
    public enum Param { Master, Music, SFX, UI, Ambience }

    [SerializeField] Param parameter = Param.Music;
    [SerializeField] Slider slider;

    void Awake()
    {
        slider ??= GetComponent<Slider>();
        slider.minValue = 0f;
        slider.maxValue = 10f;
        slider.wholeNumbers = true;
    }

    void OnEnable()
    {
        slider.onValueChanged.AddListener(Apply);
        slider.SetValueWithoutNotify(GetCurrent());
    }

    void OnDisable()
    {
        slider.onValueChanged.RemoveListener(Apply);
    }

    void Apply(float v)
    {
        if (!SoundManager.Instance) return;
        switch (parameter)
        {
            case Param.Master: 
                SoundManager.Instance.SetMasterVolume(v); 
                break;

            case Param.Music: 
                SoundManager.Instance.SetMusicVolume(v); 
                break;

            case Param.SFX: 
                SoundManager.Instance.SetSFXVolume(v); 
                break;

            case Param.UI: 
                SoundManager.Instance.SetUIVolume(v); 
                break;

            case Param.Ambience: 
                SoundManager.Instance.SetAmbienceVolume(v); 
                break;
        }
    }

    public float GetCurrent()
    {
        if (!SoundManager.Instance) 
            return slider.value;

        return parameter switch
        {
            Param.Master => SoundManager.Instance.GetMasterVolume(),
            Param.Music => SoundManager.Instance.GetMusicVolume(),
            Param.SFX => SoundManager.Instance.GetSFXVolume(),
            Param.UI => SoundManager.Instance.GetUIVolume(),
            Param.Ambience => SoundManager.Instance.GetAmbienceVolume(),
            _ => slider.value
        };
    }
}