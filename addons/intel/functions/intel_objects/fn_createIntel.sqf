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
    ["_varName",        "404",          [""]    ],
    ["_displayName",    "Take Intel",   [""]    ],
    ["_title",          "Intel Item",   [""]    ],
    ["_structuredText", "",             [""]    ],
    ["_soundType",      "",             [""]    ],
    ["_duration",       15,             [0]     ],
    ["_intelGroup",     "",             [""]    ],
    ["_removeObject",   true,           [true]  ]
];

if (_intelGroup isNotEqualTo "") then { [_intelGroup,_varName] call FUNC(addIntelToGroup) };

private _sound = switch (_soundType) do {
    case "BODY": { ["OMIntelGrabBody_01", "OMIntelGrabBody_02", "OMIntelGrabBody_03"] };
    case "KEYBOARD": { ["OMIntelGrabPC_01", "OMIntelGrabPC_02", "OMIntelGrabPC_03","OMIntelGrabLaptop_01", "OMIntelGrabLaptop_02", "OMIntelGrabLaptop_03"] };
    default { [] };
};

private _object = missionNamespace getVariable [_varName, objNull];

if ( is3DENPreview ) then { _str = format ["intel action added to: %1 - %2", _this#0, _object]; diag_log _str; systemChat _str; };
if ( is3DENPreview ) then { _duration = 1; };

private _jipID = [QGVAR(EH_addIntelAction), [_object, 0, _removeObject, 1, _displayName, _sound, _duration, _title, _structuredText]] call CBA_fnc_globalEventJIP; // Will add the IntelAction to the Item
[_jipID, _object] call CBA_fnc_removeGlobalEventJIP; // Will remove the JIP if the object has already been picked up.
