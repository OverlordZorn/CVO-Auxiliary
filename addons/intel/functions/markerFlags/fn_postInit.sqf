#include "../../script_component.hpp"

if (!isServer) exitWith {};

private _condition = { missionNamespace getVariable ["cba_settings_ready", false] };
private _statement = {

	// marks all flags at the start.
	if ( missionNamespace getVariable ["CVO_SET_Intel_Flag_initial_isEnabled", false] ) then {

		private _delay = missionNamespace getVariable ["CVO_SET_Intel_Flag_initial_Delay", 5];
		private _code = { [] call FUNC(findAllFlags); };

		if (_delay == 0) then _code else { [ _code , [], _delay] call CBA_fnc_waitAndExecute; };
	};

	// marks all flags placed during the mission.
	if ( missionNamespace getVariable ["CVO_SET_Intel_Flag_progessive_isEnabled", false] ) then {

		["ace_marker_flags_placed", {
			params ["_unit", "_flag"];
			private _color = typeOf _flag splitString "_" select -1;

			if (missionNamespace getVariable[ ["CVO_SET_Intel_Flag_progessive",_color] joinString "_", false]) then {
				private _delay = (missionNamespace getVariable ["CVO_SET_Intel_Flag_progessive_Delay", 30]) * 60;
				private _code = { [_flag] call FUNC(createFlagMarker); };
				if (_delay == 0) then _code else { [ _code , [], _delay] call CBA_fnc_waitAndExecute; };
			};
		},[]] call CBA_fnc_addEventHandler;

	};

	diag_log ("[CVO] [INTEL] [FLAGS] (INIT) - completed");
};

[_condition, _statement, [], 120] call CBA_fnc_waitUntilAndExecute;

