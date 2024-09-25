#include "../script_component.hpp"

/*
* Author: Zorn
* Function to store players starting kit as the variable on the player object - intended to be exeucted at the beginning of the mission.
*
* Arguments:
* None
* 
* Return Value:
* None
*
* Example:
* [] call CVO_Arsenal_fnc_savePlayerLoadout;
*
* Public: No
*/

if !(hasInterface) exitWith {};


private _code = {

	private _isEnabled = missionNamespace getVariable ["CVO_SET_savePlayerLoadoutAtStartBool", true];
	if !(_isEnabled) exitWith {};

	private _delay = missionNamespace getVariable ["CVO_SET_savePlayerLoadoutAtStartDelay", 5];

	private _saveLoadout = {
		player setVariable [QGVAR(Loadout), getUnitLoadout player];
		diag_log "[CVO][Arsenal] player's CVO_Loadout saved";
	};

	if (_delay == 0) then _saveLoadout else { [ _saveLoadout , [], _delay] call CBA_fnc_waitAndExecute;	}

};

if (missionNamespace getVariable ["cba_settings_ready",false]) then _code else { ["CBA_settingsInitialized",_code,[]] call CBA_fnc_addEventHandler; };



