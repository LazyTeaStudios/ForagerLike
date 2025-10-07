using UnityEngine;

[ExecuteInEditMode]
public class Zoom : MonoBehaviour
{
    private Camera cam;
    public float defaultFOV = 60f;
    public float maxZoomFOV = 15f;
    [Range(0, 1)] public float currentZoom;
    public float sensitivity = 1f;

    void Awake()
    {
        cam = GetComponent<Camera>();
        if (cam) defaultFOV = cam.fieldOfView;
    }

    void Update()
    {
        if (!Application.isPlaying) return;

        if (InputHandler.Held(GameAction.ShiftModifier))
        {
            float scroll = 0f;
            try
            {
                scroll = InputHandler.GetValue<float>(GameAction.ScrollHotbar);
            }
            catch { }

            if (Mathf.Abs(scroll) > 0.01f)
            {
                currentZoom += scroll * sensitivity * 0.001f;
                currentZoom = Mathf.Clamp01(currentZoom);
            }
        }

        if (cam)
        {
            float targetFOV = Mathf.Lerp(defaultFOV, maxZoomFOV, currentZoom);
            cam.fieldOfView = Mathf.Lerp(cam.fieldOfView, targetFOV, Time.deltaTime * 10f);
        }
    }
}