using UnityEngine;
public class ItemPickup : MonoBehaviour
{
    [SerializeField] ItemData itemData;
    [SerializeField] int amount = 1;
    [SerializeField] float pickupRadius = 2f;
    [SerializeField] bool autoPickup = true;
    Transform player;
    void Start()
    {
        player = GameObject.FindGameObjectWithTag("Player")?.transform;
    }
    void Update()
    {
        if (!autoPickup || player == null) return;
        float distance = Vector3.Distance(transform.position, player.position);
        if (distance <= pickupRadius)
        {
            TryPickup();
        }
    }
    void TryPickup()
    {
        if (itemData == null) return;
        if (InventoryManager.Instance.AddItem(itemData, amount))
        {
            Destroy(gameObject);
        }
    }
    void OnTriggerEnter(Collider other)
    {
        if (autoPickup) return;
        if (!other.CompareTag("Player")) return;
        TryPickup();
    }
    void OnDrawGizmos()
    {
        if (autoPickup)
        {
            Gizmos.color = Color.yellow;
            Gizmos.DrawWireSphere(transform.position, pickupRadius);
        }
    }
}