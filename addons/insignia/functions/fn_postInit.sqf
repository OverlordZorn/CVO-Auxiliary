#include "../script_component.hpp"

if !(hasInterface) exitWith {};

// Once CBA_Settings are initialized, will run the fnc_eventhandler to add/remove the Ace Arsenal closed eventhandler.

private _code = {
    private _isEnabled = missionNamespace getVariable [QSET(on_arsenalClosed), false];
    [_isEnabled] call FUNC(eh_arsenal);


    _isEnabled = missionNamespace getVariable [QSET(on_missionStart), false];
    if (_isEnabled) then { [player] call FUNC(autoAssign); };

};

if (missionNamespace getVariable ["cba_settings_ready",false]) then _code else { ["CBA_settingsInitialized",_code,[]] call CBA_fnc_addEventHandler; };



// Register Event
[QGVAR(Request_AutoAssign), { [player] call FUNC(autoAssign); }] call CBA_fnc_addEventHandler;