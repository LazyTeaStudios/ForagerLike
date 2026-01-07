using System;
using UnityEngine;

[CreateAssetMenu(fileName = "New Biome Data", menuName = "Environment/Biome Data")]
public class BiomeData : ScriptableObject
{
    public BiomeType biomeType;
    public GameObject[] spawnablePrefabs;
    public int maxSpawnCount = 50;
    public LayerMask groundLayer;
}
