using System.Collections.Generic;
using UnityEngine;
public class BuildingMenuController : MonoBehaviour
{
    [Header("References")]
    [SerializeField] private RadialMenu radialMenu;
    [SerializeField] private BuildingSystem buildingSystem;
    [Header("Build Items")]
    [SerializeField] private List<BuildItemSO> buildItems = new List<BuildItemSO>();
    [Header("Menu Icons")]
    [SerializeField] private Texture2D buildIcon;
    [SerializeField] private Texture2D destroyIcon;
    [SerializeField] private Texture2D backIcon;
    private MenuState currentState = MenuState.Closed;
    private enum MenuState { Closed, Main, BuildSelect }
    private void Update()
    {
        if (InputHandler.Pressed(GameAction.ToggleBuildModeAction))
            ToggleMenu();
    }
    private void ToggleMenu()
    {
        if (currentState == MenuState.Closed)
            OpenMainMenu();
        else
            CloseMenu();
    }
    private void OpenMainMenu()
    {
        InputHandler.SetMap(ActionMap.UI);
        buildingSystem.ExitBuildMode();
        buildingSystem.ExitDestroyMode();
        var buttons = new List<RadialButtonData>
        {
            new RadialButtonData("Destroy", "Remove existing structures", destroyIcon, EnterDestroyMode),
            new RadialButtonData("Build", "Place new structures", buildIcon, OpenBuildMenu),
        };
        // Pass 0 to select the first button (Build) by default
        radialMenu.SetButtons(buttons, 1);
        radialMenu.OnClosed = OnMenuClosed;
        radialMenu.Open();
        currentState = MenuState.Main;
    }
    private void OpenBuildMenu()
    {
        var buttons = new List<RadialButtonData>();
        buttons.Add(new RadialButtonData("Back", "Return to main menu", backIcon, OpenMainMenu));
        foreach (var item in buildItems)
        {
            if (item == null || item.prefab == null) continue;
            var capturedItem = item;
            Texture2D icon = item.icon != null ? item.icon.texture : null;
            buttons.Add(new RadialButtonData(item.displayName, item.description, icon, () => SelectBuildItem(capturedItem)));
        }
        // You can also specify a default selection for the build menu
        // For example, select "Back" button (index 0) or first build item (index 1)
        radialMenu.SetButtons(buttons, 1); // Select first build item by default
        currentState = MenuState.BuildSelect;
    }
    private void SelectBuildItem(BuildItemSO item)
    {
        buildingSystem.SetBuildItem(item);
        buildingSystem.EnterBuildMode();
        CloseMenu();
        RestoreCursor();
    }
    private void EnterDestroyMode()
    {
        buildingSystem.EnterDestroyMode();
        CloseMenu();
        RestoreCursor();
    }
    private void CloseMenu()
    {
        radialMenu.Close();
        InputHandler.SetMap(ActionMap.Gameplay);
        currentState = MenuState.Closed;
    }
    private void OnMenuClosed()
    {
        currentState = MenuState.Closed;
        RestoreCursor();
    }
    private void RestoreCursor()
    {
        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;
    }
}