#include "../script_component.hpp"

/*
* Author: Zorn
* Function to apply data to individual map markers
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

params ["_hmo"]; // Individual Map Marker Data as HMO

private _markerName = _hmo deleteAt "Name";
private _markerChannel = _hmo deleteAt "Channel";

ZRN_LOG_2(_markerName,_markerChannel);

if !(_markerName in allMapMarkers) then {
    // create not existing map marker.
    ZRN_LOG_MSG_1(Marker Exists Already:,_markerName);
    private _obj = [(flatten (_markerName regexFind ["#[0-9]*"])#0 ) trim ["#",1]] call cvo_common_fnc_getplayerIDobject;
    ZRN_LOG_1(_obj);
    createMarkerLocal [_markerName, [0,0,0], _markerChannel, _obj];
};

{
    ZRN_LOG_MSG_2(Retrieving and Applying,_x,_y);
    switch (_x) do {
        case "Alpha":        { _markerName setMarkerAlphaLocal    _y };
        case "Brush":        { _markerName setMarkerBrushLocal    _y };
        case "Color":        { _markerName setMarkerColorLocal    _y };
        case "Dir":          { _markerName setMarkerDirLocal      _y };
        case "DrawPriority": { _markerName setMarkerDrawPriority  _y };
        case "Polyline":     { _markerName setMarkerPolylineLocal _y };
        case "Pos":          { _markerName setMarkerPosLocal      _y };
        case "Shadow":       { _markerName setMarkerShadowLocal   _y };
        case "Shape":        { _markerName setMarkerShapeLocal    _y };
        case "Size":         { _markerName setMarkerSizeLocal     _y };
        case "Text":         { _markerName setMarkerTextLocal     _y };
        case "Type":         { _markerName setMarkerTypeLocal     _y };
    };
} forEach _hmo;

ZRN_LOG_MSG(############# Done #############);