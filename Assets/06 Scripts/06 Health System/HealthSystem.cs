using System;
using UnityEngine;

public enum EntityType
{
    Player,
    Plant,
    Fungus,
}

public class HealthSystem : MonoBehaviour
{
    [Header("Health (overridden by SeedData for plants)")]
    [SerializeField] private float maxHealth = 10f;
    [SerializeField] private float currentHealth;

    [Header("Entity")]
    [SerializeField] private EntityType entityType = EntityType.Plant;

    [Header("Death")]
    [SerializeField] private bool destroyOnDeath = true;
    [SerializeField] private GameObject onDeathParticles;
    [SerializeField] private Vector3 spawnOnDeathOffset = Vector3.zero;

    public event Action<float, float> OnHealthChanged;
    public event Action OnDeath;

    public float MaxHealth => maxHealth;
    public float CurrentHealth => currentHealth;
    public EntityType Type => entityType;
    public bool IsDead => currentHealth <= 0f;

    private PlantGrowth plantGrowth;
    private bool initialized;

    private void Awake()
    {
        plantGrowth = GetComponent<PlantGrowth>();

        if (plantGrowth != null)
            plantGrowth.OnFullyGrown += OnPlantFullyGrown;
        else
            InitializeHealth();
    }

    private void OnDestroy()
    {
        if (plantGrowth != null)
            plantGrowth.OnFullyGrown -= OnPlantFullyGrown;
    }

    private void OnPlantFullyGrown()
    {
        if (!initialized)
            InitializeHealth();
    }

    private void InitializeHealth()
    {
        if (plantGrowth != null && plantGrowth.SeedData != null)
            maxHealth = plantGrowth.SeedData.maxHealth;

        currentHealth = maxHealth;
        initialized = true;
        OnHealthChanged?.Invoke(currentHealth, maxHealth);
    }

    public void TakeDamage(float damage)
    {
        if (IsDead) return;
        if (plantGrowth != null && !plantGrowth.IsFullyGrown) return;

        currentHealth = Mathf.Max(0f, currentHealth - damage);
        OnHealthChanged?.Invoke(currentHealth, maxHealth);

        if (IsDead)
            Die();
    }

    private void Die()
    {
        if (onDeathParticles != null)
        {
            Vector3 spawnPos = transform.TransformPoint(spawnOnDeathOffset);
            Instantiate(onDeathParticles, spawnPos, Quaternion.identity);
        }

        OnDeath?.Invoke();

        if (destroyOnDeath)
            Destroy(gameObject);
    }

    public void Heal(float amount)
    {
        if (IsDead) return;

        currentHealth = Mathf.Min(maxHealth, currentHealth + amount);
        OnHealthChanged?.Invoke(currentHealth, maxHealth);
    }
}
