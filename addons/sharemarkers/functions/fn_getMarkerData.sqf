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
* ['something', player] call cvo_fnc_sth
*
* Public: Yes
*/

params [
    ["_markerName",     "",     [""]    ]
];

// If polyline marker is not used, then markerPolyline returns an empty array

private _marker = createHashMapFromArray [
    ["isPolyline",          _isPolyline],
    ["markerName",          _markerName],
    ["markerAlpha",         markerAlpha _markerName],
    ["markerBrush",         markerBrush _markerName],
    ["markerChannel",       markerChannel _markerName],
    ["markerColor",         markerColor _markerName],
    ["markerDir",           markerDir _markerName],
    ["markerDrawPriority",  markerDrawPriority _markerName],
    ["markerPolyline",      markerPolyline _markerName],
    ["markerPos",           markerPos _markerName],
    ["markerShadow",        markerShadow _markerName],
    ["markerShape",         markerShape _markerName],
    ["markerSize",          markerSize _markerName],
    ["markerText",          markerText _markerName],
    ["markerType",          markerType _markerName]
];
_marker