using System;
using UnityEngine;
using UnityEngine.Events;

public enum EntityType
{
    Resource,
    Enemy,
    Building,
    Other
}

/// <summary>
/// Manages health, damage, and death for any entity in the game.
/// </summary>
public class HealthSystem : MonoBehaviour
{
    [Header("Health")]
    [SerializeField] private float maxHealth = 100f;
    [SerializeField] private float currentHealth;

    [Header("Entity")]
    [SerializeField] private EntityType entityType = EntityType.Other;

    [Header("Death")]
    [SerializeField] private bool destroyOnDeath = true;

    [Header("Events")]
    [SerializeField] private UnityEvent<float, float> onHealthChanged;
    [SerializeField] private UnityEvent onDeath;

    public event Action<float, float> OnHealthChanged;
    public event Action OnDeath;

    public float MaxHealth => maxHealth;
    public float CurrentHealth => currentHealth;
    public EntityType Type => entityType;
    public bool IsDead => currentHealth <= 0f;

    private void Awake()
    {
        currentHealth = maxHealth;
    }

    public void TakeDamage(float damage)
    {
        if (IsDead) return;

        currentHealth = Mathf.Max(0f, currentHealth - damage);

        OnHealthChanged?.Invoke(currentHealth, maxHealth);
        onHealthChanged?.Invoke(currentHealth, maxHealth);

        if (IsDead)
            Die();
    }

    private void Die()
    {
        OnDeath?.Invoke();
        onDeath?.Invoke();

        if (destroyOnDeath)
            Destroy(gameObject);
    }

    public void Heal(float amount)
    {
        if (IsDead) return;

        currentHealth = Mathf.Min(maxHealth, currentHealth + amount);
        OnHealthChanged?.Invoke(currentHealth, maxHealth);
        onHealthChanged?.Invoke(currentHealth, maxHealth);
    }
}