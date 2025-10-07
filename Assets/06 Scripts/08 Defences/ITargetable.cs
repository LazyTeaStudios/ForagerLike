using UnityEngine;

public interface ITargetable
{
    Vector3 Position { get; }
    bool IsValid { get; }
    Transform Transform { get; }
}