/*
    Author: CVO - Mr. Zorn
    [Description]
		Spawns the Actual crate with the required utility.

	Public: No
*/

// Defines the Params
params ["_target", "_player", "_actionParams"]; //Default parameter given through the interaction framework
_actionParams params ["_title","_className","_hashMap","_spawnLoc"];

diag_log (format ["[CVO][CSC](spawnCSC) New Request %1", _actionParams]);

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

// ACE Repair Vehicle
if (_hashMap getOrDefault ["ace_repair_vehicle", false]) then {
    _box setVariable ["ace_repair_canRepair", true, true];  
};

// ACE Repair Facility
if (_hashMap getOrDefault ["ace_repair_facility", false]) then {
    _box setVariable ["ace_isRepairFacility", true, true];  
};

// ACE Rearm Source
if (_hashMap getOrDefault ["ace_rearm_source", false]) then {
    [
        _box,
        _hashMap getOrDefault ["ace_rearm_source_value", 200]
    ] call ace_rearm_fnc_makeSource;
};

// ACE Refuel Source
if (_hashMap getOrDefault ["ace_refuel_source", false]) then {
    [
        _box,
        _hashMap getOrDefault ["ace_refuel_source_value", 200],
        _hashMap getOrDefault ["ace_refuel_source_nozzlePos", [0,0,0]],
    ] call ace_refuel_fnc_makeSource;
};

["cvo_csc_Event_crateSpawnedServer", [_box, _title] ] call CBA_fnc_ServerEvent;

diag_log ("[CVO][CSC](spawnCSC_utility) - " + _title + " - Done");