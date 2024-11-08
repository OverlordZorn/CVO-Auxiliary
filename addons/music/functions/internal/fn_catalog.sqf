#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to handle the Music Playlist Catalog
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* [] call prefix_component_fnc_functionname
*
* Public: No
*/

if !(isServer) exitWith {};


params [
    ["_selectMode",   "",  [""]    ],
    ["_args",         [],  []      ]
];

ZRN_LOG_MSG_1(INIT,_selectMode);

private _updateArray = false;
private  _cat = missionNamespace getVariable [QGVAR(HM_playlists), "404"];

if (_cat isEqualType "") then {
    _cat = createHashMap;
    missionNamespace setVariable [QGVAR(HM_playlists), _cat];
};

switch (_selectMode) do {

    case "NEW": {
        _args params [["_playlist", "", [""]]];
        _cat set [_playlist, [], true];
        _cat set [[_playlist,"pool"] joinString "_", [], true];
    };

    case "ADD": {
        _args params [["_playlist", "", [""]],["_tracks", "", ["",[]]]];

        if !(_playlist in _cat) then { ["NEW", _playlist] call FUNC(catalog); };

        private _base = _cat get _playlist;
        if (_tracks isEqualType "") then { _tracks = [_tracks]};
        private _filtered = _tracks select { _x call FUNC(verify) };
        _base append _filtered;

        _updateArray = true;
    };

    case "RESET": {
        _args params [["_playlist", "", [""]]];
        private _base = _cat get _playlist;
        private _pool = _cat get ([_playlist,"pool"] joinString "_");
        if (count _pool == 0) then { _pool append _base; };
    };

    case "REMOVE": {
        _args params [];
        _args params [["_playlist", "", [""]],["_tracks", "", ["",[]]]];
        if (_tracks isEqualType "") then { _tracks = [_tracks]};

        private _base = _cat get _playlist;
        private _pool = _cat get ([_playlist,"pool"] joinString "_");

        _base = _base - _tracks;
        _pool = _pool - _tracks;

        _cat set [_playlist, _base];
        _cat set [([_playlist,"pool"] joinString "_"), _pool];

        _updateArray = true;
    };

    case "DELETE": {
        _args params [["_playlist", "", [""]]];
        _cat deleteAt _playlist;
        _cat deleteAt ([_playlist,"pool"] joinString "_");

        _updateArray = true;
    };

    default {
        ZRN_LOG_MSG(Invalid Mode Provided);
    };
};


// Update Public Array
if (_updateArray) then { [_cat] call FUNC(publicArray) };
