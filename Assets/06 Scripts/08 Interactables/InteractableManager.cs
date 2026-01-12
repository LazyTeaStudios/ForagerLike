using UnityEngine;

public class InteractableManager : MonoBehaviour
{
    Camera playerCamera;
    Interactable currentTarget;

    void Awake()
    {
        playerCamera = Camera.main;
    }

    void Update()
    {
        if (Interactable.IsUIOpen)
        {
            ClearTarget();
            return;
        }

        if (InputHandler.IsMapActive(ActionMap.UI)) return;

        CheckInteractableTarget();

        if (currentTarget != null && InputHandler.Pressed(GameAction.GameplayMouseLeftClick))
            currentTarget.Interact();
    }

    void CheckInteractableTarget()
    {
        if (playerCamera == null) return;

        float maxRange = GetMaxInteractRange();
        Ray ray = playerCamera.ScreenPointToRay(new Vector2(Screen.width * 0.5f, Screen.height * 0.5f));

        if (Physics.Raycast(ray, out RaycastHit hit, maxRange))
        {
            var interactable = hit.collider.GetComponentInParent<Interactable>();
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

    float GetMaxInteractRange()
    {
        if (PlayerDataHandler.Data != null)
            return PlayerDataHandler.Data.interactRange;
        return 10f;
    }

    void SetTarget(Interactable newTarget)
    {
        if (currentTarget == newTarget) return;

        currentTarget?.SetHighlighted(false);
        currentTarget = newTarget;
        currentTarget.SetHighlighted(true);
    }

    void ClearTarget()
    {
        if (currentTarget == null) return;
        currentTarget.SetHighlighted(false);
        currentTarget = null;
    }

    void OnDestroy() => ClearTarget();
}
