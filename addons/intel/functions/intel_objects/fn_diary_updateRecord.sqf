#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to be executed locally - will update/create the Intel Summary Record
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


diag_log "[CVO](debug)(fn_diary_updateRecord) init";

[] call FUNC(diary_createSubject);
[] call FUNC(diary_setRecordText);