
/* ----------------------------------------------------------------------------
Function: cvo_flag_fnc_createMarker

Description:
    Create a colored Flag Marker marker on placed colored flags.

Parameters:
    _flag -  <Object>
    _color - <string> <can be: "GREEN", "RED"> 

Returns:

Examples:
    (begin example)
        [_flag, _color] call cvo_flag_fnc_createMarker;
    (end)

Author:
    Zorn

---------------------------------------------------------------------------- */

params [
    ["_flag", objNull, [objNull]]
    ];

private _color = typeOf _flag splitString "_" select -1;

private _colorMarker = switch (_color) do 
{
    case "black":   {"ColorBlack"};
    case "white":   {"ColorWhite"};
    
    case "red":     {"ColorRed"};
    case "green":   {"ColorGreen"};
    case "blue":    {"ColorBlue"};
    
    case "yellow":   {"ColorYellow"};
    case "purple":   {"ColorCivilian"};
    case "orange":   {"ColorOrange"};
    
    default         {""};
};

if (isNull _flag || {_colorMarker == ""} ) exitWith {};


private _size = missionNamespace getVariable ["CVO_SET_Intel_Flag_marker_size", 0.5];
private _alpha = missionNamespace getVariable ["CVO_SET_Intel_Flag_marker_alpha", 0.5];

private _counter = missionNamespace getVariable ["CVO_Intel_Flag_Marker_Counter", 0];

private _marker = createMarkerLocal [ ["cvo","flag", _counter, _colorMarker] joinString "_",_flag];

missionNamespace setVariable ["CVO_Intel_Flag_Marker_Counter", _counter + 1];

_marker setMarkerTypeLocal "mil_flag";
_marker setMarkerSizeLocal [_size, _size];
_marker setMarkerAlphaLocal _alpha;
_marker setMarkerColor _colorMarker;

diag_log format ['[CVO](debug)(fn_createFlagMarker) marker Created: %1',_marker];

_flag setVariable ["CVO_Flag_MarkerName", _marker];

// Adding EventHandler on Object on deleted

_flag addEventHandler ["Deleted", {	
    
    params ["_flag"];

    private _marker = _flag getVariable ["CVO_Flag_MarkerName", ""];
   
    if (_marker == "") exitWith {diag_log ("[CVO] [INTEL] [FLAGS] (delEH) CVO_Flag_MarkerName not found");};
    
    diag_log ("[CVO] [INTEL] [FLAGS] (delEH) Deleted Marker: "+ _marker);
    deleteMarker _marker;
}];

diag_log ("[CVO] [INTEL] [FLAGS] (createMarker) delEH added: " + _marker);
