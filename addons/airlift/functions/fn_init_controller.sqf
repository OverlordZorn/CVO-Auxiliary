#include "..\script_component.hpp"

/*
* Author: Zorn
* Initialises an Airlift Network - This will handle all requests, demands, needs etc.
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
    ["_controllerID",      "Default",      [""]    ]
];

if (!isServer) exitWith { ZRN_LOG_MSG(Failed - Needs to be Executed on the server); false };

if (_controllerID isEqualTo "") exitWith {false};

private _varName = ["CVO","Airlift","HMO",_controllerID] joinString "_";

private _hmo = missionNamespace getVariable [_varName, "404"];

if (_hmo isEqualTo "404") then {

    _hmo = createHashMapObject [
        [
            ["networkID", _controllerID],

            ["protected", true],

            ["homebase_avail", []],
            ["homebase_busy", []],

            ["servicebase_avail",[]],
            ["servicebase_busy",[]],

            ["heli_avail", []],
            ["heli_busy", []],

            ["tasks_queue", []],
            ["tasks_inProgress", []]

        ],
        []
    ];
    missionNamespace setVariable [_varName, _hmo, false];
};


_hmo


// Routine - Self Sustaining Loops 