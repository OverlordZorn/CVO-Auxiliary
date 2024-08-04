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

["CBA_settingsInitialized", {

	private _isEnabled = missionNamespace getVariable ["CVO_SET_savePlayerLoadoutAtStartBool", true];
	if !(_isEnabled) exitWith {};

	private _delay = missionNamespace getVariable ["CVO_SET_savePlayerLoadoutAtStartDelay", 5];

	private _saveLoadout = {
		player setVariable ["CVO_Loadout", getUnitLoadout player];
		diag_log "[CVO][Arsenal] player's CVO_Loadout saved";
	};

	if (_delay == 0) then _saveLoadout else { [ _saveLoadout , [], _delay] call CBA_fnc_waitAndExecute;	}

},[]] call CBA_fnc_addEventHandler;


