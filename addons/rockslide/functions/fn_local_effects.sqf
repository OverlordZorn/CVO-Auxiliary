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

if !(hasInterface) exitWith {};

params ["_posStart", "_posEnd", "_bomb", "_duration", "_layerName", "_numberOfBombs"];

if (is3DENPreview) then {diag_log "fnc local"};

_this call ZRN_rockslide_fnc_local_rocks;
_this call ZRN_rockslide_fnc_local_smoke;

private _distance = player distance _posEnd;


// CamShake Duration
enableCamShake true;
[{
    params ["_duration", "_distance"];
    addCamShake [
        linearConversion [200, 1500, _distance, 2, 1],
        0.6 * _duration,
        6
    ];
    if (is3DENPreview) then {diag_log "LOC - Shake"};
} , [_duration,_distance], _duration * 0.1] call CBA_fnc_waitAndExecute;

[{
    params ["_duration", "_distance"];
    addCamShake [
        linearConversion [200, 1500, _distance, 2, 1],
        0.6 * _duration,
        6
    ];
    if (is3DENPreview) then {diag_log "LOC - Shake"};
} , [_duration,_distance], _duration * 0.2] call CBA_fnc_waitAndExecute;

[{
    params ["_duration", "_distance"];
    addCamShake [
        linearConversion [200, 1500, _distance, 4, 1],
        0.4 * _duration,
        6
        ];
    if (is3DENPreview) then {diag_log "LOC - Shake"};
} , [_duration, _distance], _duration * 0.4] call CBA_fnc_waitAndExecute;

[{
    params ["_duration", "_distance"];
    addCamShake [
        linearConversion [200, 1500, _distance, 4, 1],
        0.2 * _duration,
        6
    ];
    if (is3DENPreview) then {diag_log "LOC - Shake"};
} , [_duration,_distance], _duration * 0.6] call CBA_fnc_waitAndExecute;




// Camera Blur
private _PP_dynamic = ppEffectCreate ["DynamicBlur",500];
_PP_dynamic ppEffectEnable true;
_PP_dynamic ppEffectAdjust [
    linearConversion [200, 1500, _distance, 0.5, 0.05, true]
];
_PP_dynamic ppEffectCommit _duration/3;
[{
    _this#0 ppEffectAdjust [0.0];
    _this#0 ppEffectCommit _this#1;
} , [_PP_dynamic, _duration/3], _duration/2] call CBA_fnc_waitAndExecute;
[{
    ppEffectDestroy _this#0;
} , [_PP_dynamic], _duration * 1.1] call CBA_fnc_waitAndExecute;