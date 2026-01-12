using UnityEngine;

[CreateAssetMenu(fileName = "PlayerData", menuName = "Player/PlayerData")]
public class PlayerData : ScriptableObject
{
    [Header("Combat")]
    public float damagePerClick = 1f;
    public float clickRange = 5f;
    public LayerMask clickLayers;

    [Header("Interaction")]
    public float interactRange = 5f;

    [Header("Feedback")]
    public float scaleMultiplier = 1.05f;
    public float scaleDuration = 0.15f;
}