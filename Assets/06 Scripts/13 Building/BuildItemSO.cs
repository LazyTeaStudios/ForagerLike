using UnityEngine;

public enum PlacementSurface { GroundOnly, WallOnly, Both }

[System.Serializable]
public class ResourceRequirement
{
    public ItemData item;
    public int quantity = 1;
}

[CreateAssetMenu(menuName = "Building/Build Item", fileName = "BuildItemSO")]
public class BuildItemSO : ScriptableObject
{
    public string displayName;
    [TextArea(2, 4)] public string description;
    public Sprite icon;
    public GameObject prefab;

    [Header("Resource Requirements")]
    public ResourceRequirement[] requiredResources;

    [Header("Placement Settings")]
    public PlacementSurface allowedSurfaces = PlacementSurface.GroundOnly;
    [Range(0f, 90f)] public float maxGroundAngle = 45f;
    [Range(0f, 90f)] public float maxWallAngle = 30f;

    [Header("Snapping")]
    [Tooltip("If true, this item will NEVER snap to grid even if snapping is enabled/toggled on.")]
    public bool cantSnapToGrid = false;

    [Header("Research")]
    public bool unlockedByDefault = true;
}