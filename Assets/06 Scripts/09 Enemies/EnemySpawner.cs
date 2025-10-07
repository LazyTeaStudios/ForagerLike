using UnityEngine;

public class EnemySpawner : MonoBehaviour
{
    public GameObject enemyPrefab;         
    public float spawnYOffset = 0.1f;        

    void Update()
    {
        if (!enemyPrefab || !TileManager.Instance) return;

        if (UnityEngine.Input.GetKeyDown(KeyCode.K))
        {
            var path = TileManager.Instance.CurrentPath;
            if (path.Count < 2)
            {
                Debug.LogWarning("EnemySpawner: No valid path. Increase road length.");
                return;
            }

            Vector3 spawnPos = path[0] + Vector3.up * spawnYOffset;
            GameObject enemy = Instantiate(enemyPrefab, spawnPos, Quaternion.identity);

            enemy.GetComponent<EnemyPathFollower>()?.Init(new System.Collections.Generic.List<Vector3>(path));
        }
    }
}