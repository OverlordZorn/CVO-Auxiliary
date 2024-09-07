#include "..\script_component.hpp"

//start midpoint end heli_3

/*
_codeToRun  - <CODE> code to Run stated between {}
_parameters - <ANY> OPTIONAL parameters, will be passed to  code to run, exit code and condition
_exitCode   - <CODE> OPTIONAL exit code between {} code that will be executed upon ending PFEH default is {}
_condition  - <CODE THAT RETURNS BOOLEAN> - OPTIONAL conditions during which PFEH will run default {true}
_delay      - <NUMBER> (optional) delay between each execution in seconds, PFEH executes at most once per frame
*/

_heli = heli_5;
_targetOBJ = end;
_speedBump = midpoint;

group driver _heli setGroupOwner 2; 
_heli setOwner 2;
_grp = group driver _heli;

_grp addWaypoint [_speedBump, 0, -1, ""];
_grp addWaypoint [_targetOBJ, 0, -1, ""];
_grp addWaypoint [_speedBump, 0, -1, ""];
_grp addWaypoint [start, 0, -1, ""];

[_heli, _speedBump] call CVO_AIRLIFT_fnc_speedLimiter;

_condition = { _this#0 distance2D _this#1 < 50 };                // condition - Needs to return bool
_statement = { _this#0 setVariable ["cvo_airlift_limit_enabled", nil, true]};                // Code to be executed once condition true
_parameter = [_heli, _targetOBJ];                // arguments to be passed on -> _this
[_condition, _statement, _parameter] call CBA_fnc_waitUntilAndExecute;
