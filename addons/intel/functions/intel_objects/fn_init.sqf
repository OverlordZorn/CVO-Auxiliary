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

[ QGVAR(EH_update),          FUNC(diary_updateRecord) ] call CBA_fnc_addEventHandler;
[ QGVAR(EH_addIntelAction),  FUNC(addIntelAction)     ] call CBA_fnc_addEventHandler;
[ QGVAR(EH_addIntelEntry),   FUNC(addIntel)           ] call CBA_fnc_addEventHandler;

