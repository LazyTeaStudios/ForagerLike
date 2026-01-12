using UnityEngine;

public class ItemPickup : MonoBehaviour
{
    [SerializeField] ItemData itemData;
    [SerializeField] int amount = 1;

    [Header("Pickup Settings")]
    [SerializeField] float attractRadius = 2f;
    [SerializeField] float pickupRadius = 0.5f;
    [SerializeField] float moveSpeed = 5f;
    [SerializeField] float acceleration = 10f;
    [SerializeField] AnimationCurve speedCurve = AnimationCurve.EaseInOut(0, 0, 1, 1);
    [SerializeField] float yOffset = 1f;

    Transform player;
    Rigidbody rb;
    bool isAttracting;
    float currentSpeed;

    void Start()
    {
        player = GameObject.FindGameObjectWithTag("Player")?.transform;
        rb = GetComponent<Rigidbody>();
        if (rb == null)
        {
            rb = gameObject.AddComponent<Rigidbody>();
        }
        rb.isKinematic = false;
    }

    void Update()
    {
        if (player == null) return;

        Vector3 targetPos = player.position + Vector3.up * yOffset;
        float distance = Vector3.Distance(transform.position, targetPos);

        if (isAttracting)
        {
            if (distance <= pickupRadius)
            {
                TryPickup();
            }
            else
            {
                MoveTowardsPlayer(targetPos, distance);
            }
        }
        else if (distance <= attractRadius && CanBePickedUp())
        {
            isAttracting = true;
            currentSpeed = 0f;
            if (rb != null)
            {
                rb.isKinematic = true;
                rb.linearVelocity = Vector3.zero;
                rb.angularVelocity = Vector3.zero;
            }
        }

        if (isAttracting && (distance > attractRadius || !CanBePickedUp()))
        {
            StopAttracting();
        }
    }

    bool CanBePickedUp()
    {
        if (itemData == null) return false;

        int currentCount = InventoryManager.Instance.GetItemCount(itemData);
        int spaceInExistingStacks = 0;

        for (int i = 0; i < 9; i++)
        {
            var slot = InventoryManager.Instance.GetHotbarSlot(i);
            if (slot != null && !slot.IsEmpty() && slot.item == itemData)
            {
                spaceInExistingStacks += (itemData.maxStackSize - slot.quantity);
            }
        }

        if (spaceInExistingStacks >= amount)
            return true;

        for (int i = 0; i < 9; i++)
        {
            var slot = InventoryManager.Instance.GetHotbarSlot(i);
            if (slot != null && slot.IsEmpty())
                return true;
        }

        return false;
    }

    void StopAttracting()
    {
        isAttracting = false;
        currentSpeed = 0f;
        if (rb != null)
        {
            rb.isKinematic = false;
        }
    }

    void MoveTowardsPlayer(Vector3 targetPos, float distance)
    {
        float normalizedDistance = (distance - pickupRadius) / (attractRadius - pickupRadius);
        float targetSpeed = moveSpeed * speedCurve.Evaluate(1f - normalizedDistance);
        currentSpeed = Mathf.MoveTowards(currentSpeed, targetSpeed, acceleration * Time.deltaTime);

        Vector3 direction = (targetPos - transform.position).normalized;
        transform.position += direction * currentSpeed * Time.deltaTime;
    }

    void TryPickup()
    {
        if (itemData == null) return;
        if (InventoryManager.Instance.AddItem(itemData, amount))
        {
            Destroy(gameObject);
        }
    }

    void OnDrawGizmos()
    {
        Gizmos.color = new Color(1, 1, 0, 0.3f);
        Gizmos.DrawWireSphere(transform.position, attractRadius);

        Gizmos.color = new Color(0, 1, 0, 0.5f);
        Gizmos.DrawWireSphere(transform.position, pickupRadius);
    }
}