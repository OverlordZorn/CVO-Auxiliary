#include "..\script_component.hpp"


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

if (!hasInterface) exitWith {};

params [
    ["_soundSourceOBJ",     objNull,    [objNull]   ],
    ["_type",               "",         [""]        ]
];

diag_log format ['[CVO](debug)(fn_play_sound) _this: %1', _this];

if  (_soundsourceOBJ isEqualTo objNull) exitWith {false};
if !(_type in ["PLACE", "BREAK"]) exitWith {false};

private _sound = switch (_type) do {
    case "PLACE": { selectRandom ["cvo_ula_place_1","cvo_ula_place_2","cvo_ula_place_3","cvo_ula_place_4"] };
    case "BREAK": { "cvo_ula_broke" };
    default { "" };
};

if (_type isEqualTo "BREAK") then {
    _soundSourceOBJ = createVehicleLocal ["Helper_Base_F",_soundSourceOBJ];
    [ {
        if (isNil "_this" ) exitWith {};
        deleteVehicle _this;
    } , _soundSourceOBJ, 3] call CBA_fnc_waitAndExecute;
};

_soundSourceOBJ say3D _sound;
diag_log format ['[CVO](debug)(fn_play_sound) _sound: %1', _sound];
true