#include "../script_component.hpp"

params  [
    ["_target", objNull,    [objNull]   ],
    ["_dir",    "RND",      [0,""]      ],
    ["_mag",    300,        [0]         ],
    ["_rndVal", 90,         [0]         ],
    ["_offset", [0,0,1.5],  [[]],   [3] ],
    ["_delay",  2,          [0]         ]
];


if (!isServer) exitWith {};
if (_target == objNull) exitWith {};


if (CBA_MissionTime < 3) exitWith { [missionNamespace getVariable _fnc_scriptName, _this, 3 + random 3] call CBA_fnc_waitAndExecute; };

if ( _dir isEqualTo "RND" ) then {
    _dir = selectRandom [-1,1] * random _rndVal;
};

private _fromPos = _target getRelPos [5,_dir];
//private _force = _fromPos vectorDiff (getPos _target);
private _dirVector =  _fromPos vectorFromTo getPos _target;
private _force =  _dirVector vectorMultiply _mag;


_force set [2, _force#2 + 50];

_target addForce [_force, _offset];

_tgtSide = side _target;

[ { _this#0 setDamage 1; } , [_target], _delay] call CBA_fnc_waitAndExecute;

[QGVAR(EH_executeUnit), [_target, _tgtSide] ] call CBA_fnc_ServerEvent;
