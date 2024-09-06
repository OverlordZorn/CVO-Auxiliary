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
    ["_networkID",      "Default",      [""]    ]
];

if (!isServer) exitWith {
    diag_log "[CVO](debug)(fn_init_network) FAILED - Needs to be Executed on the Server";
    false
};

if (_networkID isEqualTo "") exitWith {false};

private _varName = ["CVO","Airlift","HMO",_networkID] joinSilent "_";

private _hmo = missionNamespace getVariable [_varName, "404"];

if (_hmo isEqualTo "404") then {

    _hmo = createHashMapObject [
        [
            ["networkID", _networkID],

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
};

_hmo


// Routine - Self Sustaining Loops 