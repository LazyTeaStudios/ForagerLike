using System;
using UnityEngine;
using System.Collections.Generic;
using System.Linq;

[System.Serializable]
public class LootEntry
{
    public GameObject itemPrefab;
    [Range(0f, 100f)] public float weight = 0f;
    [HideInInspector] public bool isLocked = false;
}

[CreateAssetMenu(fileName = "New Loot Table", menuName = "Inventory/Loot Table")]
public class LootTable : ScriptableObject
{
    [Header("Loot Settings")]
    [SerializeField] private LootEntry[] lootEntries = new LootEntry[0];
    [Range(0f, 100f)] public float dropChance = 100f;

    public float TotalWeight
    {
        get
        {
            float total = 0f;
            foreach (var entry in lootEntries)
                total += entry.weight;
            return total;
        }
    }

    public GameObject GetRandomDrop()
    {
        if (lootEntries.Length == 0) return null;
        float randomValue = UnityEngine.Random.Range(0f, TotalWeight);
        float currentWeight = 0f;
        foreach (var entry in lootEntries)
        {
            currentWeight += entry.weight;
            if (randomValue <= currentWeight)
                return entry.itemPrefab;
        }
        return lootEntries[lootEntries.Length - 1].itemPrefab;
    }

    public LootEntry[] GetLootEntries() => lootEntries;

#if UNITY_EDITOR
    public void AddLootEntry()
    {
        var newEntry = new LootEntry { weight = 0f, isLocked = false };
        var list = lootEntries.ToList();
        list.Add(newEntry);
        lootEntries = list.ToArray();
    }

    public void RemoveLootEntry(int index)
    {
        if (index >= 0 && index < lootEntries.Length)
        {
            var list = lootEntries.ToList();
            list.RemoveAt(index);
            lootEntries = list.ToArray();
        }
    }

    public void SetLootEntries(LootEntry[] entries)
    {
        lootEntries = entries;
    }
#endif
}