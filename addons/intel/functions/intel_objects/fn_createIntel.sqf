#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to create an Intel Item.
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

if !(isServer) exitWith {};

params [
    ["_objVarName",        objNull,             [""]    ],
    ["_displayName",    "Action String",        [""]    ],
    ["_title",          "Diary Record Title",   [""]    ],
    ["_structuredText", "Diary Body",           [""]    ],
    ["_soundType",      "BODY",                 [""]    ],
    ["_duration",       15,                     [0]     ],
    ["_intelGroup",     "Intel Group",          [""]    ],
    ["_removeObject",   true,                   [true]  ]
];

ZRN_LOG_1(_this);

if (_objVarName isEqualTo objNull) exitWith {};

if (_intelGroup isNotEqualTo "") then { [_intelGroup,_objVarName] call FUNC(addIntelToGroup) };

private _sound = switch (_soundType) do {
    case "BODY": { ["OMIntelGrabBody_01", "OMIntelGrabBody_02", "OMIntelGrabBody_03"] };
    case "KEYBOARD": { ["OMIntelGrabPC_01", "OMIntelGrabPC_02", "OMIntelGrabPC_03","OMIntelGrabLaptop_01", "OMIntelGrabLaptop_02", "OMIntelGrabLaptop_03"] };
    default { [] };
};

private _object = missionNamespace getVariable [_objVarName, objNull];

if ( is3DENPreview ) then { _str = format ["intel action added to: %1 - %2", _this#0, _object]; diag_log _str; systemChat _str; };
if ( is3DENPreview ) then { _duration = 1; };

[ CBA_fnc_globalEventJIP , [ QGVAR(EH_addIntelAction), [_object, 0, _removeObject, 1, _displayName, _sound, _duration, _title, _structuredText], _objVarName], 1] call CBA_fnc_waitAndExecute;
[_objVarName, _object] call CBA_fnc_removeGlobalEventJIP; // Will remove the JIP if the object has already been picked up.
