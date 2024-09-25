#include "../script_component.hpp"

params [
    ["_enable", true, [true]]
];

private _id = missionNamespace getVariable [QGVAR(eh_arsenal_id), "404"];
private _isEnabled = _id isNotEqualTo "404";


switch (true) do {

    case ( _enable && (!_isEnabled) ): {

        _id = ["ace_arsenal_displayClosed", {
            
            [player] call FUNC(autoAssign);

        }] call CBA_fnc_addEventHandler;
        
        missionNamespace setVariable [QGVAR(eh_arsenal_id), _id];
    };

    case ( !_enable && (_isEnabled) ): {
        ["ace_arsenal_displayClosed", _id] call CBA_fnc_removeEventHandler;
        missionNamespace setVariable [QGVAR(eh_arsenal_id), nil];
    };
};

