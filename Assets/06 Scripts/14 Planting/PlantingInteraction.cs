using UnityEngine;

public class PlantingInteraction : MonoBehaviour
{
    [Header("References")]
    [SerializeField] GameObject canPlantIndicator;

    [Header("Settings")]
    [SerializeField] float interactionRange = 5f;
    [SerializeField] LayerMask seedBedMask = -1;

    Camera playerCamera;
    bool indicatorState;

    void Awake()
    {
        playerCamera = Camera.main;

        if (canPlantIndicator != null)
            canPlantIndicator.SetActive(false);

        indicatorState = false;
    }

    void Update()
    {
        if (InputHandler.IsMapActive(ActionMap.UI))
        {
            SetIndicator(false);
            return;
        }

        UpdatePlantIndicator();

        if (InputHandler.Pressed(GameAction.GameplayMouseLeftClick))
            TryPlantSeed();
    }

    void UpdatePlantIndicator()
    {
        InventorySlot selectedSlot = InventoryManager.Instance.GetSelectedHotbarSlot();
        bool hasSeedSelected = selectedSlot != null && selectedSlot.item != null && selectedSlot.item.itemType == ItemType.Seed;

        if (!hasSeedSelected)
        {
            SetIndicator(false);
            return;
        }

        if (playerCamera == null)
            playerCamera = Camera.main;

        if (playerCamera == null)
        {
            SetIndicator(false);
            return;
        }

        Ray ray = playerCamera.ViewportPointToRay(new Vector3(0.5f, 0.5f, 0f));
        if (Physics.Raycast(ray, out RaycastHit hit, interactionRange, seedBedMask))
        {
            SeedBed seedBed = hit.collider.GetComponentInParent<SeedBed>();
            if (seedBed != null && !seedBed.IsOccupied())
            {
                SetIndicator(true);
                return;
            }
        }

        SetIndicator(false);
    }

    void TryPlantSeed()
    {
        InventorySlot selectedSlot = InventoryManager.Instance.GetSelectedHotbarSlot();
        if (selectedSlot == null) return;
        if (selectedSlot.item == null) return;
        if (selectedSlot.item.itemType != ItemType.Seed) return;

        if (playerCamera == null)
            playerCamera = Camera.main;

        if (playerCamera == null)
        {
            Debug.LogError("PlantingInteraction: No camera found (Camera.main is null). Tag a camera as MainCamera.");
            return;
        }

        Ray ray = playerCamera.ViewportPointToRay(new Vector3(0.5f, 0.5f, 0f));
        if (Physics.Raycast(ray, out RaycastHit hit, interactionRange, seedBedMask))
        {
            SeedBed seedBed = hit.collider.GetComponentInParent<SeedBed>();
            if (seedBed == null)
                return;

            if (seedBed.PlantSeed(selectedSlot.item))
            {
                InventoryManager.Instance.RemoveItem(selectedSlot.item, 1);
                SetIndicator(false);
            }
        }
    }

    void SetIndicator(bool on)
    {
        if (indicatorState == on)
            return;

        indicatorState = on;

        if (canPlantIndicator != null)
            canPlantIndicator.SetActive(on);
    }
}
