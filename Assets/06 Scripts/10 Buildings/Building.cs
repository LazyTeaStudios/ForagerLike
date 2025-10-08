using UnityEngine;

public class Building : MonoBehaviour
{
    public ItemData itemData;
    private Vector3Int gridPosition;

    [Header("UI")]
    private CraftingUI craftingUI;

    public Vector3Int GridPosition => gridPosition;

    void Awake()
    {
        if (craftingUI == null) craftingUI = GetComponentInChildren<CraftingUI>(true);
        if (craftingUI != null) craftingUI.Initialize(this);
    }

    public void Initialize(ItemData data, Vector3Int position)
    {
        itemData = data;
        gridPosition = position;
    }

    void OnMouseDown()
    {
        if (InputHandler.IsMapActive(ActionMap.Gameplay) &&
            InputHandler.Pressed(GameAction.GameplayMouseLeftClick))
        {
            OpenCraftingUI();
        }
    }

    void OpenCraftingUI()
    {
        if (craftingUI == null) return;

        InventoryUI.Instance.OpenInventoryForBuilding();
        craftingUI.Open();
    }
}
