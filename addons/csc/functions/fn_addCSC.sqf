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
 * 		cursorObject, 
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
	["_title", 			"Default Name", 	[""]	 	    			],
	["_array",			[],					[[]]						],
	["_className",		"Land_WoodenBox_F", [""] 			    		],
	["_backpacks", 		[],					[]							],
	["_spawnloc", 		"REL", 				["",objNull,[]],	[2,3] 	]
];

// Create Parent Node (if needed)
[_spawner] call CVO_CSC_fnc_createNode;

// Prep
private _actionID = ["CVO","CSC",_title splitString " " joinString "_"] joinString "_";
private _EH_ID = ["CVO","CSC",_title,_spawner] joinString "_";

// ## create aceActionArray

private _statement = {
	params ["_target", "_player", "_actionParams"];
	_actionParams params ["_EH_ID", "_className", "_spawnloc", "_title", "_itemArray", "_backbackArray"];

	diag_log format ['[CVO](debug)(fn_addCSC) _this: %1', _this];
	
	[_EH_ID, [_target, _className, _spawnLoc, _title, _itemArray, _backbackArray] ] call CBA_fnc_serverEvent;
};



private _aceAction = [
	_actionID,         														 		// * 0: Action name <STRING>
	_title,            																//  * 1: Name of the action shown in the menu <STRING>
	"\A3\ui_f\data\igui\cfg\simpleTasks\types\box_ca.paa",                          //  * 2: Icon <STRING> "\A3\ui_f\data\igui\cfg\simpleTasks\types\backpack_ca.paa"
	_statement,                            											//  * 3: Statement <CODE>
	{true},														                    //  * 4: Condition <CODE>
	{},													                            //  * 5: Insert children code <CODE> (Optional)
	[_EH_ID, _className, _spawnloc, _title, _itemArray, _backbackArray] 			//  * 6: Action parameters <ANY> (Optional)
] call ace_interact_menu_fnc_createAction;


// Create EH


// ## ATTACHING THE ACTION to class OR OBJECT

	switch (typeName _spawner) do {
		case "OBJECT": { [_spawner, 0, ["ACE_MainActions"], _root ] call ace_interact_menu_fnc_addActionToObject; };
		case "STRING": { [_spawner, 0, ["ACE_MainActions"],	_root ] call ace_interact_menu_fnc_addActionToClass;  };
	};

diag_log format ["[CVO][CSC] New CSC Established Sucessfully => Carrier: %1 - CSC: %2", _spawner, _title];

// Register EventHandler
[_EH_ID, { _this call CVO_CSC_fnc_spawnCSC }] call CBA_fnc_addEventHandler;

if true exitWith {};


_aceAction = [
    "My_Action_ID_Name",         // * 0: Action name <STRING>
    "Display String",            //  * 1: Name of the action shown in the menu <STRING>
    "",                          //  * 2: Icon <STRING> "\A3\ui_f\data\igui\cfg\simpleTasks\types\backpack_ca.paa"
    _code,                            //  * 3: Statement <CODE>
    {true},                      //  * 4: Condition <CODE>
    {},                          //  * 5: Insert children code <CODE> (Optional)
    []                            //  * 10: Modifier function <CODE> (Optional)
] call ace_interact_menu_fnc_createAction;

