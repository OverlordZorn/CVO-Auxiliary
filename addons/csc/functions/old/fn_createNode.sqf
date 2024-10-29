#include "../../script_component.hpp"
/*
* Author: Zorn
* checks and, if needed, creates ACE Interaction Node for CSC
*
* Arguments:
* 0 _source   - <OBJECT or CLASSNAME>
*
* Return Value:
* true when successful
*
* Example:
* [cursorObject] call CVO_CSC_fnc_createNode;
*
* Public: No
*/

params
[
	["_spawner", objNull, [objNull, ""]]
];


if (_spawner isEqualTo objNull) exitWith {};

// ### Creates an Array to store all already existing "Menu Nodes" when the Array doesnt exist yet.
private _nodeArray = missionNamespace getVariable ["CVO_CSC_NodeArray", []];

// ### Creates CSC Menu Node if the _spawner does not carries a CSC Menu Node yet.
if (!(_spawner in _nodeArray)) then
{
	private _root = [
		"cvo_csc_root",													// Action Name
		"Take Supply Crate",									// Name for the ACE Interaction Menu
		"\A3\ui_f\data\igui\cfg\simpleTasks\types\box_ca.paa",																// Custom Icon 
		{""},											 				// Statement
		{true}															// Condition
	] call ace_interact_menu_fnc_createAction;

	switch (typeName _spawner) do {
		case "OBJECT": { [_spawner, 0, ["ACE_MainActions"], _root ] call ace_interact_menu_fnc_addActionToObject; };
		case "STRING": { [_spawner, 0, ["ACE_MainActions"],	_root ] call ace_interact_menu_fnc_addActionToClass;  };
	};

	_nodeArray pushBack _spawner;
};

missionNamespace setVariable ["CVO_CSC_NodeArray", _nodeArray];

true