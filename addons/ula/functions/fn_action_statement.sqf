#include "..\script_component.hpp"


params ["_objSource", "_player", "_actionParams"];
_actionParams params ["_layerName", "_distance", "_time"];

if ( missionNamespace getVariable [["CVO", "ula","remaining", _layerName] joinString "_", 0] == 0) exitWith {};

private _title = format ["Remaining Objects to place: %1", missionNamespace getVariable [["CVO", "ula","remaining", _layerName] joinString "_", "N/A"]];
private _blockInput = _objSource getVariable [QGVAR(blockInput), true];

private _onComplete = {
    params ["_args", "_elapsedTime", "_totalTime", "_errorCode"];
    _args params ["_objSource", "_player", "_actionParams"];
    _actionParams params ["_layerName", "_distance", "_time"];

    [QGVAR(EH_revealObject), [_layerName, _objSource]] call CBA_fnc_serverEvent;

    _parameters = [_objSource, _player, _actionParams];
    [FUNC(action_statement), _parameters] call CBA_fnc_execNextFrame;

};



private _condition = {
    params ["_args", "_elapsedTime", "_totalTime", "_errorCode"];
    _args params ["_objSource", "_player", "_actionParams"];
    _actionParams params ["_layerName", "_distance", "_time"];
    private _maxDistance = (_objSource getVariable QGVAR(size)) * 2 max 5;

   
    _cond1 = missionNamespace getVariable [ ["CVO", "ula","remaining", _layerName] joinString "_", 0 ] > 0;
    _cond2 = player distance _objSource < _maxDistance;
    _cond1 && {_cond2}
};


[
    _time,                              // Time
    _this,                              // Parameters
    _onComplete,                        // on completion code
    {},                                 // on failure code
    _title,                             // localised title
    _condition,                         // condition
    [],                                 // Exceptions for checking ace_common_fnc_canInteractWith
    _blockInput                         // block input

] call ace_common_fnc_progressBar;
