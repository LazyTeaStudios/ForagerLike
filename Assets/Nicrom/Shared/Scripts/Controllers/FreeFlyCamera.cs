using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Nicrom
{
    public class FreeFlyCamera : MonoBehaviour
    {
        public float cameraSensitivity = 90;
        public float normalMoveSpeed = 40;
        public float normalMoveSpeedMin = 0.1f;
        public float normalMoveSpeedMax = 300.0f;
        public float scrollWheelSpeedChange = 15f;
        public float fastMoveFactor = 3;
        public float slowMoveFactor = 0.25f;
        public float climbSpeed = 20;

        private float rotationX = 0.0f;
        private float rotationY = 0.0f;
        private float finalSpeed = 10f;
        private float speedScale = 10.0f;

        private float horizontalAxis = 0;
        private float verticalAxis = 0;

        private bool climb = false;
        private bool drop = false;

        private Rigidbody rb;

        void Start()
        {
            Cursor.lockState = CursorLockMode.Locked;
            rb = GetComponent<Rigidbody>();
        }

        private void Update()
        {
            UpdateNormalSpeed();
            UpdateCameraRotation();
            CheckForKeyboardInputs();
        }

        void FixedUpdate()
        {
            UpdateVelocity();
        }

        private void UpdateVelocity()
        {
#if UNITY_6000_0_OR_NEWER
            rb.linearVelocity = Vector3.zero;
            rb.linearVelocity += transform.forward * verticalAxis * Time.deltaTime * finalSpeed;
            rb.linearVelocity += transform.right * horizontalAxis * Time.deltaTime * finalSpeed;

            if (climb)
                rb.linearVelocity += transform.up * Time.deltaTime * climbSpeed * speedScale;
            if (drop)
                rb.linearVelocity += -transform.up * Time.deltaTime * climbSpeed * speedScale;
#else
            rb.velocity = Vector3.zero;
            rb.velocity += transform.forward * verticalAxis * Time.deltaTime * finalSpeed;
            rb.velocity += transform.right * horizontalAxis * Time.deltaTime * finalSpeed;

            if (climb)
                rb.velocity += transform.up * Time.deltaTime * climbSpeed * speedScale;
            if (drop)
                rb.velocity += -transform.up * Time.deltaTime * climbSpeed * speedScale;
#endif
        }

        private void UpdateNormalSpeed()
        {
            float d = Input.GetAxis("Mouse ScrollWheel");

            if (d > 0f || d < 0f)
            {
                normalMoveSpeed += d * scrollWheelSpeedChange;

                if (normalMoveSpeed > normalMoveSpeedMax)
                    normalMoveSpeed = normalMoveSpeedMax;

                if (normalMoveSpeed < normalMoveSpeedMin)
                    normalMoveSpeed = normalMoveSpeedMin;
            }
        }

        private void UpdateCameraRotation()
        {
            rotationX += Input.GetAxis("Mouse X") * cameraSensitivity * Time.deltaTime;
            rotationY += Input.GetAxis("Mouse Y") * cameraSensitivity * Time.deltaTime;
            rotationY = Mathf.Clamp(rotationY, -90, 90);

            transform.localRotation = Quaternion.AngleAxis(rotationX, Vector3.up);
            transform.localRotation *= Quaternion.AngleAxis(rotationY, Vector3.left);
        }

        private void CheckForKeyboardInputs()
        {
            verticalAxis = Input.GetAxis("Vertical");
            horizontalAxis = Input.GetAxis("Horizontal");

            if (Input.GetKey(KeyCode.LeftShift) || Input.GetKey(KeyCode.RightShift))
                finalSpeed = normalMoveSpeed * fastMoveFactor * speedScale;
            else if (Input.GetKey(KeyCode.LeftControl) || Input.GetKey(KeyCode.RightControl))
                finalSpeed = normalMoveSpeed * slowMoveFactor * speedScale;
            else
                finalSpeed = normalMoveSpeed * speedScale;

            //if (Input.GetKeyDown(KeyCode.End))
            //{
            //    if (Cursor.lockState == CursorLockMode.None)
            //        Cursor.lockState = CursorLockMode.Locked;
            //    else
            //        Cursor.lockState = CursorLockMode.None;
            //}

            if (Input.GetKey(KeyCode.Q))
                climb = true;
            else
                climb = false;

            if (Input.GetKey(KeyCode.E))
                drop = true;
            else
                drop = false;
        }
    }
}
