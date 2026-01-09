using UnityEngine;

public class PlantingInteraction : MonoBehaviour
{
    [Header("References")]
    private Camera playerCamera;
    private float interactionRange = 5f;

    [SerializeField] private LayerMask seedBedMask = -1;

    void Awake()
    {
        if (playerCamera == null)
            playerCamera = Camera.main;
    }

    void Update()
    {
        if (InputHandler.IsMapActive(ActionMap.UI))
            return;

        if (InputHandler.Pressed(GameAction.GameplayMouseLeftClick))
        {
            TryPlantSeed();
        }
    }

    void TryPlantSeed()
    {
        InventorySlot selectedSlot = InventoryManager.Instance.GetSelectedHotbarSlot();
        if (selectedSlot == null || selectedSlot.IsEmpty())
            return;

        if (selectedSlot.item.itemType != ItemType.Seed)
            return;

        Ray ray = playerCamera.ViewportPointToRay(new Vector3(0.5f, 0.5f, 0f));
        if (Physics.Raycast(ray, out RaycastHit hit, interactionRange, seedBedMask))
        {
            SeedBed seedBed = hit.collider.GetComponentInParent<SeedBed>();
            if (seedBed == null)
                return;

            if (seedBed.PlantSeed(selectedSlot.item))
            {
                InventoryManager.Instance.RemoveItem(selectedSlot.item, 1);
                Debug.Log($"Planted {selectedSlot.item.itemName}");
            }
            else
            {
                Debug.Log("Seed bed is already occupied!");
            }
        }
    }
}