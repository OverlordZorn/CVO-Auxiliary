#include "../../script_component.hpp"

/*
* Author: Zorn
* function to actually create  the intel entry.
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

params ["_title", "_text"];

ZRN_LOG_1(_this);

if !(player diarySubjectExists QGVAR(intel)) then {
    player createDiarySubject [QGVAR(intel), "Intel" /*localize "str_disp_intel_title" */ ];
};

player createDiaryRecord [QGVAR(intel), [_title, _text]];
