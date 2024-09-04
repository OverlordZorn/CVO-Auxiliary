params [
    ["_enable", true, [true]]
];

if !(isServer) exitWith {};

private _id = missionNamespace getVariable ["cvo_insignia_eh_group_id", "404"];
private _isEnabled = _id isNotEqualTo "404";

// // ["CVO_Insignia_Request_AutoAssign",[], _group] call CBA_fnc_targetEvent;

