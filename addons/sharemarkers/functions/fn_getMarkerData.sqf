#include "../script_component.hpp"

/*
* Author: Zorn
* Function to take all the markers data and return it as a hashmap.
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* ['something'] call cvo_sharemarkers_fnc_getMarkerData;
*
* Public: Yes
*/

params [
    ["_markerName",     "",     [""]    ]
];

// If polyline marker is not used,   then markerPolyline returns an empty array

private _marker = createHashMapFromArray [ ["Name",_markerName]];


_marker set ["Pos", markerPos _markerName];

// Adds Data only if it does deviates from default.
private _size = markerSize _markerName;
if (_size isNotEqualTo [1,1]) then {_marker set ["Size", _size]};

private _text = markerText _markerName;
if (_text isNotEqualTo "") then {_marker set ["Text", _text]};

private _color = markerColor _markerName;
if (_color isNotEqualTo "Default") then {_marker set ["Color", _color]};

private _brush = markerBrush _markerName;
if (_brush isNotEqualTo "Solid") then {_marker set ["Brush", _brush]};

private _Channel = markerChannel _markerName;
if (_Channel isNotEqualTo -1) then {_marker set ["Channel", _Channel]};

private _Alpha = markerAlpha _markerName;
if (_Alpha isNotEqualTo 1) then {_marker set ["Alpha", _Alpha]};

private _dir = markerDir _markerName;
if (_dir isNotEqualTo 0) then {_marker set ["Dir", _dir]};

private _dp = markerDrawPriority _markerName;
if (_dp isNotEqualTo 0) then {_marker set ["DrawPriority", _dp]};

private _pl = markerPolyline _markerName;
if (_pl isNotEqualTo []) then {_marker set ["Polyline", _pl]};

private _Shape = markerShape _markerName;
if (_Shape isNotEqualTo "ICON") then {_marker set ["Shape", _Shape]};

private _Type = markerType _markerName;
if (_Type isNotEqualTo "") then {_marker set ["Type", _Type]};



_marker