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
    ["Name",          _markerName],
    ["Alpha",         markerAlpha _markerName],
    ["Brush",         markerBrush _markerName],
    ["Channel",       markerChannel _markerName],
    ["Color",         markerColor _markerName],
    ["Dir",           markerDir _markerName],
    ["DrawPriority",  markerDrawPriority _markerName],
    ["Polyline",      markerPolyline _markerName],
    ["Pos",           markerPos _markerName],
    ["Shadow",        markerShadow _markerName],
    ["Shape",         markerShape _markerName],
    ["Size",          markerSize _markerName],
    ["Text",          markerText _markerName],
    ["Type",          markerType _markerName]
];

_marker