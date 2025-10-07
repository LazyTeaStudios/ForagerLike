using UnityEngine;
using UnityEngine.SceneManagement;

/// <summary>
/// You can make any script a gameobject by replacing MonoBehaviour with Singlton<ClassName>
/// You can then toggle if it should be DontDestroyOnLoad in the Inspector.
/// 
/// Just remember to override Awake if you have awake in the script and add base.Awake()
/// </summary>
/// <typeparam name="T"></typeparam>
public class Singleton<T> : MonoBehaviour where T : MonoBehaviour
{
    private static T _instance;
    public bool dontDestroyOnLoad = true;

    public static T Instance
    {
        get
        {
            if (_instance == null)
            {
                _instance = FindFirstObjectByType<T>();

                if (_instance == null)
                {
                    Debug.LogError($"No instance of {typeof(T)} exists in the scene.");
                }
            }

            return _instance;
        }
    }

    public virtual void Awake()
    {
        if (_instance != null && _instance != this)
        {
            Destroy(gameObject);
            return;
        }

        _instance = this as T;

        if (transform.parent != null) 
            transform.SetParent(null);

        if (dontDestroyOnLoad)
            DontDestroyOnLoad(gameObject);
    }
}