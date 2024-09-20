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



params ["_posStart", "_posEnd", "_bomb", "_duration", "_layerName", "_numberOfBombs"];

if (is3DENPreview) then {diag_log "fnc local rocks"};

#define ACC 20

private _dir = _posStart getDir _posEnd;

// Spawn Rocks
private _tgtOBJ = createVehicleLocal ["Helper_Base_F", [0,0,0]];
_posEnd set [2, _posEnd#2 + 2];
_tgtOBJ setPosASL _posStart;

private _dust_cloud = createVehicleLocal ["#particlesource", ASLToAGL _posStart];
_dust_cloud setParticleCircle [5, [0, 0, 0]];
_dust_cloud setDropInterval 0.01;
_dust_cloud setParticleRandom [10, [30, 30, 0], [0, 0, 2], 1, 0, [0, 0, 0, 0.01], 0, 0];
_dust_cloud setParticleParams [
    ["\A3\data_f\cl_basic", 1, 0, 1], 
    "", 
    "Billboard", 
    1, 
    60, 
    [0, 0, -6],
    [(sin _dir) * ACC * 0.5 ,(cos _dir) * ACC * 0.5 , -1], 
    7, 2, 1, 0, [9,15,30], [[0.01,0.01,0.01,0.1],[0.1,0.1,0.1,0.5],[1,0.9,0.7,0]], [1000], 1, 0, "", "", _tgtOBJ, 0, true, 0.75, [[0,0,0,0]]];

private _bolovani = createVehicleLocal ["#particlesource", ASLToAGL _posStart];
_bolovani setParticleCircle [3, [0, 0, 0]];
_bolovani setParticleRandom [30, [20, 20, 0], [0, 0, 0], 0, 0.25, [0, 0, 0, 0], 0, 0];
_bolovani setParticleParams [
    ["\A3\data_f\ParticleEffects\Universal\Mud.p3d", 1, 0, 1], 
    "", 
    "SpaceObject", 
    1, 
    160, 
    [0, 0, 0.1], 
    [(sin _dir) * ACC ,(cos _dir) * ACC, 0], 
    0.05, 20, 7.9, 0.000001, [1.5, 1.5, 1.5], [[1,1,1,1], [1,1,1,1], [1,1,1,1]], [0.08], 0, 0, "", "", _tgtOBJ,0,true,0.6,[[0,0,0,0]]];
_bolovani setDropInterval 0.2;

private _rock = createVehicleLocal ["#particlesource", ASLToAGL _posStart];
_rock setParticleCircle [3, [0, 0, 0]];
_rock setParticleRandom [30, [20, 20, 0], [0, 0, 0], 0, 0.25, [0, 0, 0, 0], 0, 0];
_rock setParticleParams [
    ["\A3\data_f\ParticleEffects\Universal\StoneSmall.p3d", 1, 0, 1], 
    "", 
    "SpaceObject", 
    1, 
    160, 
    [0, 0, 0.1], 
    [(sin _dir) * ACC ,(cos _dir) * ACC, 0], 
    0.06, 25, 7.9, 0.000001, [2, 2, 2], [[1,1,1,1], [1,1,1,1], [1,1,1,1]], [0.08], 0, 0, "", "", _tgtOBJ,0,true,0.6,[[0,0,0,0]]];
_rock setDropInterval 0.2;

// PerFrameHandler
private _startTime = CBA_missionTime;
private _endTime = CBA_missionTime + _duration / 1.5;
private _parameters = [_startTime, _endTime, _particleSource, _tgtOBJ, _posStart, _posEnd, _layerName, _duration];
private _condition = { _this#1 > CBA_missionTime };

private _codeToRun = {
    params ["_startTime", "_endTime", "_particleSource", "_tgtOBJ", "_posStart", "_posEnd", "_layerName", "_duration"];

    private _dir = _posStart getDir _posEnd;

    private _progress = linearConversion [_startTime, _endTime, cba_missionTime, 0, 1, true];

    _tgtOBJ     setPosASL vectorLinearConversion [0,1, _progress, _posStart, _posEnd, true];

};
private _delay = 0;

[{
    params ["_args", "_handle"];
    _args params ["_codeToRun", "_parameters", "_exitCode", "_condition"];

    if (_parameters call _condition) then {
        _parameters call _codeToRun;
    } else {
        _handle call CBA_fnc_removePerFrameHandler;
    };
}, _delay, [_codeToRun, _parameters, _exitCode, _condition]] call CBA_fnc_addPerFrameHandler;

[{ {deleteVehicle _x} forEach _this; }, [_rock, _bolovani], _duration * 0.8] call CBA_fnc_waitAndExecute;
[{ {deleteVehicle _x} forEach _this; }, [_tgtOBJ, _dust_cloud], _duration * 1,2] call CBA_fnc_waitAndExecute;
