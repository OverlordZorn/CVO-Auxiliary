#include "../script_component.hpp"

/*
* Author: Zorn
* Function to get the Desination's Namestring
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
    ["_destination", createHashmap, [createHashmap] ]
];

private _type = _destination get "type";
private _target = _destination get "target";

private _vic = {

    private _name = getText (configFile >> "CfgVehicles" >> typeOf _target >> "displayName");
    private _occSeats = count fullCrew [_target, "", false];
    private _allSeats = count fullCrew [_target, "", true];
    private _pos = mapGridPosition _target;
    private _grid = format ["[%1-%2]", _pos select [0,2], _pos select [count _pos /2,2] ];

    private _loc = nearestLocation [getPos _target, ""];
    private _distance = position _loc distance _target;

    private _cdir = ["N", "NNE","NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW", "N"];
    private _direction = _cdir select floor ( (position _loc getDir _target;) / (360 / count _cdir));

    private _rel = format ["%1 %2 from %3", _distance, _direction, name _loc]; 
    
    format ["%1 (%2/%3) %4 %5 ", _name, _occSeats, _allSeats, _grid, _rel];

};


switch (_type) do {
    case "POS": { };
    case "VIC": { };
    case "STATIC": { };
    default { };
};



