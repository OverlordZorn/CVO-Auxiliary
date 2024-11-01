#include "../script_component.hpp"

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
* Public: Yes
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
    
    params ["_target", "_player", "_actionParams"];
    _actionParams params ["_catName"];

    ZRN_LOG_MSG_3(init CHILD EVAL,typeOf _target,_player,_actionParams);

    private _cat = [_catName] call FUNC(catalog);
    
    ZRN_LOG_MSG_3(PostCatalogFNC,_catName,typeName _cat,keys _cat);

    if (_cat isEqualTo "404") exitWith {};


    private _entries = [];
    private _mode = switch (true) do {
        case (typeOf _target isEqualTo "ModuleCurator_F"): { "ZEUS" };
        default { "NORMAL" };
    };



    private _code = switch (_mode) do {
        case "ZEUS": {
            ZRN_LOG_MSG_1(PRE-filter:,typename _x);
            ZRN_LOG_MSG_1(PRE-filter:,typename _y);
            if (_x isEqualTo "Default Entry" OR {typeName _y isNotEqualTo "HASHMAP"}) then {continue};
            ZRN_LOG_MSG(MODE: ZEUS);
            private _zeusEnabled = _y getOrDefault ["zeus_enabled", false];
            ZRN_LOG_1(_zeusEnabled);
            if (_zeusEnabled) then {_entries pushBack _x};
        };

        case "NORMAL": { ZRN_LOG_MSG(MODE: CASE); }; // Default Case
        /*
        default {
            private _sources = _y getOrDefault ["links", []];

            if (count _sources == 0) then {continue};
            if (_target in _sources || typeName _target in _sources) then { _entries pushBack _x; };
        };
        */
    };
    
    ZRN_LOG_MSG_1(reee,keys _cat);
    ZRN_LOG_MSG_1(reee,typeName _cat);

    _code forEach _cat;

    ZRN_LOG_MSG_1(PostForEach,_entries);

    private _actions = [];
    {
        // Current result is saved in variable _x
        private _entryName = _x;
        ZRN_LOG_MSG_1(forEachEntry,_x);

        private _params = [_entryName,_catName];
        private _code = {
            ZRN_LOG_MSG_1(REQUEST,_this);
            // [QGVAR(EH_request), _this] call CBA_fnc_serverEvent;
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
        ZRN_LOG_1(_actions);

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
