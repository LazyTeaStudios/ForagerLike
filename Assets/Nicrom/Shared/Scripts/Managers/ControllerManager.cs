using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

namespace Nicrom
{
    public enum ControllerType
    {
        FlyCamera,
        FPSController
    }

    public class ControllerManager : MonoBehaviour
    {
        public ControllerType startController = ControllerType.FlyCamera;
        public GameObject flyCamera;
        public GameObject fpsController;

        private ControllerType activeController = ControllerType.FlyCamera;
        private Vector3 pos = Vector3.zero;
        private float terrainHeight = 0f;
        private bool controllerCanMove = true;

        private void Start()
        {
            if(startController == ControllerType.FlyCamera)
                activeController = ControllerType.FPSController;
            else
                activeController = ControllerType.FlyCamera;

            SwitchController();
        }

        private void Update()
        {
            if (Input.GetKeyDown(KeyCode.C) && controllerCanMove)
                SwitchController();
        }

        private void SwitchController()
        {
            if (activeController == ControllerType.FlyCamera)
            {
                activeController = ControllerType.FPSController;
                
                flyCamera.SetActive(false);
                fpsController.SetActive(true);

                pos = flyCamera.transform.position;

                if (Terrain.activeTerrain != null)
                {
                    terrainHeight = Terrain.activeTerrain.SampleHeight(pos);
                    fpsController.transform.position = new Vector3(pos.x, terrainHeight, pos.z);
                }
                else
                {
                    fpsController.transform.position = pos;
                }           
            }

            else
            {
                activeController = ControllerType.FlyCamera;
                flyCamera.SetActive(true);
                fpsController.SetActive(false);

                pos = fpsController.transform.position;
                flyCamera.transform.position = new Vector3(pos.x, pos.y + 2, pos.z);
            }
        }

        public void EnableControllerMovement(bool enable)
        {
            if (activeController == ControllerType.FlyCamera)
            {
                flyCamera.GetComponent<FreeFlyCamera>().enabled = enable;
                flyCamera.GetComponent<Rigidbody>().isKinematic = !enable;
            }
            else
            {
                fpsController.GetComponent<FPSController>().enabled = enable;
            }

            controllerCanMove = enable;
        }
    }
}
