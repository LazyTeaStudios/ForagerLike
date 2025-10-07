using UnityEngine;

[RequireComponent(typeof(Collider2D))]
public class ItemPickup : MonoBehaviour
{
    [Header("Item Data")]
    [SerializeField] private ItemData itemData;
    public int quantity = 1;

    [Header("Idle Bobbing")]
    [SerializeField] private float bobHeight = 0.025f;
    [SerializeField] private float bobSpeed = 3f;

    [Header("Spawn Throw Settings")]
    [SerializeField] private float throwDuration = 0.25f;
    [SerializeField] private float throwHeight = 0.2f;

    [Header("Collection Settings")]
    [SerializeField] private float pickupRange = 2f;
    [SerializeField] private float collectRange = 0.3f;
    [SerializeField] private float maxMagnetSpeed = 8f;

    private Vector3 basePosition;
    private Transform player;
    private bool canPickup = false;
    private float throwTimer = 0f;
    private Vector3 startThrowPos;

    private void Start()
    {
        GetComponent<Collider2D>().isTrigger = true;
        player = GameObject.FindGameObjectWithTag("Player").transform;
        basePosition = transform.position;
    }

    public void StartThrow()
    {
        startThrowPos = transform.position;
        canPickup = false;
    }

    private void Update()
    {
        if (throwTimer < throwDuration)
        {
            HandleThrow();
        }
        else
        {
            canPickup = true;
            HandleMovement();
        }
    }

    private void HandleThrow()
    {
        throwTimer += Time.deltaTime;
        float progress = throwTimer / throwDuration;
        float arc = Mathf.Sin(progress * Mathf.PI) * throwHeight;

        transform.position = startThrowPos + Vector3.up * arc;

        if (progress >= 1f)
        {
            basePosition = startThrowPos;
        }
    }

    private void HandleMovement()
    {
        float distance = Vector3.Distance(transform.position, player.position);

        if (distance <= collectRange)
        {
            TryPickup();
            return;
        }

        if (distance <= pickupRange)
        {
            float magnetStrength = 1f - (distance / pickupRange);
            Vector3 direction = (player.position - transform.position).normalized;
            float speed = maxMagnetSpeed * magnetStrength * magnetStrength;

            basePosition += direction * speed * Time.deltaTime;
        }

        float bob = Mathf.Sin(Time.time * bobSpeed) * bobHeight;
        transform.position = basePosition + Vector3.up * bob;
    }

    private void TryPickup()
    {
        if (canPickup && InventorySystem.Instance.AddItem(itemData, quantity))
        {
            Destroy(gameObject);
        }
    }
}