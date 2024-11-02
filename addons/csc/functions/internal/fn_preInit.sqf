#include "../../script_component.hpp"

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
* Public: No
*/

/*
// THis might actually be not needed
[QGVAR(EH_request), FUNC(request)] call CBA_fnc_addEventHandler;
[QGVAR(EH_request), _this] call CBA_fnc_serverEvent;
*/

[QGVAR(EH_dispatch),       FUNC(dispatch)] call CBA_fnc_addEventHandler;
[QGVAR(EH_request_server), FUNC(request_server)] call CBA_fnc_addEventHandler;