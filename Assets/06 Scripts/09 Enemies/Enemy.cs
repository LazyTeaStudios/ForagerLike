using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(CharacterController))]
public class Enemy : MonoBehaviour, ITargetable
{
    public Vector3 Position => transform.position;
    public bool IsValid => gameObject.activeInHierarchy;
    public Transform Transform => transform;

    public float moveSpeed = 2f;
    public float arriveDist = 0.05f;

    private EnemyPathFollower _pathFollower;

    void Awake()
    {
        _pathFollower = GetComponent<EnemyPathFollower>();
        if (!_pathFollower) _pathFollower = gameObject.AddComponent<EnemyPathFollower>();
    }

    public void InitializePath(List<Vector3> path) => _pathFollower.Init(path);
    public void OnDestroyed() => Destroy(gameObject);
}