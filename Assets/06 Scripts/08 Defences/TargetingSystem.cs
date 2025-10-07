using System.Collections.Generic;
using UnityEngine;

public enum TargetingMode
{
    Closest,
    Furthest,
    First,
    Last,
    MostCrowded
}

public class TargetingSystem : MonoBehaviour
{
    [SerializeField] private TargetingMode targetingMode = TargetingMode.Closest;
    [SerializeField] private float range = 5f;
    [SerializeField] private LayerMask targetMask = -1;

    public ITargetable CurrentTarget { get; private set; }

    void Update()
    {
        CurrentTarget = FindTarget();
    }

    private ITargetable FindTarget()
    {
        var colliders = Physics.OverlapSphere(transform.position, range, targetMask);
        var targets = new List<ITargetable>();

        foreach (var col in colliders)
        {
            var target = col.GetComponent<ITargetable>();
            if (target?.IsValid == true)
                targets.Add(target);
        }

        if (targets.Count == 0) return null;

        return targetingMode switch
        {
            TargetingMode.Closest => GetClosest(targets),
            TargetingMode.Furthest => GetFurthest(targets),
            TargetingMode.First => GetFirst(targets),
            TargetingMode.Last => GetLast(targets),
            TargetingMode.MostCrowded => GetMostCrowded(targets),
            _ => targets[0]
        };
    }

    private ITargetable GetClosest(List<ITargetable> targets)
    {
        ITargetable closest = null;
        float minDist = float.MaxValue;

        foreach (var target in targets)
        {
            float dist = Vector3.SqrMagnitude(target.Position - transform.position);
            if (dist < minDist)
            {
                minDist = dist;
                closest = target;
            }
        }
        return closest;
    }

    private ITargetable GetFurthest(List<ITargetable> targets)
    {
        ITargetable furthest = null;
        float maxDist = 0f;

        foreach (var target in targets)
        {
            float dist = Vector3.SqrMagnitude(target.Position - transform.position);
            if (dist > maxDist)
            {
                maxDist = dist;
                furthest = target;
            }
        }
        return furthest;
    }

    private ITargetable GetFirst(List<ITargetable> targets)
    {
        var pathFollowers = new List<(ITargetable target, EnemyPathFollower follower)>();

        foreach (var target in targets)
        {
            var follower = target.Transform.GetComponent<EnemyPathFollower>();
            if (follower) pathFollowers.Add((target, follower));
        }

        if (pathFollowers.Count == 0) return targets[0];

        pathFollowers.Sort((a, b) => b.follower.PathProgress.CompareTo(a.follower.PathProgress));
        return pathFollowers[0].target;
    }

    private ITargetable GetLast(List<ITargetable> targets)
    {
        var pathFollowers = new List<(ITargetable target, EnemyPathFollower follower)>();

        foreach (var target in targets)
        {
            var follower = target.Transform.GetComponent<EnemyPathFollower>();
            if (follower) pathFollowers.Add((target, follower));
        }

        if (pathFollowers.Count == 0) return targets[0];

        pathFollowers.Sort((a, b) => a.follower.PathProgress.CompareTo(b.follower.PathProgress));
        return pathFollowers[0].target;
    }

    private ITargetable GetMostCrowded(List<ITargetable> targets)
    {
        ITargetable mostCrowded = null;
        int maxCount = 0;

        foreach (var target in targets)
        {
            int count = Physics.OverlapSphere(target.Position, 1f, targetMask).Length;
            if (count > maxCount)
            {
                maxCount = count;
                mostCrowded = target;
            }
        }
        return mostCrowded ?? targets[0];
    }
}