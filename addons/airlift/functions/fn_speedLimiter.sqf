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
    ["_reference",  [0,0,0],    [objNull, []],  [2,3]   ]
];

private _refPos = switch (typeName _reference) do {
    case "ARRAY": { _reference };
    case "OBJECT": { getPosASL _reference };
    default { [0,0,0] };
};

diag_log format ['[CVO](debug)(fn_speedLimiter) _heli: %1 - _refPos: %2', _heli , _refPos];

group driver _heli setGroupOwner 2;
_heli setOwner 2;

private _pfhID = _heli getVariable ["cvo_airlift_limit_id", "404"];
_heli setVariable ["cvo_airlift_limit_enabled", true, true];
_heli setVariable ["cvo_airlift_limit_refPos", _refPos ];


if (_pfhID isEqualTo "404") then {

    diag_log "[CVO](debug)(fn_speedLimiter) pfh is being established";

    private _parameters = [ _heli ];
    private _delay = 0;
    private _condition = { _this#0 getVariable ["cvo_airlift_limit_enabled", false] };

    diag_log "[CVO](debug)(fn_speedLimiter) post condition";

    private _codeToRun = {
        params ["_heli"];
        private _refPos = _heli getVariable ["cvo_airlift_limit_refPos", [0,0,0]];

        diag_log format ['[CVO](debug)(fn_speedLimiter) _refPos: %1 - _heli: %2', _refPos , _heli];

        private _speedLimit = linearConversion [50, 2500, _heli distance2D _refPos, 35 + (windStr * 3.6), 250];
        diag_log format ['[CVO](debug)(fn_speedLimiter) _speedLimit: %1 - "": %2', _speedLimit , ""];
        _heli limitSpeed _speedLimit;
    };

    diag_log "[CVO](debug)(fn_speedLimiter) post code";

    private _exitCode = {
        params ["_heli"];

        _heli limitSpeed (2 * getNumber(configOf _heli >> "maxSpeed"));	// remove the limit
        _heli setVariable ["cvo_airlift_limit_enabled", nil, true];
        _heli setVariable ["cvo_airlift_limit_id", nil, true];
        _heli setVariable ["cvo_airlift_limit_refPos", nil, true];
    };

    diag_log "[CVO](debug)(fn_speedLimiter) post exitcode";

    _pfhID = [{
        params ["_args", "_handle"];
        _args params ["_codeToRun", "_parameters", "_exitCode", "_condition"];

        diag_log format ['[CVO](debug)(fn_speedLimiter) inside PFH: _parameters: %1',_parameters];

        if (_parameters call _condition) then {
            _parameters call _codeToRun;
        } else {
            _handle call CBA_fnc_removePerFrameHandler;
            _parameters call _exitCode;
        };
    }, _delay, [_codeToRun, _parameters, _exitCode, _condition]] call CBA_fnc_addPerFrameHandler;

    _heli setVariable ["cvo_airlift_limit_id", _pfhID];
    diag_log "[CVO](debug)(fn_speedLimiter) pfh has been established ";
};