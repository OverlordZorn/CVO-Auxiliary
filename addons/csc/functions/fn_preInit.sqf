#include "../script_component.hpp"

/*
* Author: Zorn
* preInit Function to register CBA Events and other pre init things
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* ['something', player] call prefix_component_fnc_functionname
*
* Public: Yes
*/

[QGVAR(EH_request), FUNC(request)] call CBA_fnc_addEventHandler;