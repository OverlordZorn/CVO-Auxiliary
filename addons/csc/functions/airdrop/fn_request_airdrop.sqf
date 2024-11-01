#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to manage Airdrop Requests
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

ZRN_LOG_MSG_1(INIT,_this);

params [
    ["_entryName",  "404",      [""]            ],
    ["_catName",    "global",   [""]            ],
    ["_target",     objNull,    [objNull]       ],
    ["_player",     player,     [objNull]       ],
    ["_entry",      "404",      [createHashMap] ],
    ["_mode",       "NORMAL",   [""]            ]
];

if (_entry isEqualTo "404") then {
    private _cat = [_catName] call FUNC(catalog);
    _entry = _cat get _entryName;
};

private _targetMode = switch (_mode) do {
    case "ZEUS":    { _entry get "airdrop_targetMode_zeus" };
    case "NORMAL":  { _entry get "airdrop_targetMode" };
    default         { _entry get "airdrop_targetMode" };
};


switch (_targetMode) do {
    case "MAPCLICK": {
        [_entryName, _catName] call FUNC(getPosFromMap)
    };

    case "FIXED": {
        private _pos = _entry get "spawn_pos";
        [QGVAR(EH_dispatch), [_entryName,_catName,_pos] ] call CBA_fnc_serverEvent;
    };

    case "PLAYER": {
        private _pos = _entry getPos _player;
        [QGVAR(EH_dispatch), [_entryName,_catName,_pos] ] call CBA_fnc_serverEvent;
    };

    case "TARGET": {
        private _pos = _entry getPos _target;
        [QGVAR(EH_dispatch), [_entryName,_catName,_pos] ] call CBA_fnc_serverEvent;
    };

    default {};
};
