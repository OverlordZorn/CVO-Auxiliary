#include "..\script_component.hpp"


/*
* Author: Zorn
* Create an action on an object to simulate the building of "something", by unhiding a layer based on the name of the layer.
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* [this, ["SIGINT at Comms Alpha", "SIGINT at Comms Alpha"]] call cvo_ula_fnc_register;
*
* Public: Yes
*/


if (!isServer) exitWith {};

params [
    ["_obj",        objNull,        [objNull]       ],
    ["_layers",     [],             [[]]            ],
    ["_distance",   25,             [0]             ],
    ["_time",       5,              [0]             ],
    ["_meme",       true,          [true]          ]
];

diag_log "[CVO](debug)(fn_register) Init";

if (_obj isEqualTo objNull) exitWith {false};
if (count _layer == 0) exitWith {false};
if (_distance <= 0) exitWith {false};

if (_meme) then { _obj setVariable ["meme", true, true]};


// Initialises the layer's HMO
{
    private _layerName = _x;
    [_obj, _layerName, _distance, _time] call FUNC(init_layer);
    [QGVAR(EH_add_action), [_obj, _layerName, _distance, _time]] call CBA_fnc_globalEventJIP;
} forEach _layers;

private _attachedLayers = _obj getVariable [QGVAR(layers), []];
_attachedLayers append _layers;

diag_log "[CVO](debug)(fn_register) Done";
true