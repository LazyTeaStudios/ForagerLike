using UnityEngine;

/// <summary>
/// Makes an object clickable and deals damage to its HealthSystem.
/// </summary>
[RequireComponent(typeof(HealthSystem))]
public class ClickableDamageable : MonoBehaviour
{
    [Header("Damage")]
    [SerializeField] private float damagePerClick = 10f;

    [Header("Range")]
    [SerializeField] private float clickRange = 10f;
    [SerializeField] private LayerMask clickLayers;

    [Header("Collider")]
    [SerializeField] private Collider coll;   // assign child collider here

    private HealthSystem healthSystem;
    private Camera mainCamera;

    private void Awake()
    {
        healthSystem = GetComponent<HealthSystem>();
        mainCamera = Camera.main;
    }

    private void Update()
    {
        if (InputHandler.Pressed(GameAction.GameplayMouseLeftClick))
        {
            CheckForClick();
        }
    }

    private void CheckForClick()
    {
        Ray ray = mainCamera.ScreenPointToRay(
            InputHandler.GetValue<Vector2>(GameAction.GameplayMousePosition)
        );

        if (Physics.Raycast(ray, out RaycastHit hit, clickRange, clickLayers))
        {
            if (hit.collider == coll)
            {
                healthSystem.TakeDamage(damagePerClick);
            }
        }
    }
}
