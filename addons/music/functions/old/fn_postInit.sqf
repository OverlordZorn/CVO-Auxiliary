/*
private _insertChildren = {
    params ["_target", "_player", "_params"];
    private _map = missionNamespace getVariable [QGVAR(Playlist_HM), "404"];
    if (_map isEqualTo "404") exitWith {};


    // Add children to this action
    private _actions = [];
    {
        if ( _x isEqualTo "allSongs") then { continue };
        private _actionName = _x splitString " " joinString "_";
        private _childStatement = { [QGVAR(EH_playlist), _this#2] call CBA_fnc_serverEvent; };

        private _action = [
            _actionName,            // action name
            _x,                     // title
            "",                     // icon path
            _childStatement,        // statement
            {true},                 // condition
            {},                     // child_code
            _x                      // parameter
        ] call ace_interact_menu_fnc_createAction;
        _actions pushBack [_action, [], _target]; // New action, it's children, and the action's target
    } forEach keys _map;

    _actions
};


_action = [
    QGVAR(zeus_playlists),                                          // name
    "Playlists",                                                    // title
    "\A3\ui_f\data\igui\cfg\simpleTasks\types\documents_ca.paa",    // Icon
    {},                                                           // Statement
    {true},                                                         // Condition
    _insertChildren                                                 // Insert children Code
] call ace_interact_menu_fnc_createAction;

[["ACE_ZeusActions",QGVAR(zeus_node)], _action] call ace_interact_menu_fnc_addActionToZeus;


*/