#include "../script_component.hpp"

/*
* Author: Zorn
* Function that will create the crate and put it on a parachute beneath the airframe that is dropping the crate.
*
* Arguments:
* 0 - object - the aircraft that is supposed to drop the crate
* 1 - string - classname of the crate object to be created
* 2 - string - classname of the parachute to be used
*
* Return Value:
* None
*
* Example:
* ['something', player] call cvo_fnc_sth
*
* Public: Yes
*/

#define MIN_ALTITUDE 35

if !(isServer) exitWith {false};

params ["_entryName", "_aircraft"];


private _catalog = missionNamespace getVariable [QGVAR(catalog), "404"];
if (_catalog isEqualTo "404") exitWith {ZRN_LOG_MSG(Failed - No Catalog)};
if !(_entryName in _catalog) exitWith  {ZRN_LOG_MSG(Failed - Entry Not Found)};


private _entry = _catalog get _entryName;

private _crateClass = _entry get "class_box";
private _paraClass = _entry get "class_para";




if (_aircraft isEqualTo objNull) exitWith {false};
if (damage _aircraft == 1) exitWith {false};

private _box = createVehicle [_crateClass, [0,0,0]];
if (isNull _box) exitWith {ZRN_LOG_MSG(Failed Creation of BOX);};

private _chute = createVehicle [_paraClass, [0,0,100], [], 0, "CAN_COLLIDE"];
if (isNull _chute) exitWith {ZRN_LOG_MSG(Failed Creation of CHUTE);};

_aircraft disableCollisionWith _chute;
_aircraft disableCollisionWith _box;


private _posAircraft = getPosASL _aircraft;

private _offsetBox   = boundingBox _box select 2;
private _offsetAir   = boundingBox _aircraft select 2;
private _offsetTotal = _offsetAir + _offsetBox;

private _spawnPos = if ((_posAircraft # 2 - _offsetTotal) > MIN_ALTITUDE) then {
    ZRN_LOG_MSG(DROPPED Beneath);
    [ _posAircraft # 0, _posAircraft # 1, _posAircraft # 2 - _offsetTotal ]
} else {
    ZRN_LOG_MSG(DROPPED Behind);
    _aircraft getRelPos [_offsetTotal, 180]
};


_chute setPosASL _spawnPos;


[
    _box,
    _entry get "items",
    _entry get "backpacks",
    _entry get "emptyBox"
] call ZRN_supplyDrop_fnc_fillCrate;

_box attachTo [_chute, [0,0,0]];


if (_entry get "attachSmoke") then {
    private _smoke = createVehicle [_entry get "class_smoke", [0,0,10], [], 0, "CAN_COLLIDE"];
    _smoke attachTo [attachedTo _box, [0,0,0]];
};


if (_entry get "attachStrobe") then {
    private _strobe = createVehicle [_entry get "class_strobe", [0,0,10], [], 0, "CAN_COLLIDE"];
    _strobe attachTo [attachedTo _box, [0,0,32]];
    [ {	isTouchingGround _this#1 }, { deleteVehicle _this#0 }, [_strobe, _box] ] call CBA_fnc_waitUntilAndExecute;
};

// Detaches the box from the parachute once its close to the ground or deleted
[
    { isNull _this || { ( getPos _this #2 ) <1 } },
    { if (isNull _this) exitWith {}; detach _this },
    _box,
    300
] call CBA_fnc_waitUntilAndExecute;

ZRN_LOG_MSG_1(CrateDropped,_entryName);