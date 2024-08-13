/* 
 * Author: Zorn
 *
 * Arguments:
 * 
 * Return Value:
 * None
 *
 * Examples:
 *  
 * 	[
 * 		ourSupplyTruck, 
 * 		"Monkey Ammo Package",
 * 		[
 
 * 		]
 * 	] call CVO_CSC_fnc_addCSC;
 * 	
 * 	[
 * 		"ACM_APD_Unimog", 
 * 		"CBRN Package", 
 * 		[
 * 			["U_C_CBRN_Suit_01_Blue_F",6],
 * 			["G_RegulatorMask_F",6]
 * 		],
 * 		"LandWoodenBox_F",
 * 		objNull,
 * 		[
 * 			["B_SCBA_01_F",6]
 * 		],

 * 	] call CVO_CSC_fnc_addCSC;
 * 	
 * 	
 * 	
 * Effect: Local - make sure its called on each client.
 * Public: yes
 *
 *
*/

params [
	["_spawner", 		objNull, 			[objNull, ""] 				],
	["_name", 			"defaultName", 		["String"] 					],
	["_className",		"Land_WoodenBox_F", ["String"] 					],
	["_hashMap",		createHashMap,		[createHashMap] 			],
	["_spawnloc", 		"REL", 				["",objNull,[]],	[2,3] 	]
];


// Create Parent Node (if needed)
[_spawner] call CVO_CSC_fnc_createNode;

private _actionname = ["CVO","CSC","Utility",_name] joinString "_";
private _actionstring = _name;
