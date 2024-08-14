/* 
 * Author: Zorn
 *
 * Arguments:
 0	_spawner		OBJECT or CLASSNAME		- which will be the source for the CSC
 1	_title			STRING					- Title of the Interaction and Name of the Crate
 2	_className		CLASSNAME				- Classname of the CSC
 3	_hashMap		HASHMAP					- details below
 4	_spawnLoc		STRING, OBJECT or POS	- Controls where the CSC will be spawned.
		"REL"	- Spawns the CSC relative to the spawner source (for example, behind an ammotruck)
		OBJECT	- Spawns the CSC at the pos of the OBJ, for example a tarp or invisible Helipad
		POS		- Spawns the CSC at the provided 2D/3D position 

 * Supported Hashmap entries:
		KEY						typeName	Default			Definition
	"ace_medical_facility"		BOOL		false			defines the CSC_Utility Object as a ACE Medical Facility
	
	"ace_repair_facility"		BOOL		false			defines the CSC_Utility Object as a ACE Repair Facility
	"ace_repair_vehicle"		BOOL		false			defines the CSC_Utility Object as a ACE Repair vehicle

	"ace_rearm_source"			BOOL		false			defines the CSC_Utility Object as a ACE Rearm Source
	"ace_rearm_source_value"	NUMBER  	200				defines the Supply Count for the ACE Rearm Source

	"ace_refuel_source"			BOOL		false			defines the CSC_Utility Object as a ACE Refuel Source
	"ace_refuel_source_value"	NUMBER  	200				defines the Supply Count for the ACE Refuel Source
	"ace_refuel_nozzlePos"		3DPOS		[0,0,0]			defines the relative 3D position of the fuelnozzle

 * Return Value:
 * None
 *
 * Examples:
 *  
 * 	[] call CVO_CSC_fnc_addCSC_utility;
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
	["_title", 			"Default Name", 	["String"] 					],
	["_className",		"Land_WoodenBox_F", ["String"] 					],
	["_hashMap",		createHashMap,		[createHashMap] 			],
	["_spawnLoc", 		"REL", 				["",objNull,[]],	[2,3] 	]
];


// Create Parent Node (if needed)
[_spawner] call CVO_CSC_fnc_createNode;


// Prep
private _actionID = ["CVO","CSC","Utility",_title] joinString "_";
private _EH_ID = ["CVO","CSC","Utility",_spawner,_title] joinString "_";


// Create Action
private _action = [
	_actionID,														// Action Name
	_title,															// Name for the ACE Interaction Menu 
	"\A3\ui_f\data\igui\cfg\simpleTasks\types\box_ca.paa",			// Custom Icon 
	{_this#2 call CBA_fnc_serverEvent},								// Statement
	{true},															// Condition
	{},
	[_EH_ID,[_title,_className,_hashMap,_spawnLoc]]
] call ace_interact_menu_fnc_createAction;

// Attach Action

switch (typeName _spawner) do {
	case "OBJECT": { [_spawner, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject; };
	case "STRING": { [_spawner, 0, ["ACE_MainActions"],	_action ] call ace_interact_menu_fnc_addActionToClass;  };
};


// Register EventHandler
[_EH_ID, { _this call CVO_CSC_fnc_spawnCSC_utility }] call CBA_fnc_addEventHandler;