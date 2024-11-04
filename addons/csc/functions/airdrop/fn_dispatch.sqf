#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to create the aircraft which will bring the supplies to the dropzone.
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* ['something', player] call cvo_fnc_sth
*
* Public: No
*/

if !(isServer) exitWith {};

#define TIMEOUT 900

params [
    ["_entryName",  "",         [""]            ],
    ["_catName",    "",         [""]            ],
    ["_targetPos",  [0,0,0],    [[]],   [2,3]   ]
];



private _cat = [_catName] call FUNC(catalog);
if (_cat isEqualTo "404") exitWith {ZRN_LOG_MSG(Failed: No Catalog)};
if !(_entryName in _cat) exitWith  {ZRN_LOG_MSG(Failed: No Entry)};

private _entry = _cat get _entryName;
private _startPos = _entry get "airdrop_pos_start";

_startPos set [2, 0 max (ATLToASL _startPos # 2) + 100];


// Create Aircraft
private _aircraft = createVehicle [(_entry get "airframe_class"), [0,0,0], [], 0, "FLY"];

_aircraft flyInHeight [_entry get "airdrop_alt", _entry get "airdrop_alt_forced"];
_aircraft flyInHeightASL (_entry get "airdrop_flyInHeightASL");

private _grp = (_entry get "airframe_side") createVehicleCrew _aircraft;
_grp addVehicle _aircraft;
_grp setCombatBehaviour "CARELESS";
_grp deleteGroupWhenEmpty true;

//  Manage ACE HC Blacklist
[[_aircraft] + units _grp, true] call ace_headless_fnc_blacklist;

// Place and Rotate Plane
_aircraft setPosASL _startPos;
private _dir = (_startPos getDir _targetPos);
_aircraft setDir _dir;

// If enabled, make Asset Invincible
if (_entry get "airframe_protected") then { { _x allowDamage false; } forEach [_aircraft] + crew _aircraft; };

// Provide Waypoints
_grp addWaypoint [_targetPos, 25];
_grp addWaypoint [_targetPos getPos [250, _dir], 25];

private _endpos = _entry get "airdrop_pos_end";

_endPos = switch true do {
    case (_endPos isEqualTo "RETURN"):   { _startPos };
    case (_endPos isEqualTo "CONTINUE"): { _targetPos getPos [10000, _dir] };
    case (_endPos isEqualType []):       { _endPos };
    default { [0,0,0] };
};

private _wpEnd = _grp addWaypoint [_endPos, 100];
_wpEnd setWaypointStatements ["true", "{deleteVehicle _x} forEach [vehicle this] + thisList"];


// PFEH - Drop Crate 
private _pfeh_id = [{
    params ["_args", "_handle"];
    _args params ["_entry", "_aircraft", "_targetPos"];

    if (( _aircraft distance2D _targetPos ) > 50) exitWith {};
    [_entry, _aircraft] call FUNC(dropCrate);
    _handle call CBA_fnc_removePerFrameHandler;

}, _delay, [_entry, _aircraft, _targetPos]] call CBA_fnc_addPerFrameHandler;

// Store PFEH_ID on object to retrieve during EH's
_aircraft setVariable [QGVAR(pfeh_id), _pfeh_id];

// Stops the PFEH when the object is killed or deleted
private _cleanup = {
    params ["_aircraft"];
    _aircraft getVariable QGVAR(pfeh_id) call CBA_fnc_removePerFrameHandler;
    ZRN_LOG_MSG_2(PFEH Stopped,_thisEvent,_aircraft);
};
_aircraft addEventHandler ["Killed", _cleanup];
_aircraft addEventHandler ["Deleted", _cleanup];