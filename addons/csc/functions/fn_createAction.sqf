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

params [
    ["_catName",    "global",   [""]],
    ["_Type",       "",         [""]]
];



private _params = [_catName];
private _children = {
    params ["_target", "_player", "_actionParams"];
    _actionParams params ["_catName"];

    private _cat = missionNamespace getVariable [[QPREFIX,QCOMPONENT,"CAT",_catName] joinString "_", "404"];

    if (_cat isEqualTo "404") exitWith {};

    private "_mode";

    private _entries = [];
    /*
    if (typeOf _target isEqualTo "ModuleCurator_F") then {
        _mode = "ZEUS";
        {
            if (_x isEqualTo "Default Entry") then {continue};
            if (typeName != "HASHMAP") then {continue};

            if (_y getOrDefault ["airdrop_enabled", false]) then [_entries pushBack _x];
        } forEach _cat;
    } else {
        _mode = "NORMAL";
        {
            if (_x isEqualTo "Default Entry") then {continue};
            if (typeName != "HASHMAP") then {continue};
            
            private _sources = _y getOrDefault ["links", []];

            if (count _sources == 0) then {continue};
            if (_target in _sources || typeName _target in _sources) then { _entries pushBack _x; };

        } forEach _cat;
    };
    */

    private _actions = [];
    {
        // Current result is saved in variable _x
        private _entryName = _x;

        private _params = [_entryName,_catName];
        private _code = { [QGVAR(EH_request), _this] call CBA_fnc_serverEvent; };
        
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
};


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
