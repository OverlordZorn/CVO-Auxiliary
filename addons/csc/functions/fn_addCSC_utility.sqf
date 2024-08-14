/* 
 * Author: Zorn
 *
 * Arguments:
 0	_target		OBJECT or CLASSNAME		- which will be the source for the CSC
 1	_title			STRING					- Title of the Interaction and Name of the Crate
 2	_className		CLASSNAME				- Classname of the CSC
 3	_hashMap		HASHMAP					- details below
 4	_spawnLoc		STRING, OBJECT or POS	- Controls where the CSC will be spawned.
		"REL"	- Spawns the CSC relative to the spawner source (for example, behind an ammotruck)
		OBJECT	- Spawns the CSC at the pos of the OBJ, for example a tarp or invisible Helipad
		POS		- Spawns the CSC at the provided 2D/3D position 

 * Supported Hashmap entries:
	KEY							Default		Definition

createHashMapFromArray [
	["ace_medical_facility",	false	],	// defines the CSC_Utility Object as a ACE Medical Facility
	["ace_medical_vehicle",		false	],	// defines the CSC_Utility Object as a ACE Medical Vehicle
	
	["ace_repair_facility",		false	],	// defines the CSC_Utility Object as a ACE Repair Facility
	["ace_repair_vehicle",		false	],	// defines the CSC_Utility Object as a ACE Repair vehicle

	["ace_rearm_source",		false	],	// defines the CSC_Utility Object as a ACE Rearm Source
	["ace_rearm_source_value",	200		],	// defines the Supply Count for the ACE Rearm Source

	["ace_refuel_source",		false	],	// defines the CSC_Utility Object as a ACE Refuel Source
	["ace_refuel_source_value",	200		],	// defines the Supply Count for the ACE Refuel Source
	["ace_refuel_nozzlePos",	[0,0,0]	],	// defines the relative 3D position of the fuelnozzle

	["ace_refuel_cargo_setSize", "404"	],	// defines the Size of the Box itself regarding ACE Cargo
	["ace_refuel_cargo_setSpace",0   	],	// defines the Space of the Box regarding being able to load other things inside of it

	["ace_drag_canCarry",		true	],	// see ace framework wiki
	["ace_drag_relPos",		   [0,1.5,0]],	
	["ace_drag_dir", 			0		],  
	["ace_drag_ignoreWeight", 	true	],

	["ace_carry_canCarry",		true	],	
	["ace_carry_relPos",		[0,1,1] ],	
	["ace_carry_dir", 			0		],  
	["ace_carry_ignoreWeight", 	true	]
]

 * Return Value:
 * None
 *
 * Examples:
 *  

[
	cursorObject,
	"Monkey Utility Package",
	createHashMapFromArray [
		["ace_medical_facility", true],

		["ace_repair_facility", true],
		["ace_repair_vehicle", true],

		["ace_rearm_source", true],
		["ace_rearm_source_value", 200],

	]



] call CVO_CSC_fnc_addCSC_utility;


 * 	
 * 	
 * Effect: Local - make sure its called on each client.
 * Public: yes
 *
 *
*/

params [
	["_target", 		objNull, 			[objNull, ""] 				],
	["_title", 			"Default Name", 	["String"] 					],
	["_hashMap",		createHashMap,		[createHashMap] 			],
	["_className",		"Land_WoodenBox_F", ["String"] 					],
	["_spawnLoc", 		"REL", 				["",objNull,[]],	[2,3] 	]
];


// Create Parent Node (if needed)
[_target] call CVO_CSC_fnc_createNode;


// Prep
private _actionID = ["CVO","CSC","Utility",_title] joinString "_";
private _EH_ID = ["CVO","CSC","Utility",_target,_title] joinString "_";


// ## create aceActionArray
private _action = [
	_actionID,
	_title,
	"\A3\ui_f\data\igui\cfg\simpleTasks\types\box_ca.paa",
	{
		params ["_target", "_player", "_actionParams"];
		_actionParams params ["_EH_ID", "_title", "_className", "_hashMap", "_spawnLoc"];
		[_EH_ID, [_target,_title,_className,_hashMap,_spawnLoc] ] call CBA_fnc_serverEvent;
	},
	{true},
	{},
	[_EH_ID,_title,_className,_hashMap,_spawnLoc]
] call ace_interact_menu_fnc_createAction;


// Attach Action
switch (typeName _target) do {
	case "OBJECT": { [_target, 0, ["ACE_MainActions", "cvo_csc_root"], _action ] call ace_interact_menu_fnc_addActionToObject; };
	case "STRING": { [_target, 0, ["ACE_MainActions", "cvo_csc_root"],	_action ] call ace_interact_menu_fnc_addActionToClass;  };
};


// Register EventHandler
[_EH_ID, { _this call CVO_CSC_fnc_spawnCSC_utility }] call CBA_fnc_addEventHandler;

diag_log format ["[CVO](debug)(fn_addCSC_utility) Established: %2 => %1", _target, _title];