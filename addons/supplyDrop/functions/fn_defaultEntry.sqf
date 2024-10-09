#include "../script_component.hpp"

/*
* Author: Zorn
* Function to overwrite the Default Settings. This way, the user can avoid changing the parameters manually 
*
* Arguments:
*
* Return Value:
* returns the (updated) defaultentry
*
* Example:
* [] call zrn_supplyDrop_fnc_defaultEntry;
*
* Public: Yes
*/

params [
    ["_newDefaults",    "404", [createHashMap]]
];


private _entry = missionNamespace getVariable [QGVAR(default_entry), "404"];

if (_entry isEqualTo "404") then {
    _entry = createHashMapFromArray [

        ["Name",            ""],
        ["pos_start",       [0,0,0]],

        ["targetMode",      "MAPCLICK"],

        ["pos_target",      [0,0,0]],
        ["pos_end",         "RETURN"],

        ["drop_alt",        100],
        ["drop_alt_forced", true],

        ["items",           ""],
        ["backpacks",       ""],

        ["class_box",       "C_supplyCrate_F"],
        ["class_air",       "C_Heli_Light_01_civil_F"],
        ["class_para",      "B_Parachute_02_F"],

        ["side",            civilian],

        ["isProtected",     false],
        ["emptyBox",        true],
        ["attachStrobe",    false],
        ["class_strobe",    "ACE_IR_Strobe_Effect"],

        ["attachSmoke",     true],
        ["class_smoke",     "SmokeShellOrange"] // CfgMagazines
    ];
};

if (_newDefaults isNotEqualTo "404") then {
    _entry merge [_newDefaults, true];
    missionNamespace setVariable [QGVAR(default_entry), _entry];
};


_entry