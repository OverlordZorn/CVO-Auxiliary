#include "../script_component.hpp"

/*
* Author: Zorn
* function to create the children of the NODE Action
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

params ["_target", "_player", "_params"];
_params params  ["_catalogName"];

private _key_gvar_name = ([_catalogName,"keys"] joinString "_");



private _actions = [];
private _provideAction = [
    QGVAR(provide)                          // * 0: Action name <STRING>
    ,"Provide"                              //  * 1: Name of the action shown in the menu <STRING>
    ,""                                     //  * 2: Icon <STRING> "\A3\ui_f\data\igui\cfg\simpleTasks\types\backpack_ca.paa"
    ,FUNC(provide)                          //  * 3: Statement <CODE>
    ,{true}                                 //  * 4: Condition <CODE>
    ,{}                                     //  * 5: Insert children code <CODE> (Optional)
    ,[SET(provide_filter), _catalogName]      //  * 6: Action parameters <ANY> (Optional)
] call ace_interact_menu_fnc_createAction;

_actions pushBack [_provideAction, [], _target];

private _requestAction = [
    QGVAR(provide)                          // * 0: Action name <STRING>
    ,"Request"                              //  * 1: Name of the action shown in the menu <STRING>
    ,""                                     //  * 2: Icon <STRING> "\A3\ui_f\data\igui\cfg\simpleTasks\types\backpack_ca.paa"
    ,{}                                     //  * 3: Statement <CODE>
    ,{

        params ["_target", "_player", "_params"];
        _params params ["_catalogName"];

        private _keys = missionNamespace getVariable [[_catalogName, "keys"] joinString "_", [] ];
        count (_keys select { _x#0 isEqualTo _target}) > 0
    }                                       //  * 4: Condition <CODE>
    ,{
        params ["_target", "_player", "_params"];
        _params params ["_catalogName"];

        private _objRef = _target getVariable QGVAR(cat_objRef);


        private _keys = missionNamespace getVariable [[_catalogName,"keys"] joinString "_", []];
        private _keys_filtered = _keys select { _x#0 isEqualTo _objRef};

        private _actions = [];

        {
            _x params ["_obj", "_provider"];

            private _name =  _provider;
            private _acnID = _name splitString " " joinString "_";
            
            private _statement = {
                params ["_target", "_player", "_params"];
                _params params  ["_provider","_catalogName"];
                [QGVAR(EH_SRV_2_request), [_target,_provider,_player,_catalogName]] call CBA_fnc_serverEvent;
            };


            private _action = [
                _acnID                                  // * 0: Action name <STRING>
                ,_name                                  //  * 1: Name of the action shown in the menu <STRING>
                ,""                                     //  * 2: Icon <STRING> "\A3\ui_f\data\igui\cfg\simpleTasks\types\backpack_ca.paa"
                ,_statement                             //  * 3: Statement <CODE>
                ,{true}                                 //  * 4: Condition <CODE>
                ,{}                                     //  * 5: Insert children code <CODE> (Optional)
                ,[_provider,_catalogName]               //  * 6: Action parameters <ANY> (Optional)
            ] call ace_interact_menu_fnc_createAction;
          _actions pushBack [_action, [], _obj];


        } forEach _keys_filtered;

        _actions
    }                                       //  * 5: Insert children code <CODE> (Optional)
    ,[_catalogName]                         //  * 6: Action parameters <ANY> (Optional)
] call ace_interact_menu_fnc_createAction;

_actions pushBack [_requestAction, [], _target];

_actions