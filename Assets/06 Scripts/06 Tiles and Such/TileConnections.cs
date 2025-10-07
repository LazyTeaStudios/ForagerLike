using UnityEngine;

public class TileConnections : MonoBehaviour
{
    public bool north;
    public bool east;
    public bool south;
    public bool west;

    public bool[] GetRotated(int step)
    {
        bool[] c = { north, east, south, west };
        bool[] r = new bool[4];
        for (int i = 0; i < 4; i++) r[(i + step) & 3] = c[i];
        return r;
    }
}