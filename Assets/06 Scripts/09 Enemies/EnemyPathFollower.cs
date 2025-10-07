using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(CharacterController))]
public class EnemyPathFollower : MonoBehaviour
{
    private List<Vector3> _waypoints;
    private int _index;
    private CharacterController _cc;
    private Enemy _enemy;

    public float PathProgress => _waypoints != null ? (float)_index / _waypoints.Count : 0f;

    void Awake()
    {
        _cc = GetComponent<CharacterController>();
        _enemy = GetComponent<Enemy>();
    }

    public void Init(List<Vector3> path)
    {
        _waypoints = path;
        _index = 1;
    }

    void Update()
    {
        if (_waypoints == null || _index >= _waypoints.Count) return;

        Vector3 target = _waypoints[_index];
        Vector3 dir = target - transform.position;
        dir.y = 0f;

        if (dir.magnitude <= _enemy.arriveDist)
        {
            _index++;
            if (_index >= _waypoints.Count)
            {
                TowerHealth.Instance?.Damage(1);
                Destroy(gameObject);
                return;
            }
            target = _waypoints[_index];
            dir = target - transform.position;
            dir.y = 0f;
        }

        _cc.Move(dir.normalized * _enemy.moveSpeed * Time.deltaTime);
    }
}