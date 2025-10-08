using UnityEngine;

public class Zoom : MonoBehaviour
{
    [SerializeField] float defaultFOV = 60f;
    [SerializeField] float maxZoomFOV = 15f;
    [SerializeField, Range(0, 1)] float currentZoom;
    [SerializeField] float sensitivity = 0.05f;
    [SerializeField] float zoomLerpSpeed = 10f;

    Camera cam;

    void Awake()
    {
        cam = GetComponent<Camera>();
        if (cam) defaultFOV = cam.fieldOfView;
    }

    void Update()
    {
        if (InputHandler.IsMapActive(ActionMap.UI)) return;

        if (InputHandler.Held(GameAction.ShiftModifier))
        {
            Vector2 scrollInput = InputHandler.GetValue<Vector2>(GameAction.ScrollHotbar);
            float scrollDelta = scrollInput.y;

            if (Mathf.Abs(scrollDelta) > 0.01f)
            {
                currentZoom += scrollDelta * sensitivity;
                currentZoom = Mathf.Clamp01(currentZoom);
            }
        }

        if (cam)
        {
            float targetFOV = Mathf.Lerp(defaultFOV, maxZoomFOV, currentZoom);
            cam.fieldOfView = Mathf.Lerp(cam.fieldOfView, targetFOV, Time.deltaTime * zoomLerpSpeed);
        }
    }
}