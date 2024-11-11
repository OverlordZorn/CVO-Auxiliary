#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to create and update the Music History Diary Entry
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

params [
    ["_class",        "",         [""]       ]
];

if (_class == "") exitWith {};

private _record = GETMGVAR(record_musicHistory,"404");
private _title = LLSTRING(diary_record_MusicHistory_Title);

ZRN_LOG_1(_title);

if (_record isEqualTo "404") then {
    ZRN_LOG_1(_record);
    // Create The Diary Entry
    _record = player createDiaryRecord [
        QGVAR(diary_subject), [ _title, "yaaay" ]
    ];
    SETMGVAR(record_musicHistory,_record);

    GVAR(history_array) = [];
};

private _history = GETMGVAR(history_array,[]);

private _time = systemTime apply {if (_x < 10) then {"0" + str _x} else {str _x}}; // ["2021","05","03","14","09","37","593"]
private _timeStr = format ["%1:%2", _time#3, _time#4];

if (_class != "INIT") then {
	_history pushBack [_timeStr, _class, [_class] call FUNC(getMusicName)];
};



private _array = [ format ["<font face='EtelkaMonospacePro' color='#0099ff' size='14'>%1</font>", LLSTRING(diary_record_MusicHistory_Header)] ];

private _longestIndex = count str count _history;

{
	// Index
	private _index = _forEachIndex + 1;
	private _maxChars = _longestIndex;
	private _str = str _index;
	private _numStr = count _str;
	if (_numStr < _maxChars) then { for "_i" from 1 to (_maxChars - _numStr) do { _str = _str insert [0, " "]; }; };
	_index = _str;

    private _string = format ["<font size=10 face='EtelkaMonospacePro'>%1. %2 - %3</font>", _index, _x#0, _x#2];
    
    _array pushBack _string;
} forEach _history;

player setDiaryRecordText [[QGVAR(diary_subject), _record], [_title, _array joinString "<br />"]];