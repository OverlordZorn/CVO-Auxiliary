#include "../script_component.hpp"

/*
* Author: Zorn
* Function to return the default entry for a newly generated catalog
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* ['something', player] call prefix_component_fnc_functionname
*
* Public: Yes
*/

// If there are any parameters provided, consider it the user trying to update the default entry.
// If there are no paramters provided, simply return the hardcoded default entry.

if (_this isEqualTo []) then {

    private _defaultEntry = createHashMapFromArray [
        ["Name", "Default Entry"],

        ["links", [[],[]]],     // [Array of Classnames, Array of Objects]

        ["items", []],
        ["backpacks", []],

        ["zeus_enabled", true],

        //// Modes
        // "AIRDROP" will start the airdrop feature. Target Pos will be defined through "airdrop_targetMode"/"airdrop_targetMode_zeus"
        // "POS" will take spawn_pos [2/3D or Object] and spawn the crate on that position
        // "REL" will spawn the crate relative to its size behind the provided object

        ["zeus_mode", "AIRDROP"],
        ["normal_mode", "REL"], 

        ["box_class", "C_supplyCrate_F"],
        ["box_empty", true],

        ["spawn_pos", [0,0,0]],     // can be fixed position[pos2d/3d] or object (helipad, tarp, sth like that) or "REL" which will put the box relative behind the source object

        ["ace_medical_facility", false],
        ["ace_medical_vehicle", false],

        ["ace_repair_facility", false],
        ["ace_repair_vehicle", false],

        ["ace_rearm_source", false],
        ["ace_rearm_source_value", 50],

        ["ace_refuel_source", false],
        ["ace_refuel_source_value", 50],
        ["ace_refuel_source_nozzlePos", [0,0,0]],

        ["ace_drag_canDrag", true],
        ["ace_drag_relPOS", [0,1.5,0]],
        ["ace_drag_dir", 0],
        ["ace_drag_ignoreWeight", true],

        ["ace_carry_canCarry", true],
        ["ace_carry_relPOS", [0,1,1]],
        ["ace_carry_dir", 0],
        ["ace_carry_ignoreWeight", false],


        ["ace_cargo_setSpace", 0],
        ["ace_cargo_setSize", "DEFAULT"],


        ["ace_cargo_add_spareWheels", 0],
        ["ace_cargo_add_jerrycans", 0],
        ["ace_cargo_add_tracks", 0],

        ["airdrop_targetMode", "MAPCLICK"],
        //["airdrop_deliveryMode", "PARACHUTE"], // Currently not in use

        ["airdrop_targetMode_zeus", "MAPCLICK"],

        ["airframe_side", civilian],
        ["airframe_protected", true],
        ["airframe_class", "C_Heli_Light_01_civil_F"],

        ["airdrop_pos_start", [0,0,0]],
        ["airdrop_pos_end", "RETURN"],

        ["airdrop_alt", 100],
        ["airdrop_alt_forced", true],

        ["airdrop_flyInHeightASL", [35,35,35]],

        ["airdrop_attachSmoke", true],
        ["airdrop_class_smoke", "SmokeShellOrange"], // CfgMagazines  

        ["parachute_class", "B_Parachute_02_F"],

        ["parachute_attachStrobe", true],
        ["parachute_strobe_class", "ACE_IR_Strobe_Effect"]
    ];

    _defaultEntry

} else {

    params [
        ["_newDefaults",        "404",      [createHashMap] ],
        ["_catalogName",        "global",   [""]            ]
    ];

    if (_newDefaults isEqualTo "404") exitWith {};

    private _catalog = [_catalogName] call FUNC(catalog);
    private _previousDefaults = _catalog get "Default Entry";
    _previousDefaults merge [_newDefaults, true];
};
