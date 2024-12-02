#include "../script_component.hpp"

// #####################################################
// ###### greenMag TAB
// #####################################################


private _isLoaded = "greenmag_main" in ("true" configClasses (configFile >> "CfgPatches") apply { configName _x });

if (!_isLoaded) exitWith {};

// Array of Greenmag Items
private _greenTab = "('greenmag' in configName _x) && !('core' in configName _x)" configClasses (configFile >> "CfgWeapons") apply {configName _x}; 

// Creates GreenMag Arsenal Tab
[_greenTab, "greenMag", "\zrn\cvo\addons\arsenal\img\greenMag.paa"] call ace_arsenal_fnc_addRightPanelButton;
diag_log "[CVO] [ARSENAL] - Green Tab Applied";
