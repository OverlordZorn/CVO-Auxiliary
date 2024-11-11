#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to execute the Request for a local Fading down of the Music to 0.
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

private _time = 10;

if (GETMGVAR(isFading,false)) exitWith {
    systemChat LLSTRING(diary_fading_already);
};

[_time] call FUNC(fade_client);

systemChat LLSTRING(diary_fading);
[ { systemChat LLSTRING(diary_faded) } , [], _time] call CBA_fnc_waitAndExecute;