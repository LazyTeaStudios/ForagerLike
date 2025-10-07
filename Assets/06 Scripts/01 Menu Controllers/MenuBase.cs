using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class MenuBase : MonoBehaviour
{
    private static GameObject _lastPointerHover;
    private static Vector2 _lastPointerPos;
    private static int _lastUpdateFrame = -1;
    private static bool _pointerPosValid;

    private static GameObject _lastValidSelection;

    private void Update()
    {
        if (Time.renderedFrameCount == _lastUpdateFrame) return;
        _lastUpdateFrame = Time.renderedFrameCount;

        var system = EventSystem.current;
        if (system == null) return;

        EnsureSelection(system);

        Vector2 pointerPos = Input.GetValue<Vector2>(GameAction.UIMousePoint);

        if (!_pointerPosValid)
        {
            _lastPointerPos = pointerPos;
            _pointerPosValid = true;
            return;
        }

        if ((pointerPos - _lastPointerPos).sqrMagnitude < 0.01f) return;

        _lastPointerPos = pointerPos;
        UpdateSelectionFromPointer(system, pointerPos);
    }


    private static void EnsureSelection(EventSystem system)
    {
        var current = system.currentSelectedGameObject;

        if (current != null &&
            current.activeInHierarchy &&
            current.GetComponent<Selectable>() != null)
        {
            _lastValidSelection = current;
            return;
        }

        if (current == null &&
            _lastValidSelection != null &&
            _lastValidSelection.activeInHierarchy)
        {
            system.SetSelectedGameObject(_lastValidSelection);
        }
    }

    protected void RefreshSelection(GameObject fallback)
    {
        var system = EventSystem.current;
        if (system == null) return;

        GameObject hovered = _lastPointerHover != null && _lastPointerHover.activeInHierarchy
            ? _lastPointerHover
            : null;

        GameObject target = hovered ?? fallback;

        if (target != null && target.activeInHierarchy)
        {
            system.SetSelectedGameObject(target);
            _lastValidSelection = target;
        }
    }

    private static void UpdateSelectionFromPointer(EventSystem system, Vector2 pointerPos)
    {
        var pointerData = new PointerEventData(system) { position = pointerPos };
        var results = new List<RaycastResult>();
        system.RaycastAll(pointerData, results);

        foreach (var result in results)
        {
            if (result.gameObject == null) continue;
            if (result.gameObject.GetComponent<Selectable>() == null) continue;
            if (!result.gameObject.activeInHierarchy) continue;

            _lastPointerHover = result.gameObject;

            if (system.currentSelectedGameObject != result.gameObject)
                system.SetSelectedGameObject(result.gameObject);

            _lastValidSelection = result.gameObject;
            break;
        }
    }
}
