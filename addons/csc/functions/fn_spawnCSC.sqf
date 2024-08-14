/*
    Author: CVO - Mr. Zorn
    [Description]
		Spawns the Actual crate with the required content.

	Public: No
*/

// Defines the Params

params ["_target", "_player", "_className", "_spawnLoc", "_title", "_itemArray", "_backbackArray"];


private _spawnPos = switch (true) do {
	case (_spawnLoc isEqualTo "REL"):     { _target getRelPos [((_target call BIS_fnc_boundingBoxDimensions)#0 / 2) + 3 ,180] };
	case (_spawnLoc isEqualType objNull): { getPosATL _spawnLoc };
	case (_spawnLoc isEqualType []): 	  { _spawnLoc };
	default { [0,0,0] };
};

_spawnPos set [2,_spawnPos#2 + 1];

// spawn the desired box at the desired location.
private _box = createVehicle [_className, _spawnPos,[],2,"CAN_COLLIDE"]; 		

// set the custom name for Ace Cargo
_box setVariable ["ace_cargo_customname", _title, true];


// Empties the inventory of the Box
clearBackpackCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearWeaponCargoGlobal _box;
clearItemCargoGlobal _box;

// Fills the Box with anything in the array that isnt a backpack
{
	_box addItemCargoGlobal [_x # 0, _x # 1]
} forEach _itemArray;


// Fills the Box with with backpacks
{
	_box addBackpackCargoGlobal [_x # 0, _x # 1]
} forEach _backbackArray;

["cvo_csc_Event_crateSpawnedServer", [_box, _title] ] call CBA_fnc_ServerEvent;

diag_log format ['[CVO](debug)(fn_spawnCSC) %" - Requested by %2', _title , _player];