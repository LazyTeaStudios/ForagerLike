using UnityEngine;

public enum PlacementSurface { GroundOnly, WallOnly, Both }

[CreateAssetMenu(menuName = "Building/Build Item", fileName = "BuildItemSO")]
public class BuildItemSO : ScriptableObject
{
    public string displayName;
    public Sprite icon;
    public GameObject prefab;
    public PlacementSurface allowedSurfaces = PlacementSurface.GroundOnly;
    
    [Range(0f, 90f)] public float maxGroundAngle = 45f;
    [Range(0f, 90f)] public float maxWallAngle = 30f;
}
