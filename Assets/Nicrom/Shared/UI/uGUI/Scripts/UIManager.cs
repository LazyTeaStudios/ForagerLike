using System;
using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

namespace Nicrom
{
    public class UIManager : MonoBehaviour
    {
        public GameObject envAndWindMenu;
        public ControllerManager controllerManager;
        public EnvironmentManager environmentManager;
        public WindManager windManager;

        [Space]
        public Slider timeOfDaySlider;
        public TMP_Text timeOfDayText;
        public Slider dayLengthSlider;
        public TMP_Text dayLengthText;
        public Toggle cloudShadowsToggle;
        public Slider sunAltitudeSlider;
        public TMP_Text sunAltitudeText;
        public Slider sunAzimuthSlider;
        public TMP_Text sunAzimuthText;
        public Slider fogEndSlider;
        public TMP_Text fogEndText;
        public Slider windStrengthSlider;
        public TMP_Text windStrengthText;
        public Slider windDirectionSlider;
        public TMP_Text windDirectionText;

        public TMP_Dropdown timePassageDropdown;
        private bool showEnvAndWindMenu = false;
        //private bool updateUIValues = true;

        void Start()
        {
            envAndWindMenu.SetActive(false);
            dayLengthSlider.gameObject.SetActive(false);
            showEnvAndWindMenu = false;
        }

        // Update is called once per frame
        void Update()
        {
            if (Input.GetKeyDown(KeyCode.T))
            {
                if (showEnvAndWindMenu)
                {
                    envAndWindMenu.SetActive(false);
                    showEnvAndWindMenu = false;
                    controllerManager.EnableControllerMovement(true);
                    Cursor.lockState = CursorLockMode.Locked;
                }
                else
                {
                    envAndWindMenu.SetActive(true);
                    showEnvAndWindMenu = true;
                    controllerManager.EnableControllerMovement(false);
                    Cursor.lockState = CursorLockMode.None;
                    UpdateUIValues();
                }
            }
        }

        private void UpdateUIValues()
        {
            timeOfDaySlider.value = environmentManager.timeOfDay;

            if (environmentManager.timePassage == TimePassage.None)
                timePassageDropdown.value = 0;
            else
                timePassageDropdown.value = 1;

            dayLengthSlider.value = environmentManager.dayLength;
            sunAltitudeSlider.value = environmentManager.globalEnvProfile.mainLightAltitude;
            sunAzimuthSlider.value = environmentManager.globalEnvProfile.mainLightAzimuth;
            fogEndSlider.value = environmentManager.globalEnvProfile.envLinearFogEnd;
            windStrengthSlider.value = windManager.windStrength;
            windDirectionSlider.value = windManager.windDirection;
        }

        public void SetTimeOfDay(float timeOfDay)
        {
            environmentManager.SetTimeOfDay(timeOfDay);
            environmentManager.UpdateEnvironmentSettings();
            timeOfDayText.text = Math.Round(timeOfDay, 2).ToString();
        }

        public void SetDayLength(float dayLength)
        {
            environmentManager.dayLength = dayLength;
            dayLengthText.text = Math.Round(dayLength, 2).ToString();
        }

        public void SetSunAltitude(float sunAltitude)
        {
            environmentManager.globalEnvProfile.mainLightAltitude = sunAltitude;
            environmentManager.UpdateMainLightRotation();
            sunAltitudeText.text = Math.Round(sunAltitude, 2).ToString();
        }

        public void SetSunAzimuth(float sunAzimuth)
        {
            environmentManager.globalEnvProfile.mainLightAzimuth = sunAzimuth;
            environmentManager.UpdateMainLightRotation();
            sunAzimuthText.text = Math.Round(sunAzimuth, 2).ToString();
        }

        public void SetFogEnd(float fogEnd)
        {
            environmentManager.globalEnvProfile.envLinearFogEnd = fogEnd;
            environmentManager.UpdateEnvironmentSettings();
            fogEndText.text = Math.Round(fogEnd, 2).ToString();
        }

        public void SetWindStrength(float winStrength)
        {
            windManager.windStrength = winStrength;
            windStrengthText.text = Math.Round(winStrength, 2).ToString();
        }

        public void SetWindDirection(float windDirection)
        {
            windManager.windDirection = windDirection;
            windDirectionText.text = Math.Round(windDirection, 2).ToString();
        }

        public void TimePassageDropdown(int index)
        {
            switch (index)
            {
                case 0: 
                    environmentManager.timePassage = TimePassage.None;
                    timeOfDaySlider.gameObject.SetActive(true);
                    dayLengthSlider.gameObject.SetActive(false);
                    break;
                case 1: 
                    environmentManager.timePassage = TimePassage.Smooth;
                    timeOfDaySlider.gameObject.SetActive(false);
                    dayLengthSlider.gameObject.SetActive(true);
                    break;
            }
        }

        public void EnableCloudShadows(bool enable)
        {
            environmentManager.globalEnvProfile.cloudShadowsState = enable;
            environmentManager.UpdateEnvironmentSettings();
        }
    }
}
