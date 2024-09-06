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

if (!isServer) exitWith {};

params [
    ["_soundSourceOBJ",     objNull,    [objNull]   ],
    ["_type",               "",         [""]        ]
];

if  (_soundsourceOBJ isEqualTo objNull) exitWith {};
if !(_type in ["PLACE", "BREAK"]) exitWith {};

private _sound = switch (_type) do {
    case "PLACE": { selectRandom ["cvo_ula_place_1","cvo_ula_place_2","cvo_ula_place_3","cvo_ula_place_4"] };
    case "BREAK": { "cvo_ula_broke" };
    default { "" };
};

_soundSourceOBJ say3D _sound;