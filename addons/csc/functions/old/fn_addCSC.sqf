#include "../../script_component.hpp"

/* 
 * Author: Zorn
 * Function the keep Compatibility with old Scripts / Missions.
 *
 * DO NOT USE THIS ANYMORE - USE NEW REGISTER + LINK Function INSTEAD
 *
 * Arguments:
 * 
 * Return Value:
 * None
 *
 * Examples:
 *  

[
	cursorObject, 
	"Monkey Care Package",
	[
		["Ace_banana", 100],
		["ace_maptools",100]
	]
] call CVO_CSC_fnc_addCSC;

[
	"ACM_APD_Unimog", 
	"CBRN Package", 
	[
		["U_C_CBRN_Suit_01_Blue_F",6],
		["G_RegulatorMask_F",6]
	],
	"LandWoodenBox_F",
	objNull,
	[
		["B_SCBA_01_F",6]
	],
] call CVO_CSC_fnc_addCSC;

 * 	
 * 	
 * 	
 * Effect: Local - make sure its called on each client.
 * Public: yes
 *
 *
*/

params [
	["_target", 		objNull, 			[objNull, ""] 				],
	["_title", 			"Default Name", 	[""]	 	    			],
	["_itemArray",		[],					[[]]						],
	["_className",		"Land_WoodenBox_F", [""] 			    		],
	["_backpackArray",	[],					[]							],
	["_spawnloc", 		"REL", 				["",objNull,[]],	[2,3] 	],
	["_hashMap",		createHashMap,		[createHashMap]				]
];

private _mode = "REL";
private _pos = [0,0,0];

switch (true) do {
	case (_spawnloc isEqualTo "REL"): {  };
	default { _mode = "POS"; _pos = _spawnloc };
};

private _mergedHashMap = createHashMapFromArray [
	["box_class", _className],
	["spawn_pos", _pos],
	["normal_mode", _mode]
] merge [_hashMap, true];


[
	_title
	,_itemArray
	,_backpackArray
	,_mergedHashMap
] call cvo_csc_fnc_register;


[_target, _title] call cvo_csc_fnc_link;