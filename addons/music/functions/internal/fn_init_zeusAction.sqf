#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to initialize the Zeus Action
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* ['something', player] call prefix_component_fnc_functionname
*
* Public: No
*/

private _zeusAction = [] call FUNC(createAction);

[
    ["ACE_ZeusActions"]                      // * 0: Parent path of the new action (e.g. ["ACE_ZeusActions"]) <ARRAY>
    ,_zeusAction	         	        		// * 1: Action <ARRAY>
] call ace_interact_menu_fnc_addActionToZeus;