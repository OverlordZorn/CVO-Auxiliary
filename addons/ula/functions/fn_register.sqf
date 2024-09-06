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
* [this, ["SIGINT at Comms Alpha", "SIGINT at Comms Alpha"]] call cvo_ula_fnc_register_object;
*
* Public: Yes
*/


if (!isServer) exitWith {};

params [
    ["_obj",        objNull,        [objNull]       ],
    ["_layers",     [],             [[]]            ],
    ["_distance",   25,             [0]             ],
    ["_time",       1,              [0]             ],
    ["_meme",       true,          [true]          ]
];

diag_log "[CVO](debug)(fn_register) Init";

if (_obj isEqualTo objNull) exitWith {false};
if (count _layer == 0) exitWith {false};
if (_distance <= 0) exitWith {false};

// Creates the Event once
if (isNil "CVO_ULA_EHID_reveal") then { CVO_ULA_EHID_reveal = ["cvo_ula_EH_reveal_object", cvo_ula_fnc_reveal_object] call CBA_fnc_addEventHandler; };
if (isNil "CVO_ULA_EHID_add_action") then { CVO_ULA_EHID_add_action = ["cvo_ula_EH_add_action", cvo_ula_fnc_add_action] call CBA_fnc_addEventHandler; };
if (_meme) then { CVO_ULA_EHID_meme = ["cvo_ula_EH_playSound", cvo_ula_fnc_play_sound] call CBA_fnc_addEventHandler; };

if (_meme) then { _obj setVariable ["meme", true, true]};


// Initialises the layer's HMO
{
    private _layerName = _x;
    [_obj, _layerName, _distance, _time] call cvo_ula_fnc_init_layer;
    ["cvo_ula_EH_add_action", [_obj, _layerName, _distance, _time]] call CBA_fnc_globalEventJIP;
} forEach _layers;

private _attachedLayers = _obj getVariable ["cvo_ula_layers", []];
_attachedLayers append _layers;
//_obj setVariable ["cvo_ula_layers", _attachedLayers, true];

diag_log "[CVO](debug)(fn_register) Done";
true