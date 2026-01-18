using UnityEngine;

public class InteractableManager : MonoBehaviour
{
    Camera playerCamera;
    Interactable currentTarget;
    public static InteractableManager Instance { get; private set; }

    // Add input cooldown
    static float inputCooldownTime;

    void Awake()
    {
        Instance = this;
        playerCamera = Camera.main;
    }

    void Update()
    {
        if (InputHandler.IsMapActive(ActionMap.UI)) return;
        if (Interactable.IsUILocked) return;

        CheckInteractableTarget();

        // Check cooldown before processing input
        if (currentTarget != null &&
            Time.time >= inputCooldownTime &&
            InputHandler.Pressed(GameAction.GameplayMouseLeftClick))
        {
            currentTarget.Interact();
        }
    }

    // Add this public method to set cooldown
    public static void SetInputCooldown(float duration)
    {
        inputCooldownTime = Time.time + duration;
    }

    void CheckInteractableTarget()
    {
        if (playerCamera == null) return;

        Ray ray = playerCamera.ScreenPointToRay(new Vector2(Screen.width / 2f, Screen.height / 2f));
        if (Physics.Raycast(ray, out RaycastHit hit, 10f))
        {
            Interactable interactable = hit.collider.GetComponentInParent<Interactable>();
            if (interactable != null)
            {
                // Check for placement delay
                var placementDelay = interactable.GetComponent<PlacedBuildingDelay>();
                if (placementDelay != null && !placementDelay.CanInteract())
                {
                    ClearTarget();
                    return;
                }

                float distance = Vector3.Distance(transform.position, interactable.transform.position);
                if (distance <= interactable.GetInteractRange())
                {
                    SetTarget(interactable);
                    return;
                }
            }
        }
        ClearTarget();
    }

    void SetTarget(Interactable newTarget)
    {
        if (currentTarget == newTarget) return;

        if (currentTarget != null)
            currentTarget.SetHighlighted(false);

        currentTarget = newTarget;
        currentTarget.SetHighlighted(true);
        
    }

    void ClearTarget()
    {
        if (currentTarget != null)
        {
            currentTarget.SetHighlighted(false);
            currentTarget = null;
        }
    }

    void OnDestroy()
    {
        ClearTarget();
    }
}

public class PlacedBuildingDelay : MonoBehaviour
{
    float interactionDelay = 0.2f; // Half second delay
    float placeTime;

    void Start()
    {
        placeTime = Time.time;
    }

    public bool CanInteract()
    {
        return Time.time - placeTime >= interactionDelay;
    }
}