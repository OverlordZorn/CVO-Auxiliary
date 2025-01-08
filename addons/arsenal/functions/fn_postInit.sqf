#include "../script_component.hpp"

/*
* Author: Zorn
* Function to init CBA Custom Events
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* ['something', player] call prefix_component_fnc_functionname
*
* Public: No
*/

[QGVAR(EH_AddAction), FUNC(addAction)] call CBA_fnc_addEventHandler;

if !(hasInterface) exitWith {};
private _code = {
        ["ace_arsenal_displayClosed", {
            private _isEnabled = missionNamespace getVariable [QSET(save_arsenalClose), true];
            if (_isEnabled) then {
                [ { player setVariable [QGVAR(Loadout), getUnitLoadout player]; } , [], 3] call CBA_fnc_waitAndExecute;
            };
        }] call CBA_fnc_addEventHandler;


        player addEventHandler ["Respawn", {
	        private _isEnabled = missionNamespace getVariable [QSET(load_onRespawn), true];
            if (_isEnabled) then {
                params ["_unit", "_corpse"]; 
                player setUnitLoadout (player getVariable [QGVAR(Loadout), []]);
            };              
        }];                   
};

if (missionNamespace getVariable ["cba_settings_ready",false]) then _code else { ["CBA_settingsInitialized",_code,[]] call CBA_fnc_addEventHandler; };