using UnityEngine;

[CreateAssetMenu(fileName = "ProcessingRecipe", menuName = "Crafting/Processing Recipe")]
public class ProcessingRecipe : ScriptableObject
{
    [Header("Input")]
    public ItemData inputItem1;
    public int inputQuantity1 = 1;

    [Space]
    public ItemData inputItem2;
    public int inputQuantity2 = 1;

    [Header("Output")]
    public ItemData outputItem;
    public int outputQuantity = 1;

    [Header("Processing")]
    public float processingTime = 5f;

    public bool CanProcess(ItemData item1, int qty1, ItemData item2, int qty2)
    {
        // Single input recipe
        if (inputItem2 == null)
        {
            return (item1 == inputItem1 && qty1 >= inputQuantity1) ||
                   (item2 == inputItem1 && qty2 >= inputQuantity1);
        }

        // Two input recipe - check both combinations
        bool combination1 = (item1 == inputItem1 && qty1 >= inputQuantity1 &&
                            item2 == inputItem2 && qty2 >= inputQuantity2);

        bool combination2 = (item1 == inputItem2 && qty1 >= inputQuantity2 &&
                            item2 == inputItem1 && qty2 >= inputQuantity1);

        return combination1 || combination2;
    }

    public void GetRequiredAmounts(ItemData item1, ItemData item2, out int required1, out int required2)
    {
        required1 = 0;
        required2 = 0;

        if (inputItem2 == null)
        {
            // Single input
            if (item1 == inputItem1) required1 = inputQuantity1;
            else if (item2 == inputItem1) required2 = inputQuantity1;
        }
        else
        {
            // Two inputs - determine which combination matches
            if (item1 == inputItem1 && item2 == inputItem2)
            {
                required1 = inputQuantity1;
                required2 = inputQuantity2;
            }
            else if (item1 == inputItem2 && item2 == inputItem1)
            {
                required1 = inputQuantity2;
                required2 = inputQuantity1;
            }
        }
    }
}