#include "../script_component.hpp"

/*
* Author: Zorn
* [Description]
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* ['something', player] call cvo_fnc_sth
*
* Public: Yes
*/

if !(isServer) exitWith {};

private _params = [];


private _statement = {
	if !(SET(freezeTime_enabled)) exitWith {};

	setTimeMultiplier SET(freezeTime_tm_freeze);

	private _condition = { 
		systemTime params ["_year", "_month", "_day", "_hour", "_minute", "_second", "_millisecond"];
		SET(freezeTime_hours) 	>= _hour 	&& 
		SET(freezeTime_minutes)	>= _minute
	};

	private _statement = { setTimeMultiplier SET(freezeTime_tm_normal)};
	private _parameter = [];
	private _timeout = 2 * 60 * 60;
	[_condition, _statement, _parameter, _timeout,_statement] call CBA_fnc_waitUntilAndExecute;

	ZRN_LOG_MSG(INIT completed);
};

private _condition = { missionNamespace getVariable ["cba_settings_ready", false] };

if _condition then _statement else { [_condition, _statement, _params, 300] call CBA_fnc_waitUntilAndExecute; };

