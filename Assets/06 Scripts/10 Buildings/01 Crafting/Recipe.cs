using UnityEngine;
using System.Collections.Generic;

[CreateAssetMenu(fileName = "New Recipe", menuName = "Crafting/Recipe")]
public class Recipe : ScriptableObject
{
    [Header("Recipe Info")]
    public string recipeName;
    public Sprite recipeIcon;
    public float craftingTime = 2f;

    [Header("Requirements")]
    public List<ItemRequirement> inputs = new List<ItemRequirement>();

    [Header("Results")]
    public List<ItemResult> outputs = new List<ItemResult>();
}

[System.Serializable]
public class ItemRequirement
{
    public ItemData item;
    public int quantity = 1;
}

[System.Serializable]
public class ItemResult
{
    public ItemData item;
    public int quantity = 1;
}