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
        ["airdrop_pos_start",   [10000,10000,1000]],
        ["box_empty",           true],
        ["box_class",           "ACE_medicalSupplyCrate_advanced"],
        ["airframe_class",      "B_T_VTOL_01_vehicle_F"],
        ["normal_mode",         "AIRDROP"],
        ["airdrop_targetMode",  "TARGET"]
        


    ]                                                                        // Hashmap of additional parameters that can be changed optionally
] call cvo_csc_fnc_register;

["B_Slingload_01_Ammo_F", "ACE Medical Box"] call cvo_csc_fnc_link;
[source, "ACE Medical Box"] call cvo_csc_fnc_link;