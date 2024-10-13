#include "../script_component.hpp"

/*
* Author: Zorn
* Function that handles the providing of mapmarkers to the catalog object
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* ['something', player] call prefix_component_fnc_functionname
*
* Public: Yes
*/

ZRN_LOG_MSG_1(INIT,_this);

params ["_target", "_player", "_params"];
_params params  [
    ["_filter",         "ALLPLAYERS",           [""]    ]
    ,["_catalogName",   QGVAR(cat_global),      [""]    ]
];


private _markersHM = [_filter, _player] call FUNC(getMarkers);

ZRN_LOG_1(_markersHM);

if (_markersHM isEqualTo false) exitWith { ZRN_LOG_MSG_1(No markers found,_filter);};

[QGVAR(EH_SRV_1_provide), [_markersHM, _target, _player, _catalogName]] call CBA_fnc_serverEvent;
ZRN_LOG_MSG(END);