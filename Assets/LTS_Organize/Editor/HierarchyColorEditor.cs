// Assets/Editor/HierarchyColorEditor.cs
using UnityEditor;
using UnityEditor.SceneManagement;          // PrefabStageUtility lives here
using UnityEditor.Experimental.SceneManagement;
using UnityEngine;
using System;
using System.Collections.Generic;
using System.Reflection;
using System.IO;

[InitializeOnLoad]
internal static class HierarchyColorEditor
{
    #region constants & caches
    private const float VPad = 1f, GutterW = 0f, Pad = 7f, Cell = 24f;
    private const int StripDepth = 100, IconsPerRow = 10;
    private static readonly Color PrefabTextBlue = new(.5f, .82f, 1f);
    private static readonly Color DisabledTextGrey = new(.45f, .45f, .45f);   // new - darker text for disabled objects

    private static readonly Dictionary<string, Texture2D> IconCache = new();
    private static readonly Dictionary<int, GlobalObjectId> gidCache = new();
    private static readonly Dictionary<int, Color> tintCache = new();
    private static HashSet<int> currentSelection = new();

    private static readonly Type SceneHierarchyType =
        typeof(Editor).Assembly.GetType("UnityEditor.SceneHierarchy");
    private static readonly PropertyInfo LastHierarchyProp =
        SceneHierarchyType.GetProperty("lastInteractedHierarchy",
                                       BindingFlags.Public | BindingFlags.Static);
    private static readonly MethodInfo SetExpanded =
        SceneHierarchyType.GetMethod("SetExpanded", BindingFlags.Public | BindingFlags.Instance);
    private static readonly MethodInfo IsExpanded =
        SceneHierarchyType.GetMethod("IsExpanded", BindingFlags.Public | BindingFlags.Instance);

    private delegate void SetIconDel(UnityEngine.Object o, Texture2D t);
    private static readonly SetIconDel SetIcon =
        (SetIconDel)Delegate.CreateDelegate(typeof(SetIconDel),
            typeof(EditorGUIUtility).GetMethod("SetIconForObject",
                 BindingFlags.Static | BindingFlags.Public | BindingFlags.NonPublic)!);

    private static readonly GUIContent GC = new();
    private static readonly Color HoverPro = new(1, 1, 1, .02f),
                                 HoverPersonal = new(0, 0, 0, .05f);
    #endregion

    #region initialisation
    private const string PalKey = "PCustomPalettes";
    [Serializable] private sealed class Wrapper<T> { public List<T> items = new(); }

    static HierarchyColorEditor()
    {
        MergeSavedPalettes();
        EditorApplication.hierarchyWindowItemOnGUI += RowGUI;
        Selection.selectionChanged += () => currentSelection = new HashSet<int>(Selection.instanceIDs);
    }

    private static void MergeSavedPalettes()
    {
        var json = EditorPrefs.GetString(PalKey, string.Empty);
        if (string.IsNullOrEmpty(json)) return;
        var extras = JsonUtility.FromJson<Wrapper<Color[]>>(json).items;
        foreach (var p in extras)
            if (!((List<Color[]>)PaletteData.HierarchyPalettes).Contains(p))
                ((List<Color[]>)PaletteData.HierarchyPalettes).Add(p);
    }
    #endregion

    #region row-GUI
    private static void RowGUI(int id, Rect row)
    {
        var go = EditorUtility.InstanceIDToObject(id) as GameObject;
        if (go == null) return;

        bool isPrefabRoot = PrefabUtility.IsAnyPrefabInstanceRoot(go);
        bool isDisabled = !go.activeInHierarchy;                            // new - test for disabled objects

        /* caches ............................................................ */
        if (!gidCache.TryGetValue(id, out var gid))
            gidCache[id] = gid = GlobalObjectId.GetGlobalObjectIdSlow(go);

        if (!tintCache.TryGetValue(id, out var rowTint))
        {
            HierarchyColorStore.instance.TryGetColor(gid, out var tint);
            rowTint = tint == default ? PaletteData.DefaultHierarchyGrey : tint;
            tintCache[id] = rowTint;
        }

        bool selected = currentSelection.Contains(id);

        /* -------- HOVER TEST -------------------------------------------------
           We expand the hit-test to the *full* view width so the prefab arrow
           area (which sits beyond the standard row width) also counts. */
        Rect fullRow = new Rect(0, row.y, EditorGUIUtility.currentViewWidth, row.height);
        bool hovering = fullRow.Contains(Event.current.mousePosition);

        bool flatPad = selected || hovering;     // pad = 0 when selected *or* hovering
        /* -------------------------------------------------------------------- */

        DrawStrip(row, rowTint, flatPad ? 0f : VPad);

        /* highlight overlay (uses fullRow for arrow-hover too) */
        if (Event.current.type == EventType.Repaint && (hovering || selected))
        {
            var col = EditorGUIUtility.isProSkin ? HoverPro : HoverPersonal;
            EditorGUI.DrawRect(fullRow, col);
        }

        /* left-side object icon */
        var iconTex = EditorGUIUtility.ObjectContent(go, typeof(GameObject)).image as Texture2D;
        if (iconTex != null)
            GUI.DrawTexture(new Rect(row.x, row.y + (flatPad ? 0f : VPad),
                                     16, 16), iconTex, ScaleMode.ScaleToFit, true);

        /* name label */
        GC.text = go.name; GC.image = null;

        var save = GUI.color;
        Color labelColor;                                                       // new - choose text colour
        if (isDisabled)
            labelColor = DisabledTextGrey;
        else if (isPrefabRoot)
            labelColor = PrefabTextBlue;
        else
            labelColor = Contrast(rowTint);
        GUI.color = labelColor;

        GUIStyle nameStyle = isPrefabRoot ? new GUIStyle("PR PrefabLabel") : EditorStyles.label;
        GUI.Label(new Rect(row.x + 18, row.y + (flatPad ? 0f : VPad),
                           row.width - 18, row.height - (flatPad ? 0f : VPad)),
                  GC, nameStyle);
        GUI.color = save;

        /* ► open-prefab arrow */
        if (isPrefabRoot)
        {
            GUIStyle arrow = "ArrowNavigationRight";
            float size = arrow.fixedWidth > 0 ? arrow.fixedWidth : 12f;

            var r = new Rect(EditorGUIUtility.currentViewWidth - size,
                             row.y + (flatPad ? 0f : VPad) + (row.height - size) * 0.5f,
                             size, size);
            if (GUI.Button(r, GUIContent.none, arrow))
                OpenPrefabInContext(go);
        }

        /* Alt-click palette popup */
        if (Event.current.type == EventType.MouseDown &&
            Event.current.alt && Event.current.button == 0 && row.Contains(Event.current.mousePosition))
        {
            PalettePopup.Show(go, gid, GUIUtility.GUIToScreenPoint(Event.current.mousePosition));
            Event.current.Use();
        }
    }

    private static void DrawStrip(Rect row, Color col, float pad)
    {
        var r = new Rect(row.x + GutterW, row.y + pad,
                         EditorGUIUtility.currentViewWidth - GutterW, row.height - pad);
        int old = GUI.depth; GUI.depth = StripDepth;
        EditorGUI.DrawRect(r, col);
        GUI.depth = old;
    }

    private static Color Contrast(Color c) =>
        (.299f * c.r + .587f * c.g + .114f * c.b) > .6f ? Color.black : Color.white;
    #endregion

    #region prefab helper
    private static void OpenPrefabInContext(GameObject instanceRoot)
    {
        var asset = PrefabUtility.GetCorrespondingObjectFromSource(instanceRoot);
        if (asset == null) return;

        var path = AssetDatabase.GetAssetPath(asset);
        if (string.IsNullOrEmpty(path)) return;

        // Two-parameter overload works on every supported Unity version
        PrefabStageUtility.OpenPrefab(path, instanceRoot);
    }
    #endregion

    #region PalettePopup
    private sealed class PalettePopup : PopupWindowContent
    {
        private readonly GameObject go;
        private readonly GlobalObjectId gid;
        private bool drag;
        private Vector2 ds, ws;
        private readonly List<Rect> hot = new();
        private static GUIStyle XStyle;

        public PalettePopup(GameObject g, GlobalObjectId id) { go = g; gid = id; }

        public static void Show(GameObject g, GlobalObjectId id, Vector2 scr) =>
            PopupWindow.Show(new Rect(scr, Vector2.zero), new PalettePopup(g, id));

        public override Vector2 GetWindowSize()
        {
            int rows = 1 + (PaletteData.HierarchyPalettes.Count + 1) / 2 +
                       (PaletteData.IconNames.Count + IconsPerRow - 1) / IconsPerRow;

            return new Vector2(Pad * 2 + Cell * IconsPerRow,
                               Pad * (rows + 1) + Cell * rows);
        }

        public override void OnGUI(Rect _)
        {
            /* helper so we can invalidate row-tint cache on apply */
            void ApplyColour(Color c)
            {
                HierarchyColorStore.instance.SetColor(gid, c);
                tintCache.Remove(go.GetInstanceID()); // flush cache so tint updates instantly
                editorWindow.Close();
            }

            XStyle ??= new GUIStyle(EditorStyles.boldLabel) { alignment = TextAnchor.MiddleCenter };
            hot.Clear();
            float y = Pad;
            var e = Event.current;

            /* clear (X) button */
            var clr = new Rect(Pad, y, Cell - 2, Cell - 2);
            GUI.Box(clr, GUIContent.none);
            GUI.Label(clr, "X", XStyle);
            if (GUI.Button(clr, GUIContent.none, GUIStyle.none))
            {
                ApplyColour(PaletteData.DefaultHierarchyGrey);
                SetIcon(go, null);
                return;
            }
            hot.Add(clr);
            y += Cell + Pad;

            /* colour palettes */
            for (int p = 0; p < PaletteData.HierarchyPalettes.Count; p += 2)
            {
                var a = PaletteData.HierarchyPalettes[p];
                var b = (p + 1 < PaletteData.HierarchyPalettes.Count) ? PaletteData.HierarchyPalettes[p + 1] : null;

                for (int i = 0; i < a.Length; i++)
                {
                    var rA = new Rect(Pad + i * Cell, y, Cell - 2, Cell - 2);
                    EditorGUI.DrawRect(rA, a[i]);
                    if (GUI.Button(rA, GUIContent.none, GUIStyle.none))
                    {
                        ApplyColour(a[i]);
                        return;
                    }
                    hot.Add(rA);

                    if (b != null)
                    {
                        var rB = new Rect(Pad + (i + 5) * Cell, y, Cell - 2, Cell - 2);
                        EditorGUI.DrawRect(rB, b[i]);
                        if (GUI.Button(rB, GUIContent.none, GUIStyle.none))
                        {
                            ApplyColour(b[i]);
                            return;
                        }
                        hot.Add(rB);
                    }
                }
                y += Cell + Pad;
            }

            /* icon list */
            for (int i = 0; i < PaletteData.IconNames.Count; i++)
            {
                int row = i / IconsPerRow, col = i % IconsPerRow;
                var tex = LoadIcon(PaletteData.IconNames[i]);
                if (tex == null) continue;

                var r = new Rect(Pad + col * Cell,
                                 y + row * (Cell + Pad),
                                 Cell - 2, Cell - 2);
                if (GUI.Button(r, tex, GUIStyle.none))
                {
                    SetIcon(go, tex);
                    editorWindow.Close();
                    return;
                }
                hot.Add(r);
            }

            /* draggable window */
            switch (e.type)
            {
                case EventType.MouseDown when e.button == 0 &&
                                             !hot.Exists(r => r.Contains(e.mousePosition)):
                    drag = true; ds = GUIUtility.GUIToScreenPoint(e.mousePosition); ws = editorWindow.position.position; break;
                case EventType.MouseDrag when drag:
                    var now = GUIUtility.GUIToScreenPoint(e.mousePosition);
                    editorWindow.position = new Rect(ws + (now - ds), editorWindow.position.size); break;
                case EventType.MouseUp: drag = false; break;
            }
        }

        private static Texture2D LoadIcon(string name)
        {
            if (IconCache.TryGetValue(name, out var tex)) return tex;

            string skinPrefix = EditorGUIUtility.isProSkin ? "d_" : "";
            tex = EditorGUIUtility.FindTexture(skinPrefix + name) ??
                  EditorGUIUtility.FindTexture(name);

            tex ??= EditorGUIUtility.IconContent(name).image as Texture2D;

            if (tex == null && name.EndsWith(" Icon"))
                tex = EditorGUIUtility.IconContent(name[..^5]).image as Texture2D;

            if (tex != null) IconCache[name] = tex;
            return tex;
        }
    }
    #endregion
}
