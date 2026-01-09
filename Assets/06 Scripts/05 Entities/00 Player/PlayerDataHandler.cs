using UnityEngine;

/// <summary>
/// Provides global access to PlayerData. Attach to player or a manager object.
/// </summary>
public class PlayerDataHandler : MonoBehaviour
{
    [SerializeField] private PlayerData playerData;

    public static PlayerData Data { get; private set; }

    private void Awake()
    {
        if (Data != null && Data != playerData)
        {
            Debug.LogWarning("Multiple PlayerDataProviders detected.");
        }
        Data = playerData;
    }

    private void OnDestroy()
    {
        if (Data == playerData)
            Data = null;
    }
}