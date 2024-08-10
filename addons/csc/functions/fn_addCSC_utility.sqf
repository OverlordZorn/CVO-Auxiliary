/* 
 * Author: Zorn
 * Creates an ACE INTERACTION on the Target to request an Utility Crate that adds fills it with a custom Array.
 *
 * Arguments:
 * 0: Target supplySpawner, where the ace action should be added <OBJECT> or <CLASS as STRING>
 * 1: Name of the supplyCrateAction <string>
 * 2: hashmap with parameters. more details below.
 * 3: Class of Crate to be used <OBJECT> <Optional - Default: "LandWoodenBox_F">
 * 4: Hashmap of Custom Parameters, for example, rearm supply values, Example: `createHashMapFromArray [ ["rearm_value", 1000] ]`
 * 5: Spawn Location - ideally a invisible helipad or Tarp_01_Large_Black_F <Object> <optional - default: objNull>
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
	["_array",			[] 												],
	["_BoxType",		"Land_WoodenBox_F", ["String"] 					],
	["_backpacks", 		[]												],
	["_spawnloc", 		"REL", 				["",objNull,[]],	[2,3] 	]
];