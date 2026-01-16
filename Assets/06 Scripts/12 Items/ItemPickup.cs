using UnityEngine;
using TMPro;
using System.Collections;

public class ItemPickup : MonoBehaviour
{
    [Header("Item Settings")]
    [SerializeField] ItemData itemData;
    [SerializeField] int amount = 1;
    [SerializeField] float pickupRadius = 2f;
    [SerializeField] bool autoPickup = true;
    [SerializeField] float pickupDelay = 0.5f;

    [Header("Merging Settings")]
    [SerializeField] float mergeRadius = 1.5f;
    [SerializeField] float mergeCheckDelay = 0.5f;
    [SerializeField] LayerMask groundLayer = -1;

    [Header("Visual Settings")]
    [SerializeField] GameObject quantityCanvas;
    [SerializeField] TextMeshProUGUI quantityText;
    [SerializeField] float bobHeight = 0.05f;
    [SerializeField] float bobSpeed = 1.5f;
    [SerializeField] float canvasWorldHeight = 1.0f;
    [SerializeField] bool detachCanvas = true;
    [SerializeField] bool smoothFollow = true;
    [SerializeField] float followLerpSpeed = 20f;

    Transform player;
    float canPickupTime;
    bool isGrounded = false;
    Vector3 originalCanvasScale;
    Vector3 canvasWorldOffset;
    bool canvasInitialized;

    void Awake()
    {
        EnsureCanvasInitialized();
    }

    void Start()
    {
        player = GameObject.FindGameObjectWithTag("Player")?.transform;
        canPickupTime = Time.time + pickupDelay;

        StartCoroutine(CheckForMergeAfterDelay());
        UpdateQuantityDisplay();
    }

    void EnsureCanvasInitialized()
    {
        if (canvasInitialized) return;

        if (quantityCanvas != null)
        {
            originalCanvasScale = quantityCanvas.transform.localScale;
            canvasWorldOffset = Vector3.up * canvasWorldHeight;

            if (detachCanvas)
                quantityCanvas.transform.SetParent(null, true);
        }

        canvasInitialized = true;
    }

    IEnumerator CheckForMergeAfterDelay()
    {
        yield return new WaitForSeconds(mergeCheckDelay);

        isGrounded = Physics.Raycast(transform.position, Vector3.down, 2f, groundLayer);

        if (isGrounded)
            CheckAndMergeNearbyItems();
    }

    void CheckAndMergeNearbyItems()
    {
        if (itemData == null) return;

        Collider[] nearbyColliders = Physics.OverlapSphere(transform.position, mergeRadius);

        foreach (Collider col in nearbyColliders)
        {
            if (col.gameObject == gameObject) continue;

            ItemPickup otherPickup = col.GetComponent<ItemPickup>();
            if (otherPickup == null) continue;

            if (otherPickup.itemData == itemData && otherPickup.isGrounded)
            {
                if (amount < itemData.maxStackSize)
                {
                    int spaceLeft = itemData.maxStackSize - amount;
                    int toMerge = Mathf.Min(spaceLeft, otherPickup.amount);

                    amount += toMerge;
                    otherPickup.amount -= toMerge;

                    if (otherPickup.amount <= 0)
                        Destroy(otherPickup.gameObject);
                    else
                        otherPickup.UpdateQuantityDisplay();

                    UpdateQuantityDisplay();
                    StartCoroutine(MergeAnimation());
                }
            }
        }
    }

    IEnumerator MergeAnimation()
    {
        float time = 0;
        Vector3 originalScale = transform.localScale;

        while (time < 0.3f)
        {
            time += Time.deltaTime;
            float scale = 1f + Mathf.Sin(time * 10f) * 0.1f;
            transform.localScale = originalScale * scale;
            yield return null;
        }

        transform.localScale = originalScale;
    }

    public void SetItem(ItemData item, int quantity)
    {
        EnsureCanvasInitialized();

        itemData = item;
        amount = quantity;
        canPickupTime = Time.time + pickupDelay;

        UpdateQuantityDisplay();
        StartCoroutine(CheckForMergeAfterDelay());
    }

    void Update()
    {
        if (player == null) return;

        if (autoPickup && Time.time >= canPickupTime)
        {
            float distance = Vector3.Distance(transform.position, player.position);
            if (distance <= pickupRadius)
                TryPickup();
        }

        UpdateCanvasTransform();
    }

    void UpdateCanvasTransform()
    {
        if (quantityCanvas == null || !quantityCanvas.activeSelf) return;

        Vector3 targetPos = transform.position + canvasWorldOffset;

        if (amount > 1)
            targetPos += Vector3.up * (Mathf.Sin(Time.time * bobSpeed) * bobHeight);

        if (smoothFollow)
            quantityCanvas.transform.position = Vector3.Lerp(quantityCanvas.transform.position, targetPos, Time.deltaTime * followLerpSpeed);
        else
            quantityCanvas.transform.position = targetPos;

        if (Camera.main != null)
        {
            Vector3 lookDirection = Camera.main.transform.position - quantityCanvas.transform.position;
            lookDirection.y = 0;

            if (lookDirection != Vector3.zero)
            {
                Quaternion rotation = Quaternion.LookRotation(lookDirection);
                rotation *= Quaternion.Euler(0, 180, 0);
                quantityCanvas.transform.rotation = rotation;
            }
        }
    }

    void UpdateQuantityDisplay()
    {
        EnsureCanvasInitialized();

        if (quantityCanvas == null || quantityText == null) return;

        if (amount > 1)
        {
            quantityCanvas.SetActive(true);
            quantityText.text = $"x{amount}";

            if (originalCanvasScale == Vector3.zero)
                originalCanvasScale = quantityCanvas.transform.localScale;

            float scaleMultiplier = 1f + Mathf.Min((amount - 1) * 0.02f, 0.5f);
            quantityCanvas.transform.localScale = originalCanvasScale * scaleMultiplier;
        }
        else
        {
            quantityCanvas.SetActive(false);
        }
    }

    void TryPickup()
    {
        if (itemData == null) return;
        if (Time.time < canPickupTime) return;

        if (InventoryManager.Instance.AddItem(itemData, amount))
            Destroy(gameObject);
    }

    void OnTriggerEnter(Collider other)
    {
        if (autoPickup) return;
        if (!other.CompareTag("Player")) return;
        if (Time.time < canPickupTime) return;

        TryPickup();
    }

    void OnDestroy()
    {
        if (detachCanvas && quantityCanvas != null)
            Destroy(quantityCanvas);
    }

    void OnDrawGizmos()
    {
        if (autoPickup)
        {
            Gizmos.color = Color.yellow;
            Gizmos.DrawWireSphere(transform.position, pickupRadius);
        }

        Gizmos.color = Color.cyan;
        Gizmos.DrawWireSphere(transform.position, mergeRadius);
    }
}
