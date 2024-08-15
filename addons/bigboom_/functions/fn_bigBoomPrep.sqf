if (!isServer) exitWith {false};

params [
    ["_target",         objNull,    [objNull]   ],
    ["_delay",            3,        [0]         ]
];

diag_log format ['[CVO](debug)(fn_bigBoomPrep) INIT _this: %1', _this];
_delay = 0 max _delay;

private _ehCode = { 
    params ["_object", "_killer", "_instigator", "_useEffects"];
    _thisArgs params ["_delay"];

    diag_log format ['[CVO](debug)(Killed EH triggered) %1 killed by %2 - instigator: ', _object ,_killer, _instigator];

    
    // creates helper object which can be deleted by zeus to stop the effects
    private _pos = getPos _object;
    _pos set [2, _pos#2 + 5];
    private _helper = createVehicle ["Helper_Base_F", [0,0,0]];
    _helper setPos _pos;
    diag_log format ['[CVO](debug)(EventHandler) helper created: _helper: %1 - getPos _helper: %2', _helper , getPos _helper];

    private _code = {
        params ["_object", "_helper"];
        createVehicle ["Bo_GBU12_LGB", getPos _object]; // Spawn bomb once globally
        [CBA_missionTime, _object, _helper] remoteExecCall ["ZRN_fnc_bigBoomHMO", [0,-2] select isDedicated,_helper];
    };

    if (_delay == 0) then _code else { [_code, [_object,_helper], random _delay] call CBA_fnc_waitAndExecute; };

    _object removeEventHandler [_thisEvent, _thisEventHandler];
};

private _HandlerID = [_target, "Killed", _ehCode, [_delay]] call CBA_fnc_addBISEventHandler;
diag_log format ['[CVO](debug)(fn_bigBoomPrep) Eventhandler added to: %1 - _HandlerID: %2', _target  , _HandlerID];
true