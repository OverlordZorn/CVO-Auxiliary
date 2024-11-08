#include "../../script_component.hpp"

/*
* Author: Zorn
* Debug Function to get all CfgMusic Entries and check them for their duration value.
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

private _configs =  "true" configClasses (configFile >> "CfgMusic");

private _longestIndex = count str (count _configs + 1);
private _longestClassname = selectMax (_configs apply { count configName _x });
private _longestTitle = selectMax (_configs apply { count getText (_x >> "name") });
private _longestConfigSource = selectMax (_configs apply { count (configSourceAddonList _x joinString ", ") });

private _totalLength = (_longestIndex+3) + (10) + ((_longestTitle+2) + (_longestClassname+2) + 3) + (_longestConfigSource + 4);


{
	private _str = _x;
	for "_i" from 1 to (_totalLength - count _x) do {
		private _insertIndex = 0;
		if (_i mod 2 == 0) then { _insertIndex = -1; };
		_str = _str insert [_insertIndex, "#"];
	};
	diag_log _str;
} forEach ["", " " + _fnc_scriptName + " ", " List of CfgMusic Classes ", "", " [Index][Duration][ className | Title ][ Source Addons ] ", ""];

{
	// Index
	private _index = _forEachIndex + 1;
	private _maxChars = _longestIndex;
	private _str = str _index;
	private _numStr = count _str;
	if (_numStr < _maxChars) then { for "_i" from 1 to (_maxChars - _numStr) do { _str = _str insert [0, " "]; }; };
	_index = _str;


	// Duration
	private _hasDuration = configName (_x >> "duration") != "";
	private _duration = if _hasDuration then { (getNumber (_x >> "duration")) } else { "####.##" };
	if (_duration isEqualType 0) then {
		private _maxChars = 7;
		private _str = _duration toFixed 2;
		private _numStr = count _str;
		if (_numStr < _maxChars) then { for "_i" from 1 to (_maxChars - _numStr) do { _str = _str insert [0, " "]; }; };
	_duration = _str;
	};

	// Classname
	private _configName = configName _x;
	private _str = _configName;
	private _numStr = count _str;
	if (_numStr < _longestClassname) then { for "_i" from 1 to (_longestClassname - _numStr) do { _str = _str insert [-1, " "]; }; };
	_configName = _str;

	// Title
	private _hasTitle = (configName (_x >> "name")) != "";
	private _title = if (_hasTitle) then { getText (_x >> "name") } else { "" };
	private _str = _title;
	private _numStr = count _str;
	if (_numStr < _longestTitle) then { for "_i" from 1 to (_longestTitle - _numStr) do { _str = _str insert [-1, " "]; }; };
	_title = _str;

	// AddonSources
	private _addons = configSourceAddonList _x joinString ", ";
	private _str = _addons;
	private _numStr = count _str;
	if (_numStr < _longestConfigSource) then { for "_i" from 1 to (_longestConfigSource - _numStr) do { _str = _str insert [-1, " "]; }; };
	_addons = _str;

	diag_log format ["[%1.][%2s][ %3 | %4 ][ %5 ]", _index,_duration,_configName,_title,_addons];

} forEach _configs;


{
	private _str = _x;
	for "_i" from 1 to (_totalLength - count _x) do {
		private _insertIndex = 0;
		if (_i mod 2 == 0) then { _insertIndex = -1; };
		_str = _str insert [_insertIndex, "#"];
	};
	diag_log _str;
} forEach ["", " List of CfgMusic Classes is complete ", ""];