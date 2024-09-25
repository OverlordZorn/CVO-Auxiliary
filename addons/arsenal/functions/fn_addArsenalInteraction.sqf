#include "../script_component.hpp"

/*
* Author: Zorn
* Adds the CVO Arsenal Interaction to an Object
*
* Arguments:
*	0 - <OBJECT or ARRAY of OBJECTS> - Object(s) that shall function as an CVO Arsenal
* 
* Return Value:
* None
*
* Example:
* [box] call CVO_Arsenal_fnc_addArsenalInteraction
* [[box1,box2,box3]] call CVO_Arsenal_fnc_addArsenalInteraction
*
* Public: Yes
*/

params [
    ["_input", objNull, [objNull, []] ]
];

if (_input isEqualTo objNull) exitWith {};

_action = [
	"CVO_Arsenal_Open",				// ActionName
	"Open the Arsenal",				// Name of the Action shown in the menu
	"\A3\ui_f\data\igui\cfg\simpleTasks\types\rifle_ca.paa",		// Icon
	{[] call cvo_arsenal_fnc_open},		// Statement (The actual Code)
	{true}							// condition
] call ace_interact_menu_fnc_createAction;


private _array = switch (typeName _input) do {
    case "OBJECT": { [_input] };
    case "ARRAY": { flatten _input };
};

{
    if !(_x isEqualType objNull) then {continue};

	[
		_x, 
		0, 
		["ACE_MainActions"], 
		_action
	] call ace_interact_menu_fnc_addActionToObject;	

} forEach _array;