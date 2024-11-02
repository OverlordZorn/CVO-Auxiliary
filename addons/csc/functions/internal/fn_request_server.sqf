#include "../../script_component.hpp"

/*
* Author: Zorn
* Function that will execute the request on the server
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

if !(isServer) exitWith {};

params [
    ["_entryName",          "",         [""]        ],
    ["_catName",            "",         [""]        ],
    ["_deliveryMethod",     "",         [""]        ],
    ["_target",             objNull,    [objNull]   ]
];

ZRN_LOG_MSG_4(INIT,_entryName,_catName,_deliveryMethod,_target);

private _cat = [_catName] call FUNC(catalog);
if (count _cat == 1) exitWith {ZRN_LOG_MSG(Failed: Empty Catalog on the server)};
if !(_entryName in _cat) exitWith  {ZRN_LOG_MSG(Failed: Entry not Found on the Server)};

private _entry = _cat get _entryName;

private _box = [_entry] call FUNC(createCrate);
if (isNull _box) exitWith {ZRN_LOG_MSG(Failed Creation of BOX);};

private _boxSize = (boundingBox _box select 2);
private _tgtSize = _target call BIS_fnc_boundingBoxDimensions;

private _spawn_pos = [_entry, _deliveryMethod, _target, _boxSize] call FUNC(getPos);

// this is stupid but oh well...
_spawn_pos set [2,_spawn_pos#2 + _tgtSize#2 * 0.8 ];

// Move box to desired position
_box setVehiclePosition [_spawn_pos, [], _boxSize * 1.5, "CAN_COLLIDE"];

