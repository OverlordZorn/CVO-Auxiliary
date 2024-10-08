#include "../script_component.hpp"

/*
* Author: Zorn
* Function to Establish a dynamically filled Zeus Interaction to Request/Trigger a BIS_fnc_supplydrop
* Does only need to be executed once (when the first supplydrop is being registered)
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* ['something', player] call cvo_fnc_sth
*
* Public: Yes
*/

private _aceAction = [
    "Zeus_SupplyDrop",                  // * 0: Action name <STRING>
    "Dispatch Supplydrop",              //  * 1: Name of the action shown in the menu <STRING>
    "\A3\ui_f\data\igui\cfg\simpleTasks\types\rearm_ca.paa",                                 //  * 2: Icon <STRING> "\A3\ui_f\data\igui\cfg\simpleTasks\types\backpack_ca.paa"
    {""},                               //  * 3: Statement <CODE>
    {true},                                 //  * 4: Condition <CODE>
    {                                   //  * 5: Insert children code <CODE> (Optional)
        params ["_target", "_player", "_params"];
        _params params ["_catalog"];
        private _actions = [];
        {
            private _entryName = _x;

            private _mode = _catalog get _entryName get "targetMode";

            private _actionID = _entryName splitString " " joinString "_";
            private _actionTitle = _entryName;
            private _icon = "";

            private _params = [_entryName,_mode];
            private _condition = { true };
            
            private _statement = {
                params ["_target", "_player", "_params"];
                _params params ["_entryName", "_mode"];
                [_entryName, _mode] call FUNC(defineTarget);
            };

            private _childChildren = {};
            private _action = [_actionID, _actionTitle, _icon, _statement, _condition, _childChildren, _params] call ace_interact_menu_fnc_createAction;
            _actions pushBack [_action, [], _target]; // New action, it's children, and the action's target
        } forEach keys _catalog;

        _actions
    },
    [_catalog]
] call ace_interact_menu_fnc_createAction;

[["ACE_ZeusActions"], _aceAction] call ace_interact_menu_fnc_addActionToZeus;


/*

            private _statement = if (_mode isEqualTo "BOTH") then {} else {
                params ["_target", "_player", "_params"];
                _params params ["_entryName", "_mode"];
                [_entryName, _mode] call FUNC(defineTarget);
            };

            private _childChildren = if (_mode isNotEqualTo "BOTH") then {} else {
                params ["_target", "_player", "_params"];
                _params params ["_entryName", "_mode"];

                private _actions = [];

                private _statement = if (_mode isEqualTo "BOTH") then {} else {
                    params ["_target", "_player", "_params"];
                    _params params ["_entryName", "_mode"];
                    [_entryName, _mode] call FUNC(defineTarget);
                };

                private _actionMap =    ["MAPCLICK", "on Map Click", "", _statement, {true}, {}, [_entryName, "PLAYER"]] call ace_interact_menu_fnc_createAction;
                private _actionPlayer = ["player", "On Zeus Player", "", _statement, {true}, {}, [_entryName, "MAPCLICK"]] call ace_interact_menu_fnc_createAction;

                _actions pushBack [_actionMap, [], _target];
                _actions pushBack [_actionPlayer, [], _target];

                _actions

            };

*/



/*
            private _condition = { true };
            
            private _statement = {
                params ["_target", "_player", "_params"];
                _params params ["_entryName", "_mode"];
                [_entryName, _mode] call FUNC(defineTarget);
            };
*/