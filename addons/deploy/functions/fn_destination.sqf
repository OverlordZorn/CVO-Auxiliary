#include "../script_component.hpp"

/*
* Author: Zorn
* Function to define the Destination
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
    ["_target",  false,     [objNull, []], [2,3] ],
    ["_networkName", "Default", [""]                 ],
    ["_params",  [],        [[]]                 ]
];

private _network = [_networkName] call FUNC(network);

private _type = switch (true) do {
    case (typeName _target == "ARRAY"): { "POS" };
    case ( _target isKindOf "AllVehicles" ): { "VIC" };
    case ( _target isKindOf "Static" ): { "STATIC" };
    default { "undefined" };
};



private _destination = createHashMapFromArray _params;
_destination merge createHashMapFromArray [
    ["target", _target],
    ["min", 10],
    ["max", 25],
    ["type", _type]
];

_network get "destinations" pushBack _destination;
