#include "../../script_component.hpp"

/*
* Author: ZEN Team
* function to set the text based on the already discovered intel groups
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

private _text =  [] call FUNC(diary_getText);

player setDiaryRecordText [
    [
        "intelSummary",
        player allDiaryRecords "intelSummary" select 0 select -1
    ],
    [
        "Intel Summary",
        _text,
        "\A3\ui_f\data\igui\cfg\simpleTasks\types\search_ca.paa"
    ]
];