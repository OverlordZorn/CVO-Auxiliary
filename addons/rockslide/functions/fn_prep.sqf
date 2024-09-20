/*
* Author: Zorn
* [Description]
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* [rockslide_start, "ROCKSLIDE", 40, 1] call zrn_rockslide_fnc_prep;
*
* Public: Yes
*/

if !(isServer) exitWith {systemChat "ERROR - zrn_rockslide_fnc_prep needs to be executed on the server"};


params [
    ["_startObj",   objNull,    [objNull]   ],
    ["_layerName",  "",         [""]        ],
    ["_numBombs",   1,          [0]         ],
    ["_duration",   40,         [0]         ],
    ["_recieveDmg", false,      [true]      ]
];


// Fail Conditions
if (_startObj isEqualTo objNull) exitWith {};
if (_layerName == "") exitWith {};


// Input sanitization
_duration = _duration max 0;
_numBombs = _numBombs max 0;


//Establishes local Variables
private _objects = getMissionLayerEntities _layerName select 0;

private _varName_trigger = (_layerName splitString " ") + ["trigger"] joinString "_"; // example: Rockslide_trigger
private _varName_isDone = (_layerName splitString " ") + ["isDone"] joinString "_";     // example: Rockslide_isDone
missionNamespace setVariable [_varName_isDone, false, true];

private _posStart = getPosASL _startObj;

private _posEnd = [];
{ _posEnd = _posEnd vectorAdd (getPosASL _x); } foreach _objects;
_posEnd = _posEnd VectorMultiply (1/count _objects);

private _params = [_posStart, _posEnd, _startObj, _duration, _layerName, _numBombs, _varName_isDone, _varName_trigger];


// hides all object inside layer in case they are not hidden yet
{ _x hideObjectGlobal true } foreach _objects;


// Establish Event Handlers and WUAE
[_startObj, "Deleted", {
    _thisArgs call zrn_rockslide_fnc_global_effects;
    if (is3DENPreview) then {systemchat "Rockslide - EH Deleted Triggered"};
}, _params] call CBA_fnc_addBISEventHandler;

if (_recieveDmg) then {
    [_startObj, "Dammaged", {
        _this params ["_unit", "_selection", "_damage", "_hitIndex", "_hitPoint", "_shooter", "_projectile"];

        if (is3DENPreview) then {systemChat "Rockslide - EH Dammaged triggered"};
        
        if (_damage < 0.1) exitWith {};
        if (is3DENPreview) then {systemChat "Rockslide - EH Dammaged triggered - threshhold reached"};

        _thisArgs call zrn_rockslide_fnc_global_effects;
        _unit removeEventHandler ["Dammaged", _thisID];

    }, _params] call CBA_fnc_addBISEventHandler;
};

// Triggers when _varName_trigger is set to true
private _condition = { missionNamespace getVariable [_this#0, false] isEqualTo true };
private _statement = { deleteVehicle (_this#1); if (is3DENPreview) then {systemchat "Rockslide - WUAE Triggered"};};                                                              
private _parameter = [ _varName_trigger, _startObj ];                      
[_condition, _statement, _parameter] call CBA_fnc_waitUntilAndExecute;


// returns the variable name which is being monitored
diag_log format ['[zrn](rockslide)(fn_prep) Name of monitored variable: %1', _varName_trigger];
if (is3DENPreview) then {systemchat format ['Rockslide - Prep - Name of monitored variable: %1', _varName_trigger];};
_varName_trigger