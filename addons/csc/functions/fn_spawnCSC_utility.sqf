/*
    Author: CVO - Mr. Zorn
    [Description]
		Spawns the Actual crate with the required utility.

	Public: No
*/

params ["_target","_title","_className","_hashMap","_spawnLoc"];

private _spawnPos = switch (true) do {
	case (_spawnLoc isEqualTo "REL"):     { _target getRelPos [((_target call BIS_fnc_boundingBoxDimensions)#0 / 2) + 3 ,180] };
	case (_spawnLoc isEqualType objNull): { getPosATL _spawnLoc };
	case (_spawnLoc isEqualType []): 	  { _spawnLoc };
	default { [0,0,0] };
};

_spawnPos set [2,_spawnPos#2 + 1];

private _box = createVehicle [_className, _spawnPos,[],2,"CAN_COLLIDE"]; 		

// set the custom name for Ace Cargo
_box setVariable ["ace_cargo_customname", _title, true];

// Empties the inventory of the Box
clearBackpackCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearWeaponCargoGlobal _box;
clearItemCargoGlobal _box;

// ACE Medical Facility
if (_hashMap getOrDefault ["ace_medical_facility", false]) then { 
    _box setVariable ["ace_medical_isMedicalFacility", true, true];  
};

// ACE Medical vehicle
if (_hashMap getOrDefault ["ace_medical_vehicle", false]) then {
    _box setVariable ["ace_medical_isMedicalVehicle", true, true];  
};

// ACE Repair Facility
if (_hashMap getOrDefault ["ace_repair_facility", false]) then {
    _box setVariable ["ace_isRepairFacility", true, true];  
};

// ACE Repair Vehicle
if (_hashMap getOrDefault ["ace_repair_vehicle", false]) then {
    _box setVariable ["ace_repair_canRepair", true, true];  
};

// ACE Rearm Source
if (_hashMap getOrDefault ["ace_rearm_source", false]) then {
    [
        _box,
        _hashMap getOrDefault ["ace_rearm_source_value", 50]
    ] call ace_rearm_fnc_makeSource;
};

// ACE Refuel Source
if (_hashMap getOrDefault ["ace_refuel_source", false]) then {
    [
        _box,
        _hashMap getOrDefault ["ace_refuel_source_value", 50],
        _hashMap getOrDefault ["ace_refuel_source_nozzlePos", [0,0,0]]
    ] call ace_refuel_fnc_makeSource;
};

// ACE Cargo SetSize (how big is the crate itself)
if (_hashMap getOrDefault ["ace_cargo_setSize", "404"] isEqualType 0) then {
    [_box, _hashMap get "ace_cargo_setSize"] call ace_cargo_fnc_setSize;
};


// ACE Cargo SetSpace (how much can you put INSIDE the crate)
[_box, _hashMap getOrDefault ["ace_cargo_setSpace", 0]] call ace_cargo_fnc_setSpace;

// ACE Drag
[
    _box,
    _hashMap getOrDefault ["ace_drag_canCarry", true],
    _hashMap getOrDefault ["ace_drag_relPOS", [0,1.5,0]],
    _hashMap getOrDefault ["ace_drag_dir", 0],
    _hashMap getOrDefault ["ace_drag_ignoreWeight", true]
] call ace_dragging_fnc_setDraggable;

// ACE Carry
[
    _box,
    _hashMap getOrDefault ["ace_carry_canCarry", true],
    _hashMap getOrDefault ["ace_carry_relPOS", [0,1,1]],
    _hashMap getOrDefault ["ace_carry_dir", 0],
    _hashMap getOrDefault ["ace_carry_ignoreWeight", false]
] call ace_dragging_fnc_setCarryable;

["cvo_csc_Event_crateSpawnedServer", [_box, _title] ] call CBA_fnc_ServerEvent;
diag_log format ['[CVO](debug)(fn_spawnCSC_utility) Created: %1 Requested by %2', _title , _player];