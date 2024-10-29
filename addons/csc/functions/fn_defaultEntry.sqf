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
* Public: No
*/

// If there are any parameters provided, consider it the user trying to update the default entry.
// If there are no paramters provided, simply return the hardcoded default entry.

if (_this isEqualTo []) then {

    private _defaultEntry = createHashMapFromArray [
        ["Name", "Default Entry"],

        ["links", []],

        ["items", []],
        ["backpacks", []],

        ["box_class", "C_supplyCrate_F"],
        ["box_empty", true],

        ["pos_spawn", [0,0,0]],

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


        ["airdrop_enabled", true],
        ["airdrop_targetMode", "MAPCLICK"],

        ["airframe_class", "C_Heli_Light_01_civil_F"],
        ["airframe_side", civilian],
        ["airframe_protected", true],

        ["airdrop_pos_start", [0,0,0]],
        ["airdrop_pos_end", "RETURN"],

        ["airdrop_alt", 100],
        ["airdrop_alt_forced", true],

        ["airdrop_attachSmoke", true],
        ["airdrop_class_smoke", "SmokeShellOrange"], // CfgMagazines  

        ["parachute_class", "B_Parachute_02_F"],
        ["parachute_attachStrobe", false],
        ["parachute_strobe_class", "ACE_IR_Strobe_Effect"]
    ];

    _defaultEntry

} else {

    params [
        ["_catalogName",        "global",   [""]            ],
        ["_newDefaults",        "404",      [createHashMap] ]
    ];

    if (_newDefaults isEqualTo "404") exitWith {};

    private _catalog = [_catalogName] call FUNC(catalog);
    private _previousDefaults = _catalog get "Default Entry";
    _previousDefaults merge [_newDefaults, true];
};