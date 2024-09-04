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

if (_regexReturn isEqualTo []) then {_regexReturn = "404"};

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

private _threshold = missionNamespace getVariable ["CVO_SET_Insignia_threshold_SL", 5];

private _sortedByRankID = [units group _unit, [], {rankId _x}, "DESCEND"] call BIS_fnc_sortBy;
private _ranks = _sortedByRankID apply {rankID _x};
_ranks = _ranks arrayIntersect _ranks;

private _classNameArray = ["CVO","insignia",_callSign];
private _steamID = getPlayerUID _unit;
private _groupSize = count units _unit;

private _highestRank = (_sortedByRankID # 0) isEqualTo _unit;

private _highestRankAndSquadsize = (
    _highestRank &&
    {_groupSize >= _threshold}
);


private _notLowestRank = (
    !_higestRank && 
    { rankID (_sortedByRankID # -1) isNotEqualTo (rankID _unit); }
);


private _leadership =  switch (_regexReturn) do {
    case "1-0": {
        switch _steamID do {
            case "76561197970306509": { 69 };
            default { 0 };
        };
    };
    case "1-6": {
        switch (true) do {
            case _highestRank: { 2 };
            case _notLowestRank: { 1 };
            default { 0 };
        };
    };
    default {
        switch (true) do {
            case _highestRankAndSquadsize: { 2 };
            case _highestRank: { 1 };
            case _notLowestRank: { 1 };
            default { 0 };
        };
    };
};


private _isMedic = [_unit, 1] call ace_medical_treatment_fnc_isMedic;
private _isEngineer = [_unit, 1] call ace_repair_fnc_isEngineer;

private _type = switch (_callSign) do {

    case "10_COY" : {
        switch _leadership do {
            case 69: { "CO" };
            default { "RFL" };
        };
    };

    case "16_PL"  : {
        switch (true) do {
            case (_leadership == 2): { "CO" };
            case (_leadership == 1): { "SGT" };
            case _isMedic: { "MED" };
            case _isEngineer: { "ENG" };
            default { "RFL" };
        };
    };

    default {
        switch (true) do {
            case (_leadership == 2): { "SL" };
            case (_leadership == 1): { "TL" };
            case _isMedic: { "MED" };
            case _isEngineer: { "ENG" };
            default { "RFL" };
        };
    };

};

_classNameArray pushBack _type;
private _return = _classNameArray joinString "_";
diag_log format ['[CVO](debug)(fn_identity) _return: %1', _return];
_return
