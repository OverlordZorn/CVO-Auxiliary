#include "../script_component.hpp"

/* 
 * Author: Zorn
 * Creates an ACE INTERACTION on the Target to request an AmmoCrate and fills it with a custom Array.
 *
 * Arguments:
 * 0: Target supplySpawner, where the ace action should be added <OBJECT> or <CLASS as STRING>
 * 1: Name of the supplyCrateAction <string>
 * 2: Nested Array of content EXCEPT BACKPACKS [["class0", amount], ["classN",#]] <Nested Array>
 * 3: Class of Crate to be used <OBJECT> <Optional - Default: "LandWoodenBox_F">
 * 4: Nested Array of Content BACKPACKS Only [[class0, #], [classN,#]] <Nested Array > <optional - Default: []>
 * 5: Spawn Location - ideally a invisible helipad or Tarp_01_Large_Black_F <Object> <optional - default: objNull>
 * 6: HashMap - additional, optional parameters (see fn_spawnCSC)
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
	["_backbackArray",	[],					[]							],
	["_spawnloc", 		"REL", 				["",objNull,[]],	[2,3] 	],
	["_hashMap",		createHashMap,		[createHashMap]				]
];

// Create Parent Node (if needed)
[_target] call FUNC(createNode);

// Prep
private _actionID = ["CVO","CSC",_title splitString " " joinString "_"] joinString "_";
private _EH_ID = ["CVO","CSC",_title,_target] joinString "_";


// ## create aceActionArray
private _aceAction = [
	_actionID,
	_title,
	"\A3\ui_f\data\igui\cfg\simpleTasks\types\box_ca.paa",
	{
		params ["_target", "_player", "_actionParams"];
		_actionParams params ["_EH_ID", "_className", "_spawnloc", "_title", "_itemArray", "_backbackArray", "_hashMap"];
		[_EH_ID, [_target, _player, _className, _spawnLoc, _title, _itemArray, _backbackArray, _hashMap] ] call CBA_fnc_serverEvent;
	},
	{true},
	{},
	[_EH_ID, _className, _spawnloc, _title, _itemArray, _backbackArray, _hashMap]
] call ace_interact_menu_fnc_createAction;


// ## ATTACHING THE ACTION to class OR OBJECT
switch (typeName _target) do {
	case "OBJECT": { [_target, 0, ["ACE_MainActions", "cvo_csc_root"], _aceAction ] call ace_interact_menu_fnc_addActionToObject; };
	case "STRING": { [_target, 0, ["ACE_MainActions", "cvo_csc_root"],	_aceAction ] call ace_interact_menu_fnc_addActionToClass;  };
};


// Register EventHandler
[_EH_ID, FUNC(spawnCSC)] call CBA_fnc_addEventHandler;


diag_log format ["[CVO](debug)(fn_addCSC) Established: %2 => %1", _target, _title];