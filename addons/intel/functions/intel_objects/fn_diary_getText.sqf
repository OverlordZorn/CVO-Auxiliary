#include "../../script_component.hpp"

/*
* Author: Zorn
* function that constructs the text within the diary entry.
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

diag_log "[CVO](debug)(fn_diary_getText) Init ";

private _discoveredIntelGroups = missionNamespace getVariable [QGVAR(discovered), []];


private _stringArray = [];

private _header = "<font face='EtelkaMonospacePro' color='#0099ff' size='14'>Intel Found:</font>";

_stringArray pushBack _header;

{
    private _groupName = _x;

    [_groupName] call FUNC(checkGroup) params ["_found","_total"];

    diag_log format ['[CVO](debug)(fn_diary_getText) _found: %1 - _total: %2', _found , _total];

    private _text = [
        format ["<font size=10 face='EtelkaMonospacePro'>%1 / %2 - %3</font>",_found, _total, _groupName],
        format ["<font size=10 face='EtelkaMonospacePro'>%1 / %2 - %3 - Complete!</font>",_found, _total, _groupName]
    ] select (_found == _total);
    
    _stringArray pushBack _text;
} forEach _discoveredIntelGroups;

_stringArray joinString "<br />"