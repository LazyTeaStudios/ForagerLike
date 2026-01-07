#if UNITY_EDITOR
using UnityEditor;
using UnityEngine;

[CustomEditor(typeof(BiomeZone))]
public class BiomeZoneEditor : Editor
{
    private enum ToolMode { None, Paint, Erase }

    private ToolMode _tool = ToolMode.None;
    private float _brushRadius = 2f;

    // What layer to raycast against when painting
    // (default to Everything; you can change here easily if you want)
    private LayerMask _paintRaycastMask = ~0;

    private void OnEnable()
    {
        SceneView.duringSceneGui += OnSceneGUI;
    }

    private void OnDisable()
    {
        SceneView.duringSceneGui -= OnSceneGUI;
    }

    public override void OnInspectorGUI()
    {
        DrawDefaultInspector();

        EditorGUILayout.Space(10);
        EditorGUILayout.LabelField("Zone Painting", EditorStyles.boldLabel);

        using (new EditorGUILayout.HorizontalScope())
        {
            GUI.backgroundColor = (_tool == ToolMode.Paint) ? new Color(0.7f, 1f, 0.7f) : Color.white;
            if (GUILayout.Button("Paint", GUILayout.Height(28)))
                _tool = ToolMode.Paint;

            GUI.backgroundColor = (_tool == ToolMode.Erase) ? new Color(1f, 0.7f, 0.7f) : Color.white;
            if (GUILayout.Button("Erase", GUILayout.Height(28)))
                _tool = ToolMode.Erase;

            GUI.backgroundColor = (_tool == ToolMode.None) ? new Color(0.85f, 0.85f, 0.85f) : Color.white;
            if (GUILayout.Button("Off", GUILayout.Height(28)))
                _tool = ToolMode.None;

            GUI.backgroundColor = Color.white;
        }

        _brushRadius = EditorGUILayout.Slider("Brush Radius", _brushRadius, 0.25f, 20f);

        EditorGUILayout.Space(6);
        using (new EditorGUILayout.HorizontalScope())
        {
            if (GUILayout.Button("Clear Allowed (All Off)"))
            {
                var zone = (BiomeZone)target;
                Undo.RecordObject(zone, "Clear Zone Grid");
                zone.ClearAll(false);
                EditorUtility.SetDirty(zone);
            }

            if (GUILayout.Button("Fill Allowed (All On)"))
            {
                var zone = (BiomeZone)target;
                Undo.RecordObject(zone, "Fill Zone Grid");
                zone.ClearAll(true);
                EditorUtility.SetDirty(zone);
            }
        }

        EditorGUILayout.HelpBox(
            "With Paint or Erase selected, click/drag in the Scene view to mark allowed spawn cells.\n" +
            "Hold Alt to orbit the camera.",
            MessageType.Info
        );
    }

    private void OnSceneGUI(SceneView view)
    {
        var zone = (BiomeZone)target;
        if (_tool == ToolMode.None) return;

        Event e = Event.current;

        // Let Alt still orbit camera
        if (e.alt) return;

        Ray ray = HandleUtility.GUIPointToWorldRay(e.mousePosition);

        if (!Physics.Raycast(ray, out RaycastHit hit, 10000f, _paintRaycastMask, QueryTriggerInteraction.Ignore))
            return;

        Vector3 p = hit.point;

        // Draw brush preview
        Handles.color = (_tool == ToolMode.Paint)
            ? new Color(0f, 1f, 0f, 0.25f)
            : new Color(1f, 0f, 0f, 0.25f);
        Handles.DrawSolidDisc(p, Vector3.up, _brushRadius);
        Handles.color = (_tool == ToolMode.Paint) ? Color.green : Color.red;
        Handles.DrawWireDisc(p, Vector3.up, _brushRadius);

        // Prevent selecting objects while painting
        HandleUtility.AddDefaultControl(GUIUtility.GetControlID(FocusType.Passive));

        bool paintEvent =
            (e.type == EventType.MouseDown || e.type == EventType.MouseDrag) &&
            e.button == 0;

        if (!paintEvent) return;

        bool value = (_tool == ToolMode.Paint);

        Undo.RecordObject(zone, "Paint Zone Grid");
        zone.PaintCircle(p, _brushRadius, value);
        EditorUtility.SetDirty(zone);

        e.Use();
        view.Repaint();
    }
}
#endif
