using UnityEngine;

public class InteractableManager : MonoBehaviour
{
    Camera playerCamera;
    Interactable currentTarget;
    public static InteractableManager Instance { get; private set; }

    [SerializeField] CrosshairUI crosshairUI;

    static float inputCooldownTime;

    void Awake()
    {
        Instance = this;
        playerCamera = Camera.main;

        if (crosshairUI == null)
            crosshairUI = FindFirstObjectByType<CrosshairUI>();
    }

    void Update()
    {
        if (InputHandler.IsMapActive(ActionMap.UI) || Interactable.IsUILocked)
        {
            ClearTarget();
            return;
        }

        CheckInteractableTarget();

        if (currentTarget != null &&
            Time.time >= inputCooldownTime &&
            InputHandler.Pressed(GameAction.GameplayMouseLeftClick))
        {
            currentTarget.Interact();
        }
    }

    public static void SetInputCooldown(float duration)
    {
        inputCooldownTime = Time.time + duration;
    }

    void CheckInteractableTarget()
    {
        if (playerCamera == null) return;

        Ray ray = playerCamera.ScreenPointToRay(new Vector2(Screen.width / 2f, Screen.height / 2f));
        var hits = Physics.RaycastAll(ray, 10f);

        if (hits == null || hits.Length == 0)
        {
            ClearTarget();
            return;
        }

        System.Array.Sort(hits, (a, b) => a.distance.CompareTo(b.distance));

        for (int i = 0; i < hits.Length; i++)
        {
            var col = hits[i].collider;
            if (col == null) continue;
            if (col.isTrigger) continue;

            if (col.GetComponentInParent<InteractionRaycastBlocker>() != null)
            {
                ClearTarget();
                return;
            }

            Interactable interactable = null;

            var proxy = col.GetComponent<InteractableCollider>();
            if (proxy != null)
                interactable = proxy.GetInteractable();
            else
                interactable = col.GetComponentInParent<Interactable>();

            if (interactable == null)
            {
                ClearTarget();
                return;
            }

            var placementDelay = interactable.GetComponent<PlacedBuildingDelay>();
            if (placementDelay != null && !placementDelay.CanInteract())
            {
                ClearTarget();
                return;
            }

            float distance = Vector3.Distance(transform.position, interactable.transform.position);
            if (distance <= interactable.GetInteractRange())
                SetTarget(interactable);
            else
                ClearTarget();

            return;
        }

        ClearTarget();
    }

    void SetTarget(Interactable newTarget)
    {
        if (currentTarget != null && currentTarget != newTarget)
            currentTarget.SetHighlighted(false);

        currentTarget = newTarget;

        if (currentTarget != null)
            currentTarget.SetHighlighted(true);

        if (crosshairUI != null)
            crosshairUI.SetHover(currentTarget != null);
    }

    void ClearTarget()
    {
        if (currentTarget != null)
        {
            currentTarget.SetHighlighted(false);
            currentTarget = null;
        }

        if (crosshairUI != null)
            crosshairUI.SetHover(false);
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