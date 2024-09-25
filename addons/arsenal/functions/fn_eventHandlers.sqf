#include "../script_component.hpp"

if !(hasInterface) exitWith {};

/*
* Author: Zorn
* Adds EventHandlers on missionstart
*
*/


private _code = {
        ["ace_arsenal_displayClosed", {
            private _isEnabled = missionNamespace getVariable ["CVO_SET_Arsenal_saveOnArsenalClose", true];
            if (_isEnabled) then {
                [ { player setVariable ["CVO_Loadout", getUnitLoadout player]; } , [], 3] call CBA_fnc_waitAndExecute;
            };
        }] call CBA_fnc_addEventHandler;


        player addEventHandler ["Respawn", {
	        private _isEnabled = missionNamespace getVariable ["CVO_SET_loadPlayerLoadoutOnRespawn", true];
            if (_isEnabled) then {
                params ["_unit", "_corpse"]; 
                player setUnitLoadout (player getVariable ["CVO_Loadout", []]);
            };              
        }];                   
};

if (missionNamespace getVariable ["cba_settings_ready",false]) then _code else { ["CBA_settingsInitialized",_code,[]] call CBA_fnc_addEventHandler; };