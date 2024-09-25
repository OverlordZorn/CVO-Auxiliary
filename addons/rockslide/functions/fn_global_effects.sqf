#include "../script_component.hpp"

/*
* Author: Zorn
* Triggers a Rockslide and populates it across all currently connected players. No JIP required.
*
* Arguments:
*
* Return Value:
* none
*
* Example:
* ['something', player] call cvo_fnc_sth
*
* Public: Yes
*/

if (!isServer) exitWith {};

params ["_posStart", "_posEnd", "_startObj", "_duration", "_layerName", "_numBombs", "_varName_isDone", "_varName_trigger"];


// Creates HelperObj at the startPos and endPos
_startObj = createVehicle ["Helper_Base_F", [0,0,0]];
_startObj setPosASL _posStart;


// Ensures this code only gets executed once.
if (missionNamespace getVariable [_varName_isDone, false] isEqualTo true) exitWith {};
missionNamespace setVariable [_varName_isDone, true, true];
// stops WUAE
missionNamespace setVariable [_varName_trigger, true];


// creates remote explosions
private _code = {
    params ["_pos", "_radius"];
    private _obj = createVehicle ["Bo_GBU12_LGB",[0,0,0], [], _radius, "CAN_COLLIDE"];
    _obj setPosASL _pos;
    if (is3DENPreview) then {diag_log "Rockslide - Bomb"};
};

switch (_numBombs) do {
    case 0: { };
    case 1: { [_code , [_posStart, 0], 1 + random 1] call CBA_fnc_waitAndExecute; };
    default { for "_i" from 1 to _numBombs do { [_code , [_posStart, 50], _i + random (2)] call CBA_fnc_waitAndExecute; }; };
};

// unhide the Rock objects globally
{
    [{
        _this#0 hideObjectGlobal false;
    } , [_x], _duration * ( random 0.4 + 0.6 ) ] call CBA_fnc_waitAndExecute;

} forEach (getMissionLayerEntities _layerName select 0);



[{
    params ["_posStart", "_posEnd", "_startObj", "_duration", "_layerName", "_numBombs"];

    // Play sound globally
    playSound3D [PATH_TO_ADDON_2(data,sound_landslide.ogg), objNull , false, _posEnd, 5, 1, 2000, 0, false];
    if (is3DENPreview) then {diag_log "GLOB - Sound"};

    // Playerside Effects
    [QGVAR(EH_local_effects), _this] call CBA_fnc_globalEvent;

} , [_posStart, _posEnd, _startObj, _duration, _layerName, _numBombs], 2] call CBA_fnc_waitAndExecute;