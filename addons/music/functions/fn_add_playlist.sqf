#include "../script_component.hpp"

/*
* Author: Zorn
* Function to Add a Playlist to the Music System.
* If the Playlist already exists
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

params [
    ["_playlistName",   "",     [""]  ],
    ["_addEntries",     [],     [[]]  ],
    ["_removeEntries",  [],     [[]]  ]
];

if (_playlistName == "") exitWith {false};

// create the Hashmap if it doesnt exist
private _map = missionNamespace getVariable [QGVAR(Playlist_HM), "404"];
if (_map isEqualTo "404") then {_map = createHashMap};

//generates the list of CfgMusic Entries and stores it in the HashMap
private _allSongs = _map getOrDefault ["allSongs", "404"];

if (_allSongs isEqualTo "404") then {
    _allSongs = ("true" configClasses (configFile >> "CfgMusic") apply {configName _x});
    _map set ["allSongs", _allSongs];
};

_addEntries = _addEntries select { _x in  _allSongs};
_removeEntries = _removeEntries select { _x in  _allSongs};



// retrieve existing hashmap if it exists already, if not, create an empty array
private _playlist = _map getOrDefault [_playlistName, []];
_playlist = _playlist + _addEntries - _removeEntries;

// Filter out duplicates
_playlist = _playlist arrayIntersect _playlist;

_map set [_playlistName, _playlist];

missionNamespace setVariable [QGVAR(Playlist_HM), _map];

[_playlistName, _playlist]