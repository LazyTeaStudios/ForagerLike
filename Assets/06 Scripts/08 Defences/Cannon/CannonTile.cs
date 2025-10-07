using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CannonTile : MonoBehaviour
{
    [Header("References")]
    [SerializeField] private Transform cannonPivot; 
    [SerializeField] private Transform firePoint;      
    [SerializeField] private GameObject projectilePrefab;

    [Header("Firing Settings")]
    [SerializeField] private float fireInterval = 2f;
    [SerializeField] private float range = 1.1f;      

    private float _fireTimer;

    void Update()
    {

        Collider[] hits = Physics.OverlapSphere(transform.position, range, LayerMask.GetMask("Enemy"));

        if (hits.Length == 0) return;

        Transform closest = null;
        float closestDist = float.MaxValue;

        foreach (var hit in hits)
        {
            float dist = Vector3.SqrMagnitude(hit.transform.position - transform.position);
            if (dist < closestDist)
            {
                closest = hit.transform;
                closestDist = dist;
            }
        }

        if (!closest) return;


        Vector3 direction = closest.position - cannonPivot.position;
        direction.y = 0f;
        if (direction != Vector3.zero)
        {
            Quaternion lookRot = Quaternion.LookRotation(direction);
            cannonPivot.rotation = Quaternion.RotateTowards(cannonPivot.rotation, lookRot, 360f * Time.deltaTime);
        }


        _fireTimer += Time.deltaTime;
        if (_fireTimer >= fireInterval)
        {
            FireAt(closest.position);
            _fireTimer = 0f;
        }
    }

    void FireAt(Vector3 target)
    {
        if (!projectilePrefab || !firePoint) return;

        GameObject proj = Instantiate(projectilePrefab, firePoint.position, Quaternion.identity);
        var cannonball = proj.GetComponent<CannonProjectile>();
        if (cannonball) cannonball.SetTarget(target);
    }
}