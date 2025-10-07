// Assets/Editor/HierarchyColorStore.cs
using System;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

[Serializable]
[FilePath("ProjectSettings/HierarchyColorStore.asset",
          FilePathAttribute.Location.ProjectFolder)]
internal class HierarchyColorStore : ScriptableSingleton<HierarchyColorStore>
{
    /* ?????????????? serialised entry ?????????????? */
    [Serializable]
    private struct Entry
    {
        public string id;   // GID_, FILEID_, or PATH_
        public Color tint;
        public string icon;
    }

    [SerializeField] private List<Entry> entries = new();   // persisted
    private Dictionary<string, Entry> dict = new();         // runtime cache

    /* ?????????????? key helpers ?????????????? */
    private static string ExactKey(in GlobalObjectId gid) => gid.ToString();
    private static string FileIdKey(in GlobalObjectId gid) => $"FILEID_{gid.targetObjectId}";
    private static string PathKey(Transform t)
    {
        var names = new List<string>();
        for (var c = t; c; c = c.parent) names.Add(c.name);
        names.Reverse();
        return "PATH_" + string.Join("/", names);
    }
    private static bool IsAsset(in GlobalObjectId gid) => !gid.assetGUID.Empty();

    /* ?????????????? lifecycle ?????????????? */
    private void OnEnable()
    {
        dict.Clear();
        foreach (var e in entries) dict[e.id] = e;
    }
    private void OnDisable() => Save(true);

    /* ?????????????? helpers ?????????????? */
    private void Upsert(string id, Color tint, string icon)
    {
        var n = new Entry { id = id, tint = tint, icon = icon };
        dict[id] = n;
        int idx = entries.FindIndex(e => e.id == id);
        if (idx >= 0) entries[idx] = n; else entries.Add(n);
        Save(true);
    }
    private void Remove(string id)
    {
        dict.Remove(id);
        entries.RemoveAll(e => e.id == id);
    }
    private Color TintOf(string id) => dict.TryGetValue(id, out var e) ? e.tint : default;
    private string IconOf(string id) => dict.TryGetValue(id, out var e) ? e.icon : null;

    /* ?????????????? Colours API ?????????????? */
    public bool TryGetColor(in GlobalObjectId gid, out Color tint)
    {
        /* 1?? exact GID */
        if (dict.TryGetValue(ExactKey(gid), out var e) && e.tint.a > 0f)
        { tint = e.tint; return true; }

        /* 2?? FILEID fallback */
        if (!IsAsset(gid) && dict.TryGetValue(FileIdKey(gid), out e) && e.tint.a > 0f)
        { Upsert(ExactKey(gid), e.tint, e.icon); tint = e.tint; return true; }

        /* 3?? PATH fallback */
        System.Object obj = GlobalObjectId.GlobalObjectIdentifierToObjectSlow(gid);
        if (obj is GameObject go &&
            dict.TryGetValue(PathKey(go.transform), out e) && e.tint.a > 0f)
        {
            Upsert(ExactKey(gid), e.tint, e.icon);
            tint = e.tint;
            return true;
        }

        tint = default; return false;
    }

    public void SetColor(in GlobalObjectId gid, Color tint)
    {
        Upsert(ExactKey(gid), tint, IconOf(ExactKey(gid)));          // exact
        if (!IsAsset(gid))
            Upsert(FileIdKey(gid), tint, IconOf(FileIdKey(gid)));    // file-id

        System.Object obj = GlobalObjectId.GlobalObjectIdentifierToObjectSlow(gid);
        if (obj is GameObject go)
            Upsert(PathKey(go.transform), tint, IconOf(PathKey(go.transform))); // path
    }

    public void RemoveColor(in GlobalObjectId gid)
    {
        Remove(ExactKey(gid));
        if (!IsAsset(gid)) Remove(FileIdKey(gid));

        System.Object obj = GlobalObjectId.GlobalObjectIdentifierToObjectSlow(gid);
        if (obj is GameObject go) Remove(PathKey(go.transform));

        Save(true);
    }

    /* ?????????????? Icons API ?????????????? */
    public bool TryGetIcon(in GlobalObjectId gid, out string icon)
    {
        if (dict.TryGetValue(ExactKey(gid), out var e) && !string.IsNullOrEmpty(e.icon))
        { icon = e.icon; return true; }

        if (!IsAsset(gid) && dict.TryGetValue(FileIdKey(gid), out e) && !string.IsNullOrEmpty(e.icon))
        { Upsert(ExactKey(gid), e.tint, e.icon); icon = e.icon; return true; }

        System.Object obj = GlobalObjectId.GlobalObjectIdentifierToObjectSlow(gid);
        if (obj is GameObject go &&
            dict.TryGetValue(PathKey(go.transform), out e) && !string.IsNullOrEmpty(e.icon))
        {
            Upsert(ExactKey(gid), e.tint, e.icon);
            icon = e.icon;
            return true;
        }

        icon = null; return false;
    }

    public void SetIcon(in GlobalObjectId gid, string iconName)
    {
        Upsert(ExactKey(gid), TintOf(ExactKey(gid)), iconName);
        if (!IsAsset(gid))
            Upsert(FileIdKey(gid), TintOf(FileIdKey(gid)), iconName);

        System.Object obj = GlobalObjectId.GlobalObjectIdentifierToObjectSlow(gid);
        if (obj is GameObject go)
            Upsert(PathKey(go.transform), TintOf(PathKey(go.transform)), iconName);
    }
}
