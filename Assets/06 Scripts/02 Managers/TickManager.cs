using System;
using UnityEngine;

public class TickManager : Singleton<TickManager>
{
    [SerializeField] private float tickInterval = 1f;

    private float tickTimer;

    public static event Action OnTick;

    public override void Awake()
    {
        base.Awake();
        tickTimer = tickInterval;
    }

    void Update()
    {
        tickTimer -= Time.deltaTime;
        if (tickTimer <= 0)
        {
            tickTimer = tickInterval;
            OnTick?.Invoke();
        }
    }

    private void OnDestroy()
    {
        OnTick = null;
    }
}