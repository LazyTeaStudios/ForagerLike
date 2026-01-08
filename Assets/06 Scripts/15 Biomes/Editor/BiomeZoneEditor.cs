#if UNITY_EDITOR
using UnityEditor;
using UnityEngine;

[CustomEditor(typeof(BiomeZone))]
public class BiomeZoneEditor : Editor
{
    private enum ToolMode { None, Paint, Erase }

    private ToolMode _tool = ToolMode.None;
    private float _brushRadius = 2f;

    // Hide/Show state (persisted)
    private bool _showGridAndPainting = true;
    private const string PrefKey = "BiomeZoneEditor_ShowGridAndPainting";

    // Serialized properties
    private SerializedProperty _spawnPrefab;
    private SerializedProperty _maxSpawnCount;
    private SerializedProperty _groundLayer;

    private SerializedProperty _raycastHeight;
    private SerializedProperty _ignoreRaycastLayers;
    private SerializedProperty _maxSpawnAttemptsPerTick;
    private SerializedProperty _maxGroundSlopeAngle;

    private SerializedProperty _gridWidth;
    private SerializedProperty _gridHeight;
    private SerializedProperty _cellSize;

    private SerializedProperty _drawGridGizmos;
    private SerializedProperty _drawAllowedCells;
    private SerializedProperty _allowedCellFill;

    private SerializedProperty _alignGizmosToGround;
    private SerializedProperty _gizmoGroundOffset;
    private SerializedProperty _gizmoRaycastHeight;

    private void OnEnable()
    {
        _showGridAndPainting = EditorPrefs.GetBool(PrefKey, true);

        _spawnPrefab = serializedObject.FindProperty("spawnPrefab");
        _maxSpawnCount = serializedObject.FindProperty("maxSpawnCount");
        _groundLayer = serializedObject.FindProperty("groundLayer");

        _raycastHeight = serializedObject.FindProperty("raycastHeight");
        _ignoreRaycastLayers = serializedObject.FindProperty("ignoreRaycastLayers");
        _maxSpawnAttemptsPerTick = serializedObject.FindProperty("maxSpawnAttemptsPerTick");
        _maxGroundSlopeAngle = serializedObject.FindProperty("maxGroundSlopeAngle");

        _gridWidth = serializedObject.FindProperty("gridWidth");
        _gridHeight = serializedObject.FindProperty("gridHeight");
        _cellSize = serializedObject.FindProperty("cellSize");

        _drawGridGizmos = serializedObject.FindProperty("drawGridGizmos");
        _drawAllowedCells = serializedObject.FindProperty("drawAllowedCells");
        _allowedCellFill = serializedObject.FindProperty("allowedCellFill");

        _alignGizmosToGround = serializedObject.FindProperty("alignGizmosToGround");
        _gizmoGroundOffset = serializedObject.FindProperty("gizmoGroundOffset");
        _gizmoRaycastHeight = serializedObject.FindProperty("gizmoRaycastHeight");

        SceneView.duringSceneGui += OnSceneGUI;
    }

    private void OnDisable()
    {
        SceneView.duringSceneGui -= OnSceneGUI;
    }

    public override void OnInspectorGUI()
    {
        serializedObject.Update();

        // ---- Spawn Settings ----
        EditorGUILayout.LabelField("Spawn Settings", EditorStyles.boldLabel);
        EditorGUILayout.PropertyField(_spawnPrefab);
        EditorGUILayout.PropertyField(_maxSpawnCount);
        EditorGUILayout.PropertyField(_groundLayer);

        EditorGUILayout.Space(8);

        // ---- Spawning ----
        EditorGUILayout.LabelField("Spawning", EditorStyles.boldLabel);
        EditorGUILayout.PropertyField(_raycastHeight);
        EditorGUILayout.PropertyField(_ignoreRaycastLayers);
        EditorGUILayout.PropertyField(_maxSpawnAttemptsPerTick);
        EditorGUILayout.PropertyField(_maxGroundSlopeAngle);

        EditorGUILayout.Space(10);

        // ---- Show/Hide button ----
        string btnLabel = _showGridAndPainting ? "Hide Grid & Painting" : "Show Grid & Painting";
        if (GUILayout.Button(btnLabel, GUILayout.Height(26)))
        {
            _showGridAndPainting = !_showGridAndPainting;
            EditorPrefs.SetBool(PrefKey, _showGridAndPainting);

            // If hiding, also disable painting tool to avoid accidental edits
            if (!_showGridAndPainting)
                _tool = ToolMode.None;

            Repaint();
            SceneView.RepaintAll();
        }

        // ---- Grid + Painting (optional) ----
        if (_showGridAndPainting)
        {
            EditorGUILayout.Space(10);
            EditorGUILayout.LabelField("Grid", EditorStyles.boldLabel);
            EditorGUILayout.PropertyField(_gridWidth);
            EditorGUILayout.PropertyField(_gridHeight);
            EditorGUILayout.PropertyField(_cellSize);

            EditorGUILayout.Space(10);
            DrawPaintingUI();

            EditorGUILayout.Space(10);
            EditorGUILayout.LabelField("Gizmos", EditorStyles.boldLabel);
            EditorGUILayout.PropertyField(_drawGridGizmos);
            EditorGUILayout.PropertyField(_drawAllowedCells);
            EditorGUILayout.PropertyField(_allowedCellFill);

            EditorGUILayout.Space(6);
            EditorGUILayout.LabelField("Ground-aligned Gizmos", EditorStyles.boldLabel);
            EditorGUILayout.PropertyField(_alignGizmosToGround);
            EditorGUILayout.PropertyField(_gizmoGroundOffset);
            EditorGUILayout.PropertyField(_gizmoRaycastHeight);
        }

        serializedObject.ApplyModifiedProperties();
    }

    private void DrawPaintingUI()
    {
        var zone = (BiomeZone)target;

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
                Undo.RecordObject(zone, "Clear Zone Grid");
                zone.ClearAll(false);
                EditorUtility.SetDirty(zone);
                SceneView.RepaintAll();
            }

            if (GUILayout.Button("Fill Allowed (All On)"))
            {
                Undo.RecordObject(zone, "Fill Zone Grid");
                zone.ClearAll(true);
                EditorUtility.SetDirty(zone);
                SceneView.RepaintAll();
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
        // Only allow painting when the UI is visible AND a tool is selected
        if (!_showGridAndPainting) return;

        var zone = (BiomeZone)target;
        if (_tool == ToolMode.None) return;

        Event e = Event.current;
        if (e.alt) return; // allow orbit

        // Raycast mask: use the BiomeZone's groundLayer
        serializedObject.Update();
        LayerMask paintMask = _groundLayer != null ? (LayerMask)_groundLayer.intValue : ~0;

        Ray ray = HandleUtility.GUIPointToWorldRay(e.mousePosition);

        if (!Physics.Raycast(ray, out RaycastHit hit, 10000f, paintMask, QueryTriggerInteraction.Ignore))
            return;

        Vector3 p = hit.point;

        // Brush preview
        Handles.color = (_tool == ToolMode.Paint)
            ? new Color(0f, 1f, 0f, 0.25f)
            : new Color(1f, 0f, 0f, 0.25f);

        Handles.DrawSolidDisc(p, Vector3.up, _brushRadius);
        Handles.color = (_tool == ToolMode.Paint) ? Color.green : Color.red;
        Handles.DrawWireDisc(p, Vector3.up, _brushRadius);

        // Prevent selection while painting
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
