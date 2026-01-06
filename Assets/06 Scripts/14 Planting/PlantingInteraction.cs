using UnityEngine;
using UnityEngine;

public class PlantingInteraction : MonoBehaviour
{
    [Header("References")]
    [SerializeField] private Camera playerCamera;
    [SerializeField] private float interactionRange = 5f;
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
        /// Get selected item from hotbar
        InventorySlot selectedSlot = InventoryManager.Instance.GetSelectedHotbarSlot();
        if (selectedSlot == null || selectedSlot.IsEmpty())
            return;

        /// Check if it's a seed
        if (selectedSlot.item.itemType != ItemType.Seed)
            return;

        /// Raycast to find seed bed
        Ray ray = playerCamera.ViewportPointToRay(new Vector3(0.5f, 0.5f, 0f));
        if (Physics.Raycast(ray, out RaycastHit hit, interactionRange, seedBedMask))
        {
            SeedBed seedBed = hit.collider.GetComponentInParent<SeedBed>();
            if (seedBed == null)
                return;

            /// Try to plant the seed
            if (seedBed.PlantSeed(selectedSlot.item))
            {
                /// Remove one seed from inventory
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