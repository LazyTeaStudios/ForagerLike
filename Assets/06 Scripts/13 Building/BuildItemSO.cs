using UnityEngine;

public enum PlacementSurface
{
    GroundOnly,
    WallOnly,
    Both
}

[CreateAssetMenu(menuName = "Building/Build Item", fileName = "BuildItemSO")]
public class BuildItemSO : ScriptableObject
{
    public string displayName;
    public Sprite icon;
    public GameObject prefab;
    public PlacementSurface allowedSurfaces = PlacementSurface.GroundOnly;

    [Tooltip("Maximum angle from up vector to count as ground (e.g., 45 = slopes up to 45°)")]
    [Range(0f, 90f)]
    public float maxGroundAngle = 45f;

    [Tooltip("Maximum angle from horizontal to count as wall (e.g., 30 = walls within 30° of vertical)")]
    [Range(0f, 90f)]
    public float maxWallAngle = 30f;
}