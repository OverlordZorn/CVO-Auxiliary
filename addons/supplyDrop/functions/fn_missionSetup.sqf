#include "../script_component.hpp"

/*
* Author: Zorn
* This is purely an example
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* ['something', player] call cvo_fnc_sth
*
* Public: Yes
*/

// For testing purpose
// ["Test"] call zrn_supplydrop_fnc_register;


[
    "ACE Medical Box",                                                   // Name
    [
        ["ace_banana", 69],
        ["ace_suture", 69],
        ["ACE_painkillers", 69]
    ],                                                                       // Array of Items to be filled into - Default: [] 
    [
        // ["somebackpackclassname", 420]
    ],                                                                       // Array of Backpacks to be filled into - Default: []
    createHashMapFromArray [
        ["pos_start",       [10,10,10]],
        ["emptyBox",        false],
        ["targetMode",      "MAPCLICK"],
        ["class_box",       "ACE_medicalSupplyCrate_advanced"],
        ["class_air",       "B_T_VTOL_01_vehicle_F"]
    ]                                                                        // Hashmap of additional parameters that can be changed optionally
] call cvo_supplyDrop_fnc_register;

[
    "Ammo Supply Box",                                                   // Name
    [
        ["ace_banana", 69],
        ["ace_suture", 69],
        ["ACE_painkillers", 69]
    ],                                                                       // Array of Items to be filled into - Default: [] 
    [
        // ["somebackpackclassname", 420]
    ],                                                                       // Array of Backpacks to be filled into - Default: []
    createHashMapFromArray [
        ["pos_start",       [10,10,10]],
        ["emptyBox",        true],
        ["targetMode",      "MAPCLICK"],
        //["class_box",       "ACE_medicalSupplyCrate_advanced"],
        ["class_air",       "B_T_VTOL_01_vehicle_F"]
    ]                                                                        // Hashmap of additional parameters that can be changed optionally
] call cvo_supplyDrop_fnc_register;

/*
list of all possible additional parameter

createHashMapFromArray [

    ["Name",            ""],
    ["pos_start",       [0,0,0]],

    ["targetMode",      "MAPCLICK"],

    ["pos_end",         "RETURN"],

    ["drop_alt",        100],
    ["drop_alt_forced", true],

    ["items",           ""],
    ["backpacks",       _backpacks],

    ["class_box",       "C_supplyCrate_F"],
    ["class_air",       "C_Heli_Light_01_civil_F"],
    ["class_para",      "B_Parachute_02_F"],

    ["side",            CIVILIAN],

    ["isProtected",     false],
    ["emptyBox",        true],
    ["attachStrobe",    false],
    ["class_strobe",    "ACE_IR_Strobe_Effect"],

    ["attachSmoke",     true],
    ["class_smoke",     "SmokeShellOrange"] // CfgMagazines
];
*/