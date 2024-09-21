#include "..\script_component.hpp"


params ["_objSource", "_player", "_actionParams"];
_actionParams params ["_layerName", "_distance", "_time"];

if ( missionNamespace getVariable [["CVO", "ula","remaining", _layerName] joinString "_", 0] == 0) exitWith {};

private _title = format ["Remaining Objects to place: %1", missionNamespace getVariable [["CVO", "ula","remaining", _layerName] joinString "_", "N/A"]];

private _onComplete = {
    params ["_args", "_elapsedTime", "_totalTime", "_errorCode"];
    _args params ["_objSource", "_player", "_actionParams"];
    _actionParams params ["_layerName", "_distance", "_time"];

    [QGVAR(EH_reveal_object), [_layerName, _objSource]] call CBA_fnc_serverEvent;

    _parameters = [_objSource, _player, _actionParams];
    [FUNC(action_statement), _parameters] call CBA_fnc_execNextFrame;

};


private _condition = {
    params ["_args", "_elapsedTime", "_totalTime", "_errorCode"];
    _args params ["_objSource", "_player", "_actionParams"];
    _actionParams params ["_layerName", "_distance", "_time"];

    _cond1 = missionNamespace getVariable [ ["CVO", "ula","remaining", _layerName] joinString "_", 0 ] > 0;
    _cond1
};




[
    _time,          
    _this,
    _onComplete,
    {},
    _title,
    _condition

] call ace_common_fnc_progressBar;
