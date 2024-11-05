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
    ["_mode",       "",         [""]    ],
    ["_args",       [],         []      ]
];


private  _cat = missionNamespace getVariable [QGVAR(HM_playlists), "404"];

if (_cat isEqualTo "404") then {
    _cat = createHashMap;
    missionNamespace setVariable [QGVAR(HM_playlists), _cat];
};

switch (_mode) do {

    case "NEW": {
        _args params [["_playlist", "", [""]]];
        _cat set [_playlist, [], true];
        _cat set [[_playlist,pool] joinstring "_", [], true];
    };
    case "ADD": {
        _args params [["_playlist", "", [""]],["_tracks", "", ["",[]]]];
        private _base = _cat get _playlist;
        if (_tracks isEqualType "") then { _tracks = [_tracks]};
        private _filtered = _tracks select {_x call FUNC(verify) };
        _base append _filtered;
    };
    case "REMOVE": {
        _args params [];
        _args params [["_playlist", "", [""]],["_tracks", "", ["",[]]]];
        private _base = _cat get _playlist;
        private _pool = _cat get ([_playlist,pool] joinstring "_");

        if (_tracks isEqualType "") then { _tracks = [_tracks]};

        _base = _base - _tracks;
        _pool = _pool - _tracks;

        _cat set [_playlist, _base];
        _cat set [([_playlist,pool] joinstring "_"), _pool];

    };
    case "DELETE": {
        _args params [["_playlist", "", [""]]];
        _cat deleteAt _playlist;
        _cat deleteAt ([_playlist,pool] joinstring "_");
    };
    case "RANDOM": {
        _args params [["_playlist", "", [""]]];
        if !(_playlist in _cat) exitWith {ZRN_LOG_MSG(Failed - Playlist does not exist);}
        private _base = _cat get _playlist;

        if (count _base == 0) exitWith {ZRN_LOG_MSG(Failed - Playlist is Empty);};

        private _pool = _cat get ([_playlist,pool] joinstring "_");
        if (count _pool == 0) then { _pool = + _base; };

        private _selected = selectRandom _pool;
        _pool = _pool - [_selected];

        _cat set [([_playlist,pool] joinstring "_"), _pool];

        _return = _selected;
    };
    case "FIRST": {
        _args params [["_playlist", "", [""]]];
        if !(_playlist in _cat) exitWith {ZRN_LOG_MSG(Failed - Playlist does not exist);}
        private _base = _cat get _playlist;

        if (count _base == 0) exitWith {ZRN_LOG_MSG(Failed - Playlist is Empty);};

        private _pool = _cat get ([_playlist,pool] joinstring "_");
        if (count _pool == 0) then { _pool = + _base; };

        private _selected = _pool select 0;
        _pool = _pool - [_selected];

        _cat set [([_playlist,pool] joinstring "_"), _pool];

        _return = _selected;
    };
    case "PLAY": {
        _args params [["_playlist", "", [""]]];
        if !(_playlist in _cat) exitWith {ZRN_LOG_MSG(Failed - Playlist does not exist);}
        private _base = _cat get _playlist;

        if (count _base == 0) exitWith {ZRN_LOG_MSG(Failed - Playlist is Empty);};

        private _pool = _cat get ([_playlist,pool] joinstring "_");
        if (count _pool == 0) then { _pool = + _base; };

        private _selected = _pool select 0;
        _pool = _pool - [_selected];

        _cat set [([_playlist,pool] joinstring "_"), _pool];

    };
};