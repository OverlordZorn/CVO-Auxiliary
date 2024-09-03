/*
* Author: Zorn
* Function to identify Insignia based on Groupname, Leadership Position and Trait (medic, Engineer)
*
* Arguments:
*
* Return Value:
* <STRING> if failed, will return "404", otherwise, choosen Classname
*
* Example:
* [] call cvo_aux_insignia_fnc_identify;
*
* Public: Yes
*/


params [
    ["_unit", player, [objNull]]
];


if (_unit isEqualTo objNull) exitWith {false};
if (!isPlayer _unit) exitWith {false};

private _groupName = groupId group _unit;

private _regexReturn = flatten (_groupName regexFind ["1-[0-9]"]);

if (_regexReturn isEqualTo []) exitWith {"404"};

_regexReturn = flatten _regexReturn # 0;

private _callSign = switch (_regexReturn) do {
    case "1-1": { "11" };
    case "1-2": { "12" };
    case "1-3": { "13" };
    case "1-4": { "14" };
    case "1-5": { "15" };

    case "1-6": { "16_PL" };
    case "1-0": { "10_COY" };

    default {"blank"};
};

private _array = ["CVO","insignia",_callSign];

private _steamID = getPlayerUID _unit;

private _isOfficerRole = "Officer" in (_unit getVariable ["CVO_A_Roles", []]);
private _isTeamLeadRole = "TL" in (_unit getVariable ["CVO_A_Roles", []]);
private _isSquadlead = _unit isEqualTo leader _unit;
private _groupSize = count units _unit;

private _is1IC = _isSquadlead && _isOfficerRole;
private _is2IC = _isSquadlead || _isOfficerRole;

private _isMedic = [_unit, 1] call ace_medical_treatment_fnc_isMedic;
private _isEngineer = [_unit, 1] call ace_repair_fnc_isEngineer;

private _type = switch (_callSign) do {

    case "10_COY" : {
        switch _steamID do {
            case "76561197960287930": { "CO" };
            default { "RFL" };
        };
    };

    case "16_PL"  : {
        switch (true) do {
            case _is1IC: { "CO" };
            case _is2IC: { "SGT" };
            case _isMedic: { "MED" };
            case _isEngineer: { "ENG" };
            default { "RFL" };
        };
    };

    default {
        switch (true) do {
            case _is1IC: { "SL" };
            case _is2IC: { "TL" };
            case _isMedic: { "MED" };
            case _isEngineer: { "ENG" };
            default { "RFL" };
        };
    };

};

_array pushBack _type;
private _return = _array joinString "_";
diag_log format ['[CVO](debug)(fn_identity) _return: %1', _return];
_return
