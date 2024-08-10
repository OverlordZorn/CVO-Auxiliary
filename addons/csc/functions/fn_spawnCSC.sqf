/*
    Author: CVO - Mr. Zorn
    [Description]
		Spawns the Actual crate with the required content.

	Public: No
*/

// Defines the Params
params ["_target", "_player", "_actionParams"]; //Default parameter given through the interaction framework
_actionParams params ["_BoxType", "_spawnLoc", "_name", "_itemArray", "_backbackArray"];

diag_log (format ["[CVO][CSC](spawnCSC) New Request %1", _actionParams]);

diag_log format ['[CVO](debug)(fn_spawnCSC) _boxType: %1 - _spawnLoc: %2 - _name: %3 - _itemArray: %4 - _backbackArray: %5', _boxType , _spawnLoc ,_name , _itemArray , _backbackArray];

private _spawnPos = switch (true) do {
	case (_spawnLoc isEqualTo "REL"): 		{
			
			_target getRelPos [((_target call BIS_fnc_boundingBoxDimensions)#0 / 2) + 3 ,180]
		};
	case (_spawnLoc isEqualType objNull): 	{ getPosATL _spawnLoc };
	case (_spawnLoc isEqualType []): 		{ _spawnLoc };
	default { [0,0,0] };
};

_spawnPos set [2,_spawnPos#2 + 1];

diag_log (format ["[CVO][CSC](spawnCSC) Established spawnPos: %1", _spawnPos]);

diag_log ("[CVO][CSC](spawnCSC) - " + _name + " - Start");

// spawn the desired box at the desired location.
_box = createVehicle [_BoxType, _spawnPos,[],2,"CAN_COLLIDE"]; 		
diag_log ("[CVO][CSC](spawnCSC) - " + _name + " - Box Created");


// set the custom name for Ace Cargo
_box setVariable ["ace_cargo_customname", _name, true];


// Empties the inventory of the Box
clearBackpackCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearWeaponCargoGlobal _box;
clearItemCargoGlobal _box;
diag_log ("[CVO][CSC](spawnCSC) - " + _name + " - Cleared Default Inventory");


// Fills the Box with anything in the array that isnt a backpack
{
	_box addItemCargoGlobal [_x # 0, _x # 1]
} forEach _itemArray;


// Fills the Box with with backpacks
{
	_box addBackpackCargoGlobal [_x # 0, _x # 1]
} forEach _backbackArray;

diag_log ("[CVO][CSC](spawnCSC) - " + _name + " - Added Custom Inventory");
diag_log ("[CVO][CSC](spawnCSC) - " + _name + " - Spawning Complete");
