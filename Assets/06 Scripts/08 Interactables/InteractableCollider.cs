using UnityEngine;

public class InteractableCollider : MonoBehaviour
{
    [SerializeField] private Interactable interactable;

    public Interactable GetInteractable()
    {
        if (interactable != null)
            return interactable;

        return GetComponentInParent<Interactable>();
    }
}
