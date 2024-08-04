if !(hasInterface) exitWith {};

/*
* Author: Zorn
* Adds EventHandlers on missionstart
*
*/

["CBA_settingsInitialized", {

	private _isEnabled = missionNamespace getVariable ["CVO_SET_savePlayerLoadoutAtArsenalClose", true];
	if !(_isEnabled) exitWith {};

    ["ace_arsenal_displayClosed", {
        player setVariable ["CVO_Loadout", getUnitLoadout player];
    }] call CBA_fnc_addEventHandler;

},[]] call CBA_fnc_addEventHandler;


["CBA_settingsInitialized", {

	private _isEnabled = missionNamespace getVariable ["CVO_SET_loadPlayerLoadoutOnRespawn", true];
	if !(_isEnabled) exitWith {};

    // when respawning, using the previously saved loadout  
    player addEventHandler ["Respawn", {
        params ["_unit", "_corpse"]; 
        player setUnitLoadout (player getVariable ["CVO_Loadout", []]);
    }];                                 
},[]] call CBA_fnc_addEventHandler;
