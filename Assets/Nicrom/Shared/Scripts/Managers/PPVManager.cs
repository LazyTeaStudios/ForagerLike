using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Rendering;

namespace Nicrom
{
    public enum ActivePrimaryVolume
    {
        Day,
        Night
    }

    public enum ActiveSecondaryVolume
    {
        None,
        Sunrise,
        Sunset,
    }

    public enum TimeOfDaySource
    {
        Local,
        EnvironmentManager
    }

    public class PPVManager : MonoBehaviour
    {
        public bool showMainGroup = true;
        public bool showPrimaryGroup = true;
        public bool showNightGroup = true;
        public bool showSecondaryGroup = true;
        public bool showSunsetGroup = true;

        public EnvironmentManager envManager;
        public TimeOfDaySource timeOfDaySource = TimeOfDaySource.Local;
        [Range(0, 24f)]
        public float timeOfDay = 0;

        // Day
        public Volume dayPPV;
        [Range(0, 24f)]
        public float dayStart = 6f;
        [Range(0, 24f)]
        public float dayEnd = 18f;
        
        // Night
        public Volume nightPPV;
        public AnimationCurve nightWeightAC = AnimationCurve.EaseInOut(0, 1f, 1f, 1f);

        // Sunrise
        public Volume sunrisePPV;
        [Range(0, 24f)]
        public float sunriseStart = 5.8f;
        [Range(0, 24f)]
        public float sunriseEnd = 7f;
        public AnimationCurve sunriseWeightAC = AnimationCurve.EaseInOut(0, 1f, 1f, 1f);
        public bool useSunrisePPV = true;

        // Sunset
        public Volume sunsetPPV;
        [Range(0, 24f)]
        public float sunsetStart = 17f;
        [Range(0, 24f)]
        public float sunsetEnd = 18.2f;
        public AnimationCurve sunsetWeightAC = AnimationCurve.EaseInOut(0, 1f, 1f, 1f);
        public bool useSunsetPPV = true;

        private ActivePrimaryVolume activePrimaryVolume = ActivePrimaryVolume.Day;
        private ActiveSecondaryVolume activeSecondaryVolume = ActiveSecondaryVolume.None;

        private float animCurveTime = 0;
        private float primaryVolumeWeight = 1;
        private float secondaryVolumeWeight = 0;

        private void Start()
        {
            if (envManager != null && timeOfDaySource == TimeOfDaySource.EnvironmentManager)
                timeOfDay = envManager.timeOfDay;
        }

        public void UpdateVolumes()
        {
            if (timeOfDaySource == TimeOfDaySource.EnvironmentManager && envManager != null)
                timeOfDay = envManager.timeOfDay;

            UpdateActiveVolumeEnums();
            UpdatePrimaryVolumes();
            UpdateSecondaryVolumes();
        }

        private void UpdateActiveVolumeEnums()
        {
            if (timeOfDay >= dayStart && timeOfDay <= dayEnd)
                activePrimaryVolume = ActivePrimaryVolume.Day;
            else
                activePrimaryVolume = ActivePrimaryVolume.Night;

            if (timeOfDay >= sunriseStart && timeOfDay <= sunriseEnd && useSunrisePPV)
                activeSecondaryVolume = ActiveSecondaryVolume.Sunrise;
            else if (timeOfDay >= sunsetStart && timeOfDay <= sunsetEnd && useSunsetPPV)
                activeSecondaryVolume = ActiveSecondaryVolume.Sunset;
            else
                activeSecondaryVolume = ActiveSecondaryVolume.None;
        }

        private void UpdatePrimaryVolumes()
        {
            if(dayPPV == null || nightPPV == null) return;

            if (activePrimaryVolume == ActivePrimaryVolume.Day)
            {
                dayPPV.gameObject.SetActive(true);
                nightPPV.gameObject.SetActive(false);

                dayPPV.weight = 1;
            }
            else
            {
                nightPPV.gameObject.SetActive(true);
                dayPPV.gameObject.SetActive(false);

                if (timeOfDay > dayStart && timeOfDay <= 24 && useSunsetPPV) 
                {
                    nightPPV.weight = 1;
                    return;
                }

                if (timeOfDay < dayStart && useSunrisePPV)
                {
                    nightPPV.weight = 1;
                    return;
                }

                animCurveTime = GetNightVolumeAnimationCurveTime();
                primaryVolumeWeight = nightWeightAC.Evaluate(animCurveTime);
                nightPPV.weight = primaryVolumeWeight;

                if (primaryVolumeWeight < 1)
                {
                    dayPPV.gameObject.SetActive(true);
                    dayPPV.weight = 1 - primaryVolumeWeight;
                }
                else
                {
                    dayPPV.gameObject.SetActive(false);
                }
            }
        }

        private float GetNightVolumeAnimationCurveTime()
        {
            float time;

            if (timeOfDay > dayEnd && timeOfDay <= 24)
                time = (timeOfDay - dayEnd) / (24 - dayEnd + dayStart);
            else
                time = (24 - dayEnd + timeOfDay) / (24 - dayEnd + dayStart);

            return time;
        }

        private void UpdateSecondaryVolumes()
        {
            if (sunrisePPV == null || sunsetPPV == null) return;

            if (activeSecondaryVolume == ActiveSecondaryVolume.Sunrise && useSunrisePPV)
            {
                animCurveTime = GetAnimationCurveTime(timeOfDay, sunriseStart, sunriseEnd);
                
                secondaryVolumeWeight = sunriseWeightAC.Evaluate(animCurveTime);
                primaryVolumeWeight = 1 - secondaryVolumeWeight;
                
                sunrisePPV.weight = secondaryVolumeWeight;
                SetPrimaryVolumeWeight(primaryVolumeWeight);

                sunrisePPV.gameObject.SetActive(true);
            }
            else if(activeSecondaryVolume == ActiveSecondaryVolume.Sunset && useSunsetPPV)
            {
                animCurveTime = GetAnimationCurveTime(timeOfDay, sunsetStart, sunsetEnd);
                
                secondaryVolumeWeight = sunsetWeightAC.Evaluate(animCurveTime);
                primaryVolumeWeight = 1.0f - secondaryVolumeWeight;
                
                sunsetPPV.weight = secondaryVolumeWeight;
                SetPrimaryVolumeWeight(primaryVolumeWeight);

                sunsetPPV.gameObject.SetActive(true);
            }
            else
            {
                sunrisePPV.gameObject.SetActive(false);
                sunsetPPV.gameObject.SetActive(false);
            }
        }

        private void SetPrimaryVolumeWeight(float weight)
        {
            if (activePrimaryVolume == ActivePrimaryVolume.Day)
                dayPPV.weight = weight;
            else
                nightPPV.weight = weight;
        }

        private float GetAnimationCurveTime(float time, float startTime, float endTime)
        {
            return (time - startTime) / (endTime - startTime);
        }
    }
}
