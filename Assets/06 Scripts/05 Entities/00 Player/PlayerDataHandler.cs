using UnityEngine;

public class PlayerDataHandler : MonoBehaviour
{
    [SerializeField] private PlayerData playerData;

    public static PlayerData Data { get; private set; }

    void Awake()
    {
        if (Data != null && Data != playerData)
            Debug.LogWarning("Multiple PlayerDataHandlers detected.");
        Data = playerData;
    }

    void OnDestroy()
    {
        if (Data == playerData)
            Data = null;
    }
}