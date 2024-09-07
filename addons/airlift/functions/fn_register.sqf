#include "..\script_component.hpp"

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
    ["_controllerID",    "Default",     [""]        ],
    ["_type",            "",            [""]        ],
    ["_obj",             objNull,       [objNull]   ],
    ["_params",          [],            []          ]
];

// Sanity
if (_obj isEqualTo objNull) exitWith {false};
if (_controllerID isEqualTo "") exitWith {false};
if !(_type in ["HOME","SERVICE","HELI"]) exitWith {false};

// Check is this object is already registered to a controller
private _alreadyRegistered = _obj getVariable [QGVAR(registered), false];
if (_alreadyRegistered isNotEqualTo false) exitWith {
    ZRN_LOG_MSG_2(Object already registered!,_alreadyRegistered,_obj);
    false
};

//Checks if ControllerID already exists, if not, creates it.
private _varName = ["CVO","Airlift","HMO",_controllerID] joinSilent "_";
_hmo = missionNamespace getVariable [_varName, "404"];
if (_hmo isEqualTo "404") then { _hmo = [_controllerID] call cvo_airlift_init_controller; };


// Adds 
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

// marks object as registered with the controller
_obj setVariable ["cvo_airlift_registered", _controllerID];

