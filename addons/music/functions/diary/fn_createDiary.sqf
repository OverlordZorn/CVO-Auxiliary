#include "../../script_component.hpp"

/*
* Author: Zorn
* This function creates the Diary Entry.
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

if !(hasInterface) exitWith {};


// Create Music Subject
GVAR(subject) = player createDiarySubject [QGVAR(diary_subject), LLSTRING(diary_subject_title)];

// Create Initial Music History Entry
["INIT"] call CVO_MUSIC_fnc_updateHistory;


// Create Controls Entry
player createDiaryRecord [
    QGVAR(diary_subject),
    [
        LLSTRING(diary_record_MusicControls_Title),
        format ["<font face='EtelkaMonospacePro' size=18><execute expression='[] call %1;'>%2</execute></font>", QFUNC(fade_local), LLSTRING(diary_record_MusicControls_fadeButton)]
    ]
];