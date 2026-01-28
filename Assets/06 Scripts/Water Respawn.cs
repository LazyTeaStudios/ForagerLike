using UnityEngine;

public class WaterRespawn : MonoBehaviour
{
    [SerializeField] Transform respawnPoint;

    void OnTriggerEnter(Collider other)
    {
        if (!other.CompareTag("Player"))
            return;

        Transform playerRoot = other.attachedRigidbody != null ? other.attachedRigidbody.transform : other.transform;

        var cc = playerRoot.GetComponent<CharacterController>();
        if (cc != null)
            cc.enabled = false;

        playerRoot.position = respawnPoint.position;

        if (other.attachedRigidbody != null)
        {
            other.attachedRigidbody.linearVelocity = Vector3.zero;
            other.attachedRigidbody.angularVelocity = Vector3.zero;
        }

        if (cc != null)
            cc.enabled = true;
    }
}
