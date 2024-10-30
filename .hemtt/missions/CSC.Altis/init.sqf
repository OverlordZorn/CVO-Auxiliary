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
// ["Test"] call cvo_supplydrop_fnc_register;

/*
params [
	["_entryName",  "Default",  	[""]            ],
	["_items",		[], 			[[]]            ],
	["_backpacks",	[],				[]	            ],
	["_hashMap",	"404",		    [createHashMap] ],
    ["_catName",    "global",       [""]            ]
];
*/



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
] call cvo_csc_fnc_register;

["ZEUS", "ACE Medical Box"] call cvo_csc_fnc_link;
/*
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
] call cvo_csc_fnc_register;
*/