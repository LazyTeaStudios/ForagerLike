using UnityEngine;

[CreateAssetMenu(fileName = "ProcessingRecipe", menuName = "Crafting/Processing Recipe")]
public class ProcessingRecipe : ScriptableObject
{
    [Header("Input")]
    public ItemData inputItem;
    public int inputQuantity = 1;

    [Header("Output")]
    public ItemData outputItem;
    public int outputQuantity = 1;

    [Header("Processing")]
    public float processingTime = 5f;

    public bool CanProcess(ItemData item, int availableQuantity)
    {
        return item == inputItem && availableQuantity >= inputQuantity;
    }
}