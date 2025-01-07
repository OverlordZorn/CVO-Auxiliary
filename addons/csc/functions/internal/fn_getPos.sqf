#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to establish position for the CSC system
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

params ["_entry", "_deliveryMethod", "_target", "_boxSize"];

private _spawnPos = _entry get "spawn_pos";

private _return = switch (_deliveryMethod) do {
    case "REL": { _target getRelPos [ ( ( _target call BIS_fnc_boundingBoxDimensions ) #0 / 2 ) + 3 + _boxSize,180 ] };
    case "POS": {
        switch (typeName _spawnPos) do {
            case "STRING": {
                private _obj = missionNamespace getVariable [_spawnPos, "404"];
                if (_obj isEqualType objNull) then { getPosATL _obj } else { [0,0,0] };
            };
            case "OBJECT": { getPosATL _spawnPos };
            case "ARRAY":  { _spawnPos };
            default        { [0,0,0] };
        };
    };
    default { [0,0,0] };
};

ZRN_LOG_1(_return);

_return