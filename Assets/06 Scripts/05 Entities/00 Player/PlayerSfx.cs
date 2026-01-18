using UnityEngine;

[RequireComponent(typeof(CharacterController))]
[RequireComponent(typeof(StarterAssetsInputs))]
[RequireComponent(typeof(FirstPersonController))]
public class PlayerSfx : MonoBehaviour
{
    [Header("Footsteps")]
    [SerializeField, AudioId(AudioCategory.SFX)] string grassFootstepId;
    [SerializeField, AudioId(AudioCategory.SFX)] string rockFootstepId;
    [SerializeField, Range(0f, 1f)] float footstepVolume = 0.8f;
    [SerializeField, Range(0f, 0.25f)] float footstepPitchVariation = 0.05f;
    [SerializeField] float stepsPerMeter = 0.5f;

    [Header("Jump & Land")]
    [SerializeField, AudioId(AudioCategory.SFX)] string jumpSoundId;
    [SerializeField, AudioId(AudioCategory.SFX)] string landSoundId;
    [SerializeField, Range(0f, 10f)] float jumpVolume = 0.7f;
    [SerializeField, Range(0f, 10f)] float landVolume = 0.8f;
    [SerializeField, Range(0f, 0.25f)] float jumpLandPitchVariation = 0.05f;

    [Header("Ground Detection")]
    [SerializeField] LayerMask groundMask = ~0;
    [SerializeField] string rockTag = "Rock";
    [SerializeField] string terrainRockLayer = "TL_Rock";

    CharacterController _controller;
    StarterAssetsInputs _input;
    FirstPersonController _fpc;

    float _distanceTraveled;
    bool _wasMoving;
    bool _wasGrounded;

    void Awake()
    {
        _controller = GetComponent<CharacterController>();
        _input = GetComponent<StarterAssetsInputs>();
        _fpc = GetComponent<FirstPersonController>();
    }

    void Start()
    {
        _wasGrounded = _fpc.Grounded;
    }

    void Update()
    {
        HandleJumpAndLand();
        HandleFootsteps();
    }

    void HandleJumpAndLand()
    {
        bool grounded = _fpc.Grounded;

        if (_wasGrounded && !grounded && _controller.velocity.y > 0f)
            PlaySound(jumpSoundId, jumpVolume, jumpLandPitchVariation);

        if (!_wasGrounded && grounded)
            PlaySound(landSoundId, landVolume, jumpLandPitchVariation);

        _wasGrounded = grounded;
    }

    void HandleFootsteps()
    {
        bool isMoving = _input.move != Vector2.zero && _fpc.Grounded;

        if (!isMoving)
        {
            _distanceTraveled = 0f;
            _wasMoving = false;
            return;
        }

        if (!_wasMoving)
        {
            PlayFootstep();
            _distanceTraveled = 0f;
            _wasMoving = true;
            return;
        }

        Vector3 horizontalVel = new Vector3(_controller.velocity.x, 0f, _controller.velocity.z);
        _distanceTraveled += horizontalVel.magnitude * Time.deltaTime;

        float stepDistance = 1f / stepsPerMeter;
        if (_distanceTraveled >= stepDistance)
        {
            _distanceTraveled -= stepDistance;
            PlayFootstep();
        }
    }

    void PlayFootstep()
    {
        string id = IsOnRock() ? rockFootstepId : grassFootstepId;
        PlaySound(id, footstepVolume, footstepPitchVariation);
    }

    void PlaySound(string id, float volume, float pitchVariation)
    {
        if (!string.IsNullOrEmpty(id))
            Sound.PlaySound(id, volume, pitchVariation);
    }

    bool IsOnRock()
    {
        if (!Physics.Raycast(transform.position + Vector3.up * 0.1f, Vector3.down, out RaycastHit hit, 0.5f, groundMask))
            return false;

        if (hit.collider.CompareTag(rockTag))
            return true;

        var terrain = hit.collider.GetComponent<Terrain>();
        if (terrain != null)
            return GetDominantTerrainLayer(terrain, hit.point) == terrainRockLayer;

        return false;
    }

    string GetDominantTerrainLayer(Terrain terrain, Vector3 worldPos)
    {
        var data = terrain.terrainData;
        Vector3 terrainPos = worldPos - terrain.transform.position;

        int mapX = Mathf.Clamp((int)(terrainPos.x / data.size.x * data.alphamapWidth), 0, data.alphamapWidth - 1);
        int mapZ = Mathf.Clamp((int)(terrainPos.z / data.size.z * data.alphamapHeight), 0, data.alphamapHeight - 1);

        float[,,] alphas = data.GetAlphamaps(mapX, mapZ, 1, 1);

        int dominantIndex = 0;
        float maxWeight = 0f;
        for (int i = 0; i < alphas.GetLength(2); i++)
        {
            if (alphas[0, 0, i] > maxWeight)
            {
                maxWeight = alphas[0, 0, i];
                dominantIndex = i;
            }
        }

        return data.terrainLayers[dominantIndex]?.name ?? "";
    }
}