/*
    Author: CVO - Mr. Zorn
    [Description]
		Spawns the Actual crate with the required content.

	Public: No
*/

// Defines the Params

params ["_target", "_player", "_className", "_spawnLoc", "_title", "_itemArray", "_backbackArray", "_hashMap"];


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





// // Optional Parameters for Ace Cargo/Drag/Carry

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

diag_log format ['[CVO](debug)(fn_spawnCSC) %" - Requested by %2', _title , _player];