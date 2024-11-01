#include "../../script_component.hpp"
/*
    Author: CVO - Mr. Zorn
    [Description]
		Spawns the Actual crate with the required content.

	Public: No
*/

// Defines the Params

params ["_target", "", "", "_spawnLoc", "", "", "", ""];

private _boxSize = (boundingBox _box select 2);
private _tgtSize = _target call BIS_fnc_boundingBoxDimensions;

private _spawnPos = switch (true) do {
	case (_spawnLoc isEqualTo "REL"):     { _target getRelPos [ ( ( _target call BIS_fnc_boundingBoxDimensions ) #0 / 2 ) + 3 + _boxSize,180 ] };
	case (_spawnLoc isEqualType objNull): { getPosATL _spawnLoc };
	case (_spawnLoc isEqualType []): 	  { _spawnLoc };
	default { [0,0,0] };
};
// this is stupid but oh well...
_spawnPos set [2,_spawnPos#2 + _tgtSize#2 * 0.8 ];

// Move box to desired position
_box setVehiclePosition [_spawnPos, [], _boxSize * 1.5, "CAN_COLLIDE"];




