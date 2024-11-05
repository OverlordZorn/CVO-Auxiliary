#include "../../script_component.hpp"

/*
* Author: Zorn
* Verifies if that Track is available.
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* [] call prefix_component_fnc_functionname
*
* Public: No
*/

params [
    ["_track",        "",         [""]       ]
];

isClass (configFile >> "CfgMusic" >> _track)