using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(menuName = "Building/Build Catalog", fileName = "BuildCatalogSO")]
public class BuildCatalogSO : ScriptableObject
{
    public List<BuildItemSO> items = new List<BuildItemSO>();
}