#include "..\script_component.hpp"

/*
* Author: Zorn
* [Description]
*
* Arguments:
*
* Return Value:
* None





_grp addWaypoint [_targetOBJ, 0, -1, ""];


*
* Example:
* ['something', player] call cvo_fnc_sth
*
* Public: Yes
*/

if !(isServer) exitWith {};

params [
    ["_heli",       objNull,    [objNull]               ],
    ["_ref",  [0,0,0],    [false, objNull, []],  [2,3]   ]
];

if (_heli isEqualTo objNull) exitWith { false };
if ( _ref isEqualTo [0,0,0]) exitWith { false };
if ( _ref isEqualTo false  ) exitWith { _heli setVariable [QGVAR(limit_enabled), false] }; // To disable the speedlimiter

private _refPos = switch (typeName _ref) do {
    case "ARRAY": { _ref };
    case "OBJECT": { getPosASL _ref };
    default { [0,0,0] };
};

ZRN_LOG_2(_heli,_refPos);

group driver _heli setGroupOwner 2;
_heli setOwner 2;

private _pfhID = _heli getVariable [QGVAR(limit_id), "404"];

_heli setVariable [QGVAR(limit_enabled), true, true];
_heli setVariable [QGVAR(limit_refPos), _refPos ];


if (_pfhID isEqualTo "404") then {

    private _parameters = [ _heli ];
    private _delay = 0;
    private _condition = { _this#0 getVariable [QGVAR(limit_enabled), false] };

    private _codeToRun = {
        params ["_heli"];
        private _refPos = _heli getVariable [QGVAR(limit_refPos), [0,0,0]];

        private _speedLimit = linearConversion [50, 2500, _heli distance2D _refPos, 35 + (windStr * 3.6), 250];
        _heli limitSpeed _speedLimit;
    };

    private _exitCode = {
        params ["_heli"];

        _heli limitSpeed (2 * getNumber(configOf _heli >> "maxSpeed"));	// remove the limit
        _heli setVariable [QGVAR(limit_enabled), nil, true];
        _heli setVariable [QGVAR(limit_id), nil, true];
        _heli setVariable [QGVAR(limit_refPos), nil, true];
    };

    _pfhID = [{
        params ["_args", "_handle"];
        _args params ["_codeToRun", "_parameters", "_exitCode", "_condition"];

        if (_parameters call _condition) then {
            _parameters call _codeToRun;
        } else {
            _handle call CBA_fnc_removePerFrameHandler;
            _parameters call _exitCode;
        };
    }, _delay, [_codeToRun, _parameters, _exitCode, _condition]] call CBA_fnc_addPerFrameHandler;

    _heli setVariable [QGVAR(limit_id), _pfhID];
};