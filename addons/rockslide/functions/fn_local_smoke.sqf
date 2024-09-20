#include "../script_component.hpp"

/*
* Author: Zorn
* Function for Clientside Effects of the Rockslide
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

// if (true) exitWith {};

params ["_posStart", "_posEnd", "_bomb", "_duration", "_layerName", "_numberOfBombs"];

if (is3DENPreview) then {diag_log "fnc local smoke"};

private _tgtOBJ = createVehicleLocal ["Helper_Base_F", [0,0,0]];

// _posEnd set [2, _posEnd#2 + 2];
_tgtOBJ setPosASL _posStart;

private _particleSource = createVehicleLocal ["#particlesource", ASLToAGL _posEnd];

// PerFrameHandler
private _startTime = CBA_missionTime;
private _endTime = CBA_missionTime + _duration / 2;
private _parameters = [_startTime, _endTime, _particleSource, _tgtOBJ, _posStart, _posEnd, _layerName, _duration];
private _condition = { _this#1 > CBA_missionTime };
private _exitCode = { [ { deleteVehicle (_this#0); deleteVehicle (_this#1); } , [_this#2,_this#3], 15] call CBA_fnc_waitAndExecute; };

private _codeToRun = {
    params ["_startTime", "_endTime", "_particleSource", "_tgtOBJ", "_posStart", "_posEnd", "_layerName", "_duration"];
    private _progress = linearConversion [_startTime, _endTime, cba_missionTime, 0, 1, true];

    _particleSource setPosASL vectorLinearConversion [0,1, _progress, _posStart, _posEnd, true];
    _tgtOBJ         setPosASL vectorLinearConversion [0,1, _progress, _posStart, _posEnd, true];
    
    
    _particleSource setParticleCircle [
        linearConversion [0,1,_progress,1,15,true],
        [0,0,1]
    ];
    _particleSource setDropInterval linearConversion [0,1,_progress,0.01,0.001, true];
    _particleSource setParticleRandom [
        3, // lifetime
        [
            linearConversion [0,1,_progress,2,50,true], 
            linearConversion [0,1,_progress,2,50,true],
            linearConversion [0,1,_progress,0,2,true]
        ], // posVar
        [
            linearConversion [0,1,_progress,0,2,true],
            linearConversion [0,1,_progress,0,2,true],
            linearConversion [0,1,_progress,0,2,true]
        ], // moveV Var
        1, // rotationV var
        0, // sizeVar
        [0,0,0,0.01],0,0];

    _particleSource setParticleParams [
        ["\A3\data_f\cl_basic",1,0,1],
        "",
        "Billboard",
        1,
        40,
        [
            linearConversion [0,1,_progress,-1,-25,true],
            linearConversion [0,1,_progress,-1,-25,true],
            1
        ],          // pos
        [
            -1,
            -1,
            linearConversion [0,1,_progress,1,3,true]
        ], //move
        3,          // rotationV
        10.5,       // weight (prev 10)
        7.9,        // volume
        0.075,      // rubbing
        [2,20],     // sizeOverTime
        [
            [0.05,0.05,0.05,0.1],
            [0.2,0.2,0.2,0.25],
            [0.5,0.5,0.5,0]
        ], // color
        [0.08],
        1,
        0,
        "",
        "",
        _tgtOBJ
    ];
};

private _delay = 0;

[{
    params ["_args", "_handle"];
    _args params ["_codeToRun", "_parameters", "_exitCode", "_condition"];

    if (_parameters call _condition) then {
        _parameters call _codeToRun;
    } else {
        _handle call CBA_fnc_removePerFrameHandler;
        _parameters call _exitCode;
    };
}, _delay, [_codeToRun, _parameters, _exitCode, _condition]] call CBA_fnc_addPerFrameHandler;

