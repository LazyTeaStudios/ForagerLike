using System.Collections.Generic;
using UnityEngine;

[DisallowMultipleComponent]
public class Outline : MonoBehaviour
{
    // Kept for compatibility with your Interactable script
    public enum Mode { OutlineAll }
    public Mode OutlineMode = Mode.OutlineAll;

    public Color OutlineColor = Color.white;

    [Range(0f, 10f)]
    public float OutlineWidth = 3f;

    [Tooltip("OutlineWidth is user-friendly (0..10). This scales it before sending to the shader (default: 0.01 => 3 -> 0.03).")]
    public float WidthToShaderScale = 0.01f;

    [Tooltip("Optional: assign your outline shader here to avoid Shader.Find issues in builds.")]
    public Shader OutlineShader;

    private Renderer[] _renderers;
    private MaterialPropertyBlock _propBlock;

    // Cache original materials so we can restore cleanly
    private readonly Dictionary<Renderer, Material[]> _originalSharedMaterials = new Dictionary<Renderer, Material[]>();

    // Track created materials so we can update + destroy them
    private readonly List<Material> _createdOutlineMats = new List<Material>();

    private bool _applied;

    // Your shader must expose these properties
    private static readonly int ColorProperty = Shader.PropertyToID("_OutlineColor");
    private static readonly int WidthProperty = Shader.PropertyToID("_OutlineWidth");

    private const string DefaultShaderName = "Custom/SimpleOutline";

    private void Awake()
    {
        CacheRenderers();
        _propBlock = new MaterialPropertyBlock();
    }

    private void OnEnable()
    {
        ApplyOutline();
    }

    private void OnDisable()
    {
        RemoveOutline();
    }

    private void OnDestroy()
    {
        // Safety cleanup (especially in editor)
        RemoveOutline();
    }

    private void OnValidate()
    {
        if (enabled && _applied)
        {
            UpdateOutlineMaterialProperties();
        }
    }

    private void CacheRenderers()
    {
        _renderers = GetComponentsInChildren<Renderer>(true);
    }

    private Shader ResolveShader()
    {
        if (OutlineShader != null) return OutlineShader;
        return Shader.Find(DefaultShaderName);
    }

    private void ApplyOutline()
    {
        CacheRenderers();
        if (_renderers == null || _renderers.Length == 0) return;

        Shader shader = ResolveShader();

        // If shader is missing, use rim/emission fallback
        if (shader == null)
        {
            foreach (var r in _renderers)
            {
                if (r == null) continue;
                ApplyRimLighting(r);
            }
            _applied = true;
            return;
        }

        // Build outline pass for each renderer
        foreach (var r in _renderers)
        {
            if (r == null) continue;

            if (!_originalSharedMaterials.ContainsKey(r))
                _originalSharedMaterials[r] = r.sharedMaterials;

            // Start from sharedMaterials and remove any outline mats previously created by THIS component
            var mats = new List<Material>(r.sharedMaterials);
            for (int i = mats.Count - 1; i >= 0; i--)
            {
                var m = mats[i];
                if (m != null && _createdOutlineMats.Contains(m))
                    mats.RemoveAt(i);
            }

            var outlineMat = new Material(shader)
            {
                name = $"{shader.name} (Outline Instance)",
                hideFlags = HideFlags.DontSaveInBuild | HideFlags.DontSaveInEditor
            };

            outlineMat.SetColor(ColorProperty, OutlineColor);
            outlineMat.SetFloat(WidthProperty, OutlineWidth * WidthToShaderScale);

            mats.Add(outlineMat);

            _createdOutlineMats.Add(outlineMat);

            // Assign as per-renderer instance list
            r.materials = mats.ToArray();
        }

        _applied = true;
    }

    private void UpdateOutlineMaterialProperties()
    {
        float w = OutlineWidth * WidthToShaderScale;

        // If we have outline mats, update them
        for (int i = 0; i < _createdOutlineMats.Count; i++)
        {
            var m = _createdOutlineMats[i];
            if (m == null) continue;

            m.SetColor(ColorProperty, OutlineColor);
            m.SetFloat(WidthProperty, w);
        }

        // If we're in fallback mode (no outline mats), refresh emission
        if (_createdOutlineMats.Count == 0 && _renderers != null)
        {
            foreach (var r in _renderers)
            {
                if (r == null) continue;
                ApplyRimLighting(r);
            }
        }
    }

    private void RemoveOutline()
    {
        if (!_applied) return;

        // Restore original materials
        foreach (var kvp in _originalSharedMaterials)
        {
            Renderer r = kvp.Key;
            if (r == null) continue;

            r.sharedMaterials = kvp.Value;
            r.SetPropertyBlock(null);
        }
        _originalSharedMaterials.Clear();

        // Destroy created outline materials
        for (int i = 0; i < _createdOutlineMats.Count; i++)
        {
            var m = _createdOutlineMats[i];
            if (m == null) continue;

#if UNITY_EDITOR
            if (!Application.isPlaying) DestroyImmediate(m);
            else Destroy(m);
#else
            Destroy(m);
#endif
        }
        _createdOutlineMats.Clear();

        _applied = false;
    }

    // Fallback (requires your base shader/material to support emission)
    private void ApplyRimLighting(Renderer renderer)
    {
        renderer.GetPropertyBlock(_propBlock);
        _propBlock.SetColor("_EmissionColor", OutlineColor * 2f);
        renderer.SetPropertyBlock(_propBlock);
    }
}
