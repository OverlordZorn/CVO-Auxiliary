/*
    Author: CVO - Mr. Zorn
    [Description]
		Spawns the Actual crate with the required content.

	Public: No
*/

// Defines the Params

diag_log format ['[CVO](debug)(fn_spawnCSC) _this: %1', _this];

params ["_target", "_player", "_actionParams"]; //Default parameter given through the interaction framework
_actionParams params ["_className", "_spawnLoc", "_title", "_itemArray", "_backbackArray"];

diag_log (format ["[CVO][CSC](spawnCSC) New Request %1", _actionParams]);

private _spawnPos = switch (true) do {
	case (_spawnLoc isEqualTo "REL"):     { _target getRelPos [((_target call BIS_fnc_boundingBoxDimensions)#0 / 2) + 3 ,180] };
	case (_spawnLoc isEqualType objNull): { getPosATL _spawnLoc };
	case (_spawnLoc isEqualType []): 	  { _spawnLoc };
	default { [0,0,0] };
};

_spawnPos set [2,_spawnPos#2 + 1];

diag_log (format ["[CVO][CSC](spawnCSC) Established spawnPos: %1", _spawnPos]);

diag_log ("[CVO][CSC](spawnCSC) - " + _title + " - Start");

// spawn the desired box at the desired location.
private _box = createVehicle [_className, _spawnPos,[],2,"CAN_COLLIDE"]; 		
diag_log ("[CVO][CSC](spawnCSC) - " + _title + " - Box Created");


// set the custom name for Ace Cargo
_box setVariable ["ace_cargo_customname", _title, true];


// Empties the inventory of the Box
clearBackpackCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearWeaponCargoGlobal _box;
clearItemCargoGlobal _box;
diag_log ("[CVO][CSC](spawnCSC) - " + _title + " - Cleared Default Inventory");


// Fills the Box with anything in the array that isnt a backpack
{
	_box addItemCargoGlobal [_x # 0, _x # 1]
} forEach _itemArray;


// Fills the Box with with backpacks
{
	_box addBackpackCargoGlobal [_x # 0, _x # 1]
} forEach _backbackArray;

["cvo_csc_Event_crateSpawnedServer", [_box, _title] ] call CBA_fnc_ServerEvent;

diag_log ("[CVO][CSC](spawnCSC) - " + _title + " - Added Custom Inventory");
diag_log ("[CVO][CSC](spawnCSC) - " + _title + " - Spawning Complete");
