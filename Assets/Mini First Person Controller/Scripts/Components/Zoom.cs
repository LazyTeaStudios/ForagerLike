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
        if (!InputHandler.Held(GameAction.ShiftModifier)) return;

        float scroll = 0f;
        try { scroll = InputHandler.GetValue<float>(GameAction.ScrollHotbar); } catch { }

        currentZoom += scroll * sensitivity * 0.05f;
        currentZoom = Mathf.Clamp01(currentZoom);

        if (cam) cam.fieldOfView = Mathf.Lerp(defaultFOV, maxZoomFOV, currentZoom);
    }
}
