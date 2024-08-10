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
 * 
 * Return Value:
 * None
 *
 * Examples:
 *  
 * 	[
 * 		ourSupplyTruck, 
 * 		"Monkey Care Package",
 * 		[
 * 			["Ace_banana", 100],
 * 			["ace_maptools",100]
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

// ########## Creates the CSC Parent Ace Interaction Node ##########
// ### Creates an Array to store all already existing "Menu Nodes" when the Array doesnt exist yet.
private _nodeArray = missionNamespace getVariable ["CVO_CSC_NodeArray", []];

// ### Creates CSC Menu Node if the _spawner does not carries a CSC Menu Node yet.
if (!(_spawner in _nodeArray)) then {
	private _root = [
		"cvo_csc_root",													// Action Name
		"Take Custom Supply Crates",									// Name for the ACE Interaction Menu
		"\A3\ui_f\data\igui\cfg\simpleTasks\types\box_ca.paa",																// Custom Icon 
		{},																// Statement
		{true}															// Condition
	] call ace_interact_menu_fnc_createAction;

	if (_spawner isEqualType objNull) then {
		_test = [
			_spawner,										// Object the action should be assigned to
			0,												// Type of action, 0 for action, 1 for self-actionIDs
			["ACE_MainActions"],							// Parent path of the new action <Array>
			_root
		] call ace_interact_menu_fnc_addActionToObject;

	} else {

		_test = [
			_spawner,										// Class(string) the action should be assigned to
			0,												// Type of action, 0 for action, 1 for self-actionIDs
			["ACE_MainActions"],							// Parent path of the new action <Array>
			_root
		] call ace_interact_menu_fnc_addActionToClass;		
	};

	_nodeArray pushBack _spawner;
};
missionNamespace setVariable ["CVO_CSC_NodeArray", _nodeArray];
// ########## Creates the individual CSC ACE Interaction ##########

// ### Adapts Names for the Ace action
private _actionname = ("CVO_spawnbox_" + str _name);
private _actionstring = (           "" + str _name);


// ## Creating the ACTION itself. should be universal for OBJ and Class
private _action = [
	_actionname,													// Action Name
	_actionstring,													// Name for the ACE Interaction Menu 
	"\A3\ui_f\data\igui\cfg\simpleTasks\types\box_ca.paa",																// Custom Icon 
	{_this call CVO_CSC_fnc_spawnCSC},								// Statement
	{true},															// Condition
	{},
	[_BoxType, _spawnloc, _name, _array, _backpacks]
] call ace_interact_menu_fnc_createAction;


// ## ATTACHING THE ACTION to class OR OBJECT

if (typeName _spawner isEqualTo "OBJECT") then {

	// TO OBJECT
	[
		_spawner,										// Class the action should be assigned to
		0,												// Type of action, 0 for action, 1 for self-actionIDs
		["ACE_MainActions","cvo_csc_root"],							// Parent path of the new action <Array>
		_action
	] call ace_interact_menu_fnc_addActionToObject;		// Alternative: ace_interact_menu_fnc_addActionToClass

} else {
 		
	// TO CLASS
	[
		_spawner,										// Class the action should be assigned to
		0,												// Type of action, 0 for action, 1 for self-actionIDs
		["ACE_MainActions","cvo_csc_root"],				// Parent path of the new action <Array>
		_action
	] call ace_interact_menu_fnc_addActionToClass;		

};
diag_log format ["[CVO][CSC] New CSC Established Sucessfully => Carrier: %1 - CSC: %2", _spawner, _name];