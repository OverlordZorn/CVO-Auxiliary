/*
* Author: Zorn
* Registers Helicopters, homebases, service stations etc. to a network.
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

params [
    ["_networkID",       "Default",     [""]        ],
    ["_type",            "",            [""]        ],
    ["_obj",             objNull,       [objNull]   ],
    ["_params",          [],            []          ]
];


if (_obj isEqualTo objNull) exitWith {false};
if (_networkID isEqualTo "") exitWith {false};

if !(_type in ["HOME","SERVICE","HELI"]) exitWith {false};

private _varName = ["CVO","Airlift","HMO",_networkID] joinSilent "_";

_hmo = missionNamespace getVariable [_varName, "404"];

if (_hmo isEqualTo "404") then { _hmo = [_networkID] call cvo_airlift_init_network; };

switch (_type) do {
    case "HOME": {
        _hmo get "homebase_avail" pushBack _obj;
    };
    case "SERVICE": {
        _hmo get "servicebase_avail" pushBack _obj;
    };
    case "HELI": {
        _hmo get "heli_avail" pushBack _obj;
    };
};

