// Assets/Editor/PaletteData.cs
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

internal static class PaletteData
{
    #region Helpers
    private static Color RGB32(byte r, byte g, byte b) => new Color32(r, g, b, 255).ToColor();
    public static Color DefaultHierarchyGrey =>
        EditorGUIUtility.isProSkin ? RGB32(56, 56, 56) : RGB32(194, 194, 194);
    #endregion

    #region Icon Names
    public static readonly IReadOnlyList<string> IconNames = new[]
    {
        "Folder Icon","FolderEmpty Icon","FolderFavorite Icon","FolderOpened Icon",
        "SceneAsset Icon","d_Settings@2x","d_Favorite@2x","d_PreMatCube@2x","d_PreMatCylinder@2x",
        "d_PreMatQuad@2x","d_PreMatSphere@2x","d_SaveAs@2x","Prefab Icon","PrefabVariant Icon",
        "PrefabModel Icon","GameObject Icon","RectTransform Icon","Avatar Icon","AvatarMask Icon",
        "cs Script Icon","ScriptableObject Icon","DefaultAsset Icon","TextAsset Icon","Material Icon",
        "Shader Icon","ComputeShader Icon","AudioClip Icon","AudioSource Icon","AudioListener Icon",
        "AudioReverbZone Icon","VideoClip Icon","VideoPlayer Icon","Texture Icon","Sprite Icon",
        "SpriteAtlas Icon","Cubemap Icon","AnimatorController Icon","AnimationClip Icon","BlendTree Icon",
        "Motion Icon","Canvas Icon","CanvasGroup Icon","Image Icon","Text Icon","Button Icon",
        "Slider Icon","Toggle Icon","Rigidbody Icon","BoxCollider Icon","CapsuleCollider Icon",
        "SphereCollider Icon","MeshCollider Icon","WheelCollider Icon","SpringJoint Icon",
        "CharacterController Icon","Camera Icon","Light Icon","ReflectionProbe Icon","Skybox Icon",
        "LightProbeGroup Icon","Terrain Icon","TerrainData Icon","TerrainCollider Icon",
        "ParticleSystem Icon","d_RawImage Icon","d_ShaderVariantCollection Icon","Font On Icon",
        "d_Texture Icon","Grid Icon","Tile Icon","Tilemap Icon","TilemapRenderer Icon",
        "TilemapCollider2D Icon"
    };
    #endregion

    #region Hierarchy Palettes
    private static readonly Color[][] _hierarchy =
    {
        new[]{ RGB32(23,61,45),RGB32(34,92,68),RGB32(47,127,90),RGB32(62,145,105),RGB32(78,163,120) },
        new[]{ RGB32(16,42,67),RGB32(31,59,90),RGB32(46,76,115),RGB32(54,85,127),RGB32(63,94,138) },
        new[]{ RGB32(41,26,54),RGB32(60,41,82),RGB32(80,56,110),RGB32(94,66,130),RGB32(107,76,150) },
        new[]{ RGB32(75,42,20),RGB32(107,59,26),RGB32(138,81,36),RGB32(150,95,46),RGB32(173,110,57) },
        new[]{ RGB32(71,29,36),RGB32(102,44,52),RGB32(135,60,68),RGB32(152,72,78),RGB32(169,84,87) },
        new[]{ RGB32(19,71,71),RGB32(22,102,102),RGB32(29,140,140),RGB32(45,155,155),RGB32(60,170,170) },
        new[]{ RGB32(71,64,19),RGB32(102,92,28),RGB32(136,122,38),RGB32(155,138,50),RGB32(171,154,61) },
        new[]{ RGB32(20,20,20),RGB32(28,28,28),RGB32(35,35,35),RGB32(42,42,42),RGB32(50,50,50) }
    };
    public static IReadOnlyList<Color[]> HierarchyPalettes => _hierarchy;
    #endregion

    #region Project Palettes
    private static readonly Color[][] _project =
    {
        new[]{ RGB32(39,166,87),RGB32(64,183,110),RGB32(89,200,134),RGB32(115,217,157),RGB32(140,234,181) },
        new[]{ RGB32(48,138,221),RGB32(76,158,229),RGB32(104,178,237),RGB32(131,198,245),RGB32(159,218,253) },
        new[]{ RGB32(118,86,234),RGB32(137,109,239),RGB32(156,132,244),RGB32(175,155,249),RGB32(194,178,255) },
        new[]{ RGB32(224,161,68),RGB32(232,176,96),RGB32(240,190,123),RGB32(247,205,151),RGB32(255,219,179) },
        new[]{ RGB32(215,60,74),RGB32(225,92,105),RGB32(235,124,136),RGB32(245,156,167),RGB32(255,188,198) },
        new[]{ RGB32(46,188,196),RGB32(76,200,206),RGB32(106,212,216),RGB32(136,224,226),RGB32(166,236,236) },
        new[]{ RGB32(255,215,74),RGB32(255,223,113),RGB32(255,231,151),RGB32(255,238,189),RGB32(255,246,228) },
        new[]{ RGB32(20,20,20),RGB32(24,24,24),RGB32(28,28,28),RGB32(32,32,32),RGB32(36,36,36) }
    };
    public static IReadOnlyList<Color[]> ProjectPalettes => _project;
    #endregion
}

internal static class ColorExtentions
{
    public static Color ToColor(this Color32 c) =>
        new Color(c.r / 255f, c.g / 255f, c.b / 255f, c.a / 255f);
}
