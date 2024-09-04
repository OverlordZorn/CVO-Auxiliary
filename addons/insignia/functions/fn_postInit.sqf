if !(hasInterface) exitWith {};

// Once CBA_Settings are initialized, will run the fnc_eventhandler to add/remove the Ace Arsenal closed eventhandler.

private _code = {
    private _isEnabled = missionNamespace getVariable ["CVO_SET_Insignia_on_arsenalClosed", false];
    [_isEnabled] call CVO_Insignia_fnc_eventhandler;


    _isEnabled = missionNamespace getVariable ["CVO_SET_Insignia_on_missionStart", false];
    if (_isEnabled) then { [player] call cvo_insignia_fnc_autoAssign; };

};

if (missionNamespace getVariable ["cba_settings_ready",false]) then _code else { ["CBA_settingsInitialized",_code,[]] call CBA_fnc_addEventHandler; };



// Register Event
["CVO_Insignia_Request_AutoAssign", { [player] call cvo_insignia_fnc_autoAssign; }] call CBA_fnc_addEventHandler;