params [
    ["_enable", true, [true]]
];

private _id = missionNamespace getVariable ["cvo_insignia_eh_arsenal_id", "404"];
private _isEnabled = _id isNotEqualTo "404";


switch (true) do {

    case ( _enable && (!_isEnabled) ): {

        _id = ["ace_arsenal_displayClosed", {
            
            [player] call cvo_insignia_fnc_autoAssign;

        }] call CBA_fnc_addEventHandler;
        
        missionNamespace setVariable ["cvo_insignia_eh_arsenal_id", _id];
    };

    case ( !_enable && (_isEnabled) ): {
        ["ace_arsenal_displayClosed", _id] call CBA_fnc_removeEventHandler;
        missionNamespace setVariable ["cvo_insignia_eh_arsenal_id", nil];
    };
};

