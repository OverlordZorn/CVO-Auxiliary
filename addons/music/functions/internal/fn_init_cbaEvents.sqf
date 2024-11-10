#include "../../script_component.hpp"

/*
* Author: Zorn
* [Description]
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

[QGVAR(EH_play_remote), FUNC(play_client)] call CBA_fnc_addEventHandler;
[QGVAR(EH_fade_remote), FUNC(fade_client)] call CBA_fnc_addEventHandler;

[QGVAR(EH_update_server), FUNC(update_server)] call CBA_fnc_addEventHandler;
[QGVAR(EH_request_server), FUNC(request_server)] call CBA_fnc_addEventHandler;
