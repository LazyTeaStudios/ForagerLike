using System.Collections.Generic;
using UnityEngine;

public class BuildingMenuController : MonoBehaviour
{
    [Header("References")]
    [SerializeField] private RadialMenu radialMenu;
    [SerializeField] private BuildingSystem buildingSystem;

    [Header("Menu Definition")]
    [SerializeField] private RadialMenuDefinition mainMenuDef;

    [Header("Default Icons")]
    [SerializeField] private Texture2D destroyIcon;
    [SerializeField] private Texture2D backIcon;

    readonly Stack<RadialMenuDefinition> menuStack = new Stack<RadialMenuDefinition>();
    bool isOpen;

    void Update()
    {
        if (InputHandler.Pressed(GameAction.ToggleBuildModeAction))
            ToggleMenu();
    }

    void ToggleMenu()
    {
        if (!isOpen)
            OpenMenu(mainMenuDef);
        else
            CloseMenu();
    }

    void OpenMenu(RadialMenuDefinition menuDef)
    {
        if (menuDef == null) return;

        InputHandler.SetMap(ActionMap.UI);
        buildingSystem.ExitAllModes();

        menuStack.Push(menuDef);
        ShowCurrentMenu();

        radialMenu.OnClosed = OnMenuClosed;
        radialMenu.Open();
        isOpen = true;
    }

    void ShowCurrentMenu()
    {
        if (menuStack.Count == 0) return;

        var current = menuStack.Peek();
        var buttons = new List<RadialButtonData>();

        // Add back button if we're in a submenu
        if (menuStack.Count > 1)
            buttons.Add(new RadialButtonData("Back", "Return to previous menu", backIcon, GoBack));

        foreach (var entry in current.entries)
        {
            var captured = entry;
            switch (entry.type)
            {
                case RadialMenuEntry.EntryType.SubMenu:
                    buttons.Add(new RadialButtonData(
                        entry.displayName,
                        entry.description,
                        entry.icon,
                        () => NavigateToSubMenu(captured.subMenu)
                    ));
                    break;

                case RadialMenuEntry.EntryType.BuildItem:
                    if (entry.buildItem != null)
                    {
                        Texture2D icon = entry.icon != null ? entry.icon :
                            (entry.buildItem.icon != null ? entry.buildItem.icon.texture : null);
                        buttons.Add(new RadialButtonData(
                            entry.displayName ?? entry.buildItem.displayName,
                            entry.description ?? entry.buildItem.description,
                            icon,
                            () => SelectBuildItem(captured.buildItem)
                        ));
                    }
                    break;

                case RadialMenuEntry.EntryType.Action:
                    buttons.Add(new RadialButtonData(
                        entry.displayName,
                        entry.description,
                        entry.icon,
                        () => ExecuteAction(captured.actionId)
                    ));
                    break;

                case RadialMenuEntry.EntryType.Back:
                    buttons.Add(new RadialButtonData(
                        entry.displayName ?? "Back",
                        entry.description ?? "Return to previous menu",
                        entry.icon ?? backIcon,
                        GoBack
                    ));
                    break;
            }
        }

        int defaultIndex = menuStack.Count > 1 ? 1 : 0;
        radialMenu.SetButtons(buttons, Mathf.Min(defaultIndex, buttons.Count - 1));
    }

    void NavigateToSubMenu(RadialMenuDefinition subMenu)
    {
        if (subMenu == null) return;
        menuStack.Push(subMenu);
        ShowCurrentMenu();
    }

    void GoBack()
    {
        if (menuStack.Count <= 1)
        {
            CloseMenu();
            return;
        }

        menuStack.Pop();
        ShowCurrentMenu();
    }

    void ExecuteAction(string actionId)
    {
        switch (actionId)
        {
            case "destroy":
                buildingSystem.EnterDestroyMode();
                CloseMenu();
                RestoreCursor();
                break;

            default:
                Debug.LogWarning($"Unknown action: {actionId}");
                break;
        }
    }

    void SelectBuildItem(BuildItemSO item)
    {
        buildingSystem.SetBuildItem(item);
        buildingSystem.EnterBuildMode();
        CloseMenu();
        RestoreCursor();
    }

    void CloseMenu()
    {
        radialMenu.Close();
        menuStack.Clear();
        InputHandler.SetMap(ActionMap.Gameplay);
        isOpen = false;
    }

    void OnMenuClosed()
    {
        menuStack.Clear();
        isOpen = false;
        RestoreCursor();
    }

    void RestoreCursor()
    {
        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;
    }
}