#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to setup the ace action which will be returned so it can be added whereever it is needed.
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

//////////////////// CONTINUE HERE <---
// READ and UNDERSTAND
// ACTION SHALL WORK BASED ON TARGET
// IF TARGET IS ZEUS - GET ZEUS ACTIONS FROM ARRAY
// IF TARGET IS OBJECT, CHECK IF THIS OBJECT IS IN THE LINK ARRAY AND RETRIEVE KEYS FROM HASHMAP
//// IF NOT, CHECK IF CLASSNAME IS IN LINK ARRAY ANS RETRIEVE KEYS FROM HASHMAP

params [
    ["_catName",    "global",   [""]],
    ["_Type",       "",         [""]]
];

ZRN_LOG_MSG_1(init,_this);

private _children = {
    private _fnc_scriptName = "cA_children";
    
    params ["_target", "_player", "_actionParams"];
    _actionParams params ["_catName"];

    private _cat = [_catName] call FUNC(catalog);
    
    if (_cat isEqualTo "404") exitWith {};

    private _entries = [];

    private _target_classname = typeOf _target;

    private _mode = switch (true) do {
        case (_target_classname isEqualTo "ModuleCurator_F"): { "ZEUS" };
        default { "NORMAL" };
    };

    private _code = switch (_mode) do {
        case "ZEUS": {
            {
                if (_x isEqualTo "Default Entry" OR {typeName _y isNotEqualTo "HASHMAP"}) then {continue};
                private _zeusEnabled = _y getOrDefault ["zeus_enabled", false];
                if (_zeusEnabled) then {_entries pushBack _x};
            }
        };

        case "NORMAL": {
            {
                if (_x isEqualTo "Default Entry" OR {typeName _y isNotEqualTo "HASHMAP"}) then {continue};
                private _links = _y get "links";
                if (_target_classname in _links#0 || {_target in _links#1}) then { _entries pushBack _x };
            }
        }; 
    };
    
    _code forEach _cat;

    private _actions = [];
    {
        // Current result is saved in variable _x
        private _entryName = _x;

        private _params = [_entryName, _catName, _mode];
        private _code = {
            ZRN_LOG_MSG_1(REQUEST,_this);
            _this call FUNC(request);
        };
        private _aceAction = [
            _entryName splitString " " joinString "_"                       // * 0: Action name <STRING> 
            ,_entryName                                                     //  * 1: Name of the action shown in the menu <STRING>
            ,""                                                             //  * 2: Icon <STRING> "\A3\ui_f\data\igui\cfg\simpleTasks\types\backpack_ca.paa"
            ,_code                                                          //  * 3: Statement <CODE>
            ,{true}                                                         //  * 4: Condition <CODE>
            ,{}                                                             //  * 5: Insert children code <CODE> (Optional)
            ,_params                                                        //  * 6: Action parameters <ANY> (Optional)
        ] call ace_interact_menu_fnc_createAction;

        _actions pushBack [_aceAction, [], _target];

    } forEach _entries;

    _actions
};



private _params = [_catName];
private _aceAction = [
    QGVAR(root)                                                 // * 0: Action name <STRING>
    ,"Custom Supply Crate"                                      //  * 1: Name of the action shown in the menu <STRING>
    ,"\A3\ui_f\data\igui\cfg\simpleTasks\types\box_ca.paa"      //  * 2: Icon <STRING> "\A3\ui_f\data\igui\cfg\simpleTasks\types\backpack_ca.paa"
    ,{ZRN_LOG_MSG_1(zeus action,_this#0);}                      //  * 3: Statement <CODE>
    ,{true}                                                     //  * 4: Condition <CODE>
    ,_children                                                  //  * 5: Insert children code <CODE> (Optional)
    ,_params                                                    //  * 6: Action parameters <ANY> (Optional)
] call ace_interact_menu_fnc_createAction;


_aceAction
