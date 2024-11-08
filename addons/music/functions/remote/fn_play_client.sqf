#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to play a song on the remote clients
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

params [
    ["_track",        "",         [""]       ]
];

playMusic _track;

