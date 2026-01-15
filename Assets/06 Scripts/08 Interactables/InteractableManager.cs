using UnityEngine;

public class InteractableManager : MonoBehaviour
{
    Camera playerCamera;
    Interactable currentTarget;

    public static InteractableManager Instance { get; private set; }

    void Awake()
    {
        Instance = this;
        playerCamera = Camera.main;
    }

    void Update()
    {
        if (InputHandler.IsMapActive(ActionMap.UI)) return;
        if (Interactable.IsUILocked) return; // Skip when UI is locked

        CheckInteractableTarget();

        if (currentTarget != null && InputHandler.Pressed(GameAction.GameplayMouseLeftClick))
        {
            currentTarget.Interact();
        }
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