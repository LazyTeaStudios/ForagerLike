// Assets/Editor/ProjectColorEditor.cs
using UnityEditor;
using UnityEngine;
using System;
using System.Collections.Generic;
using Object = UnityEngine.Object;

[InitializeOnLoad]
internal static class ProjectColorEditor
{
    #region Constants
    private const float Pad = 7f, Cell = 24f;
    private const int IconsPerRow = 10;
    #endregion

    #region Caches
    private static readonly Dictionary<int, Texture2D> TintedIconCache = new();
    private static readonly Dictionary<string, Texture2D> IconCache = new();
    private static Color32[] SourceMask;
    private static int MaskW, MaskH;
    #endregion

    #region Persistence
    private const string PalKey = "PCustomPalettes";
    [Serializable] private sealed class Wrapper<T> { public List<T> items = new(); }
    #endregion

    #region Init
    static ProjectColorEditor()
    {
        MergeSavedPalettes();
        var src = EditorIcon("Folder Icon");
        MaskW = src.width;
        MaskH = src.height;

        var rt = RenderTexture.GetTemporary(MaskW, MaskH, 0, RenderTextureFormat.Default, RenderTextureReadWrite.Linear);
        Graphics.Blit(src, rt);
        var prev = RenderTexture.active;
        RenderTexture.active = rt;

        var readable = new Texture2D(MaskW, MaskH, TextureFormat.RGBA32, false);
        readable.ReadPixels(new Rect(0, 0, MaskW, MaskH), 0, 0);
        readable.Apply();
        RenderTexture.active = prev;
        RenderTexture.ReleaseTemporary(rt);

        SourceMask = readable.GetPixels32();
        EditorApplication.projectWindowItemOnGUI += RowGUI;

        EditorApplication.delayCall += PrewarmIconCache;
    }

    private static void PrewarmIconCache()
    {
        foreach (var name in PaletteData.IconNames)
            PalettePopup.LoadIcon(name);

        // force a repaint so rows draw with the now-ready textures
        EditorApplication.RepaintProjectWindow();              // <??
    }

    private static void MergeSavedPalettes()
    {
        var json = EditorPrefs.GetString(PalKey, string.Empty);
        if (string.IsNullOrEmpty(json)) return;
        var extras = JsonUtility.FromJson<Wrapper<Color[]>>(json).items;
        if (PaletteData.ProjectPalettes is List<Color[]> list)
            foreach (var p in extras) if (!list.Contains(p)) list.Add(p);
    }
    #endregion

    #region GUI
    private static void RowGUI(string guid, Rect rect)
    {
        var path = AssetDatabase.GUIDToAssetPath(guid);
        if (!AssetDatabase.IsValidFolder(path)) return;

        var obj = AssetDatabase.LoadAssetAtPath<Object>(path);
        var gid = GlobalObjectId.GetGlobalObjectIdSlow(obj);
        var iconRect = GetIconRect(rect);

        if (HierarchyColorStore.instance.TryGetColor(gid, out var tint))
        {
            var sh = iconRect; sh.position += new Vector2(3, -3);
            GUI.color = new Color(0, 0, 0, .1f);
            GUI.DrawTexture(sh, GetTintedFolderIcon(tint));
            GUI.color = Color.white;
            GUI.DrawTexture(iconRect, GetTintedFolderIcon(tint));
        }

        if (HierarchyColorStore.instance.TryGetIcon(gid, out var iconName))
        {
            /* ??? tweakables ??????????????????????????????????????????????? */
            const float glyphScale = 0.40f;   // size of the coloured icon
            const float backdropScale = 0.70f;   // size of the block behind the icon
            const float backdropAlpha = 0.35f;   // opacity of the block
            const float shadowOffset = 2f;      // px offset down/right
            const float shadowAlpha = 0.25f;   // opacity of the drop shadow
            var glyphOffset = new Vector2(17f, -13f);
            /* ??????????????????????????????????????????????????????????????? */

            var glyph = EditorIcon(iconName);
            if (glyph != null)
            {
                float gSize = iconRect.width * glyphScale;
                float cx = iconRect.x + iconRect.width * 0.5f + glyphOffset.x;
                float cy = iconRect.y + iconRect.height * 0.5f - glyphOffset.y;

                static Rect Center(float x, float y, float s) =>
                    new(x - s * 0.5f, y - s * 0.5f, s, s);

                var iconRectC = Center(cx, cy, gSize);

                /* 1??  square “placard” backdrop */
                GUI.color = new Color(0, 0, 0, backdropAlpha);
                EditorGUI.DrawRect(Center(cx, cy, gSize * backdropScale), GUI.color);

                /* 2??  drop-shadow (slightly offset) */
                GUI.color = new Color(0, 0, 0, shadowAlpha);
                var shadowRect = iconRectC; shadowRect.position += new Vector2(shadowOffset, -shadowOffset);
                GUI.DrawTexture(shadowRect, glyph, ScaleMode.ScaleToFit, true);

                /* 3??  final glyph */
                GUI.color = Color.white;
                GUI.DrawTexture(iconRectC, glyph, ScaleMode.ScaleToFit, true);
            }
        }

        if (Event.current.alt && Event.current.type == EventType.MouseDown && rect.Contains(Event.current.mousePosition))
        {
            PalettePopup.Show(obj, gid, GUIUtility.GUIToScreenPoint(Event.current.mousePosition));
            Event.current.Use();
        }
    }

    private static Rect GetIconRect(Rect row)
    {
        var s = Mathf.Min(row.width, row.height);
        return new Rect(row.x, row.y, s, s);
    }
    #endregion

    #region Tinting
    private static Texture2D GetTintedFolderIcon(Color tint)
    {
        var key = PackColor(tint);
        if (TintedIconCache.TryGetValue(key, out var tex)) return tex;

        var t32 = (Color32)tint;
        var dest = new Color32[SourceMask.Length];
        for (var i = 0; i < dest.Length; i++)
        {
            var a = SourceMask[i].a;
            dest[i] = a == 0 ? SourceMask[i] : new Color32(t32.r, t32.g, t32.b, a);
        }

        var icon = new Texture2D(MaskW, MaskH, TextureFormat.RGBA32, false);
        icon.SetPixels32(dest);
        icon.Apply(false, true);
        icon.hideFlags = HideFlags.HideAndDontSave;
        return TintedIconCache[key] = icon;
    }

    private static int PackColor(Color c)
    {
        Color32 k = c;
        return (k.r << 24) | (k.g << 16) | (k.b << 8) | k.a;
    }
    #endregion

    #region Icons
    private static Texture2D EditorIcon(string name)
    {
        if (IconCache.TryGetValue(name, out var tex)) return tex;
        tex = EditorGUIUtility.FindTexture(EditorGUIUtility.isProSkin ? "d_" + name : name) ??
              EditorGUIUtility.FindTexture(EditorGUIUtility.isProSkin ? name : "d_" + name);
        return IconCache[name] = tex;
    }
    #endregion

    #region Popup
    private sealed class PalettePopup : PopupWindowContent
    {
        private readonly Object target;
        private readonly GlobalObjectId gid;
        private bool drag;
        private Vector2 ds, ws;
        private readonly List<Rect> hot = new();
        private static GUIStyle XStyle;

        public PalettePopup(Object o, GlobalObjectId id) { target = o; gid = id; }
        public static void Show(Object o, GlobalObjectId id, Vector2 scr) =>
            PopupWindow.Show(new Rect(scr, Vector2.zero), new PalettePopup(o, id));

        public override Vector2 GetWindowSize()
        {
            var rows = 1 +
                       (PaletteData.ProjectPalettes.Count + 1) / 2 +
                       (PaletteData.IconNames.Count + IconsPerRow - 1) / IconsPerRow;
            return new Vector2(Pad * 2 + Cell * IconsPerRow, Pad * (rows + 1) + Cell * rows);
        }

        public override void OnGUI(Rect _)
        {
            XStyle ??= new GUIStyle(EditorStyles.boldLabel) { alignment = TextAnchor.MiddleCenter };
            hot.Clear();
            var y = Pad;
            var e = Event.current;

            var clr = new Rect(Pad, y, Cell - 2, Cell - 2);
            GUI.Box(clr, GUIContent.none);
            GUI.Label(clr, "X", XStyle);
            if (GUI.Button(clr, GUIContent.none, GUIStyle.none))
            {
                HierarchyColorStore.instance.RemoveColor(gid);
                SetIcon(target, null);
                editorWindow.Close();
                return;
            }
            hot.Add(clr);
            y += Cell + Pad;

            for (var p = 0; p < PaletteData.ProjectPalettes.Count; p += 2)
            {
                var a = PaletteData.ProjectPalettes[p];
                var b = (p + 1 < PaletteData.ProjectPalettes.Count) ? PaletteData.ProjectPalettes[p + 1] : null;
                for (var i = 0; i < a.Length; i++)
                {
                    var rA = new Rect(Pad + i * Cell, y, Cell - 2, Cell - 2);
                    EditorGUI.DrawRect(rA, a[i]);
                    if (GUI.Button(rA, GUIContent.none, GUIStyle.none))
                    {
                        HierarchyColorStore.instance.SetColor(gid, a[i]);
                        editorWindow.Close();
                        return;
                    }
                    hot.Add(rA);

                    if (b == null) continue;
                    var rB = new Rect(Pad + (i + 5) * Cell, y, Cell - 2, Cell - 2);
                    EditorGUI.DrawRect(rB, b[i]);
                    if (GUI.Button(rB, GUIContent.none, GUIStyle.none))
                    {
                        HierarchyColorStore.instance.SetColor(gid, b[i]);
                        editorWindow.Close();
                        return;
                    }
                    hot.Add(rB);
                }
                y += Cell + Pad;
            }

            for (var i = 0; i < PaletteData.IconNames.Count; i++)
            {
                var row = i / IconsPerRow;
                var col = i % IconsPerRow;
                var tex = LoadIcon(PaletteData.IconNames[i]);
                if (tex == null) continue;

                var r = new Rect(Pad + col * Cell, y + row * (Cell + Pad), Cell - 2, Cell - 2);
                if (GUI.Button(r, tex, GUIStyle.none))
                {
                    HierarchyColorStore.instance.SetIcon(gid, PaletteData.IconNames[i]);
                    editorWindow.Close();
                    return;
                }
                hot.Add(r);
            }

            switch (e.type)
            {
                case EventType.MouseDown when e.button == 0 && !hot.Exists(r => r.Contains(e.mousePosition)):
                    drag = true;
                    ds = GUIUtility.GUIToScreenPoint(e.mousePosition);
                    ws = editorWindow.position.position;
                    break;
                case EventType.MouseDrag when drag:
                    var now = GUIUtility.GUIToScreenPoint(e.mousePosition);
                    editorWindow.position = new Rect(ws + (now - ds), editorWindow.position.size);
                    break;
                case EventType.MouseUp:
                    drag = false;
                    break;
            }
        }

        public static Texture2D LoadIcon(string name)
        {
            if (IconCache.TryGetValue(name, out var tex) && tex != null)
                return tex;                     // found & cached

            string skinPrefix = EditorGUIUtility.isProSkin ? "d_" : "";

            // 1??  direct texture in current skin
            tex = EditorGUIUtility.FindTexture(skinPrefix + name)
               ?? EditorGUIUtility.FindTexture(name);

            // 2??  built-in virtual icon
            tex ??= EditorGUIUtility.IconContent(name).image as Texture2D;

            // 3??  try without the trailing " Icon" (Unity sometimes omits it)
            if (tex == null && name.EndsWith(" Icon"))
                tex = EditorGUIUtility.IconContent(name[..^5]).image as Texture2D;

            // ? store only if we *actually* got something
            if (tex != null) IconCache[name] = tex;
            return tex;                         // may still be null (caller skips)
        }

        private delegate void SetIconDel(UnityEngine.Object o, Texture2D t);
        private static readonly SetIconDel SetIcon =
            (SetIconDel)Delegate.CreateDelegate(typeof(SetIconDel),
                typeof(EditorGUIUtility).GetMethod("SetIconForObject",
                    System.Reflection.BindingFlags.Static |
                    System.Reflection.BindingFlags.Public |
                    System.Reflection.BindingFlags.NonPublic)!);
    }
    #endregion
}
