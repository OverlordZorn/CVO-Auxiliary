#include "../script_component.hpp"

/*
Script Runs when the players open the arsenal.
1.
If the player opens the arsenal for the first time,
it creates the cvo_arsenal_local_box box and updates the content of said arsenal.
If the player opened it before and the cvo_arsenal_local_box exists already, it will 
*/

if (isNull cvo_arsenal_local_box) then { cvo_arsenal_local_box = nil;};

if (isNil "cvo_arsenal_local_box") then {

	// Creates Virtual Arsenal box for the player locally if none has been existing before

	cvo_arsenal_local_box = createVehicleLocal ["B_supplyCrate_F", [0,0,0], [], 0, "CAN_COLLIDE"];

	player setVariable ["cvo_arsenal", cvo_arsenal_local_box, false];

	[cvo_arsenal_local_box, false] 				call ace_dragging_fnc_setDraggable;			// Disables Dragging
	[cvo_arsenal_local_box, false] 				call ace_dragging_fnc_setCarryable;			// Disables Carrying
	[cvo_arsenal_local_box, -1] 					call ace_cargo_fnc_setSize;					// Disables Ace Cargo Loading
	cvo_arsenal_local_box setVariable ["ace_cargo_noRename", true];							// Disables Ace Cargo Renaming

	//	hideObject cvo_arsenal_local_box;															// Hides the Object

	clearBackpackCargo cvo_arsenal_local_box;													// Empties the ArsenalBox
	clearMagazineCargo cvo_arsenal_local_box;
	clearWeaponCargo cvo_arsenal_local_box;
	clearItemCargo cvo_arsenal_local_box;

	cvo_arsenal_local_box enableSimulation false;												// Disables Simulation


	[cvo_arsenal_local_box, false, false] call ace_arsenal_fnc_initBox;

} else {

	// Removes current content	
	[cvo_arsenal_local_box, true, false] call ace_arsenal_fnc_removeVirtualItems;

};

// Retrieving the updated Arsenal List
_updatedArray = [] call cvo_arsenal_fnc_update;


[cvo_arsenal_local_box, _updatedArray, false] call ace_arsenal_fnc_addVirtualItems;

// Opens the Arsenal remotely for the players
[cvo_arsenal_local_box, player, false] call ace_arsenal_fnc_openBox;