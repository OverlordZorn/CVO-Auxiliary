#include "../script_component.hpp"

/*
* Author: Zorn
* Function to add an ACE Action to an Object which the player can use to deploy from.
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

params [
    ["_object",     objNull,    [objNull]   ],
    ["_catName",    false,      [""]        ],
    ["_offset",     [0,0,0],    [[]], [3]   ]
];

if (_object isEqualTo objNull) exitWith {};

if (_catName isEqualTo false) then {
    _catName = _object getVariable [QGVAR(Departure),"404"];
    if (_catName isEqualTo "404") exitWith {};
};

private _cat = missionNamespace getVariable [[ADDON,_catName] joinString "_", "404"];
if (_cat isEqualTo "404") exitWith {};

private _params = [_catName];
private _children = {
    params ["_target", "_player", "_actionParams"];
    _actionParams params [""];
    private _actions = [];

    private _catName = _target getVariable [QGVAR(Departure), "404"];
    if (_catName isEqualTo "404") exitWith {};
    private _cat = missionNamespace getVariable [[ADDON,_catName] joinString "_", "404"];

    private _destinations = _cat getOrDefault ["Destinations", []];

    {
        private _destination = _x;

        private _params = [];
        private _code = {
            params ["_target", "_player", "_actionParams"];
            _actionParams params [""];
            /* me code here */
        };
        
        private _aceAction = [
            [_catName,_forEachIndex] joinString "_" // * 0: Action name <STRING>
            ,_destination call FUNC(getName)        //  * 1: Name of the action shown in the menu <STRING>
            ,""                                     //  * 2: Icon <STRING> "\A3\ui_f\data\igui\cfg\simpleTasks\types\backpack_ca.paa"
            ,_code                                  //  * 3: Statement <CODE>
            ,{true}                                 //  * 4: Condition <CODE>
        //    ,{}                                   //  * 5: Insert children code <CODE> (Optional)
        //    ,_params                              //  * 6: Action parameters <ANY> (Optional)
        //    ,[0,0,0]                              //  * 7: Position (Position array, Position code or Selection Name) <ARRAY>, <CODE> or <STRING> (Optional)
        //    ,20                                   //  * 8: Distance <NUMBER> (Optional)
        //    ,[false,false,false,false,false]      //  * 9: Other parameters [showDisabled,enableInside,canCollapse,runOnHover,doNotCheckLOS] <ARRAY> (Optional)
        //    ,{}                                   //  * 10: Modifier function <CODE> (Optional)
        ] call ace_interact_menu_fnc_createAction;
        

        _actions pushBack  [_action, [], _target];
    } forEach _destinations;

};


private _aceAction = [
    _catName                     // * 0: Action name <STRING>
    ,_cat getOrDefault ["displayName", "CVO Deployment"]                        //  * 1: Name of the action shown in the menu <STRING>
    ,_cat getOrDefault ["icon", PATHTOEF(branding,data\Raven_Voron_256.paa)]    //  * 2: Icon <STRING> "\A3\ui_f\data\igui\cfg\simpleTasks\types\backpack_ca.paa"
    ,{}                                     //  * 3: Statement <CODE>
    ,{true}                                 //  * 4: Condition <CODE>
    ,_children                              //  * 5: Insert children code <CODE> (Optional)
//    ,_params                              //  * 6: Action parameters <ANY> (Optional)
//    ,[0,0,0]                              //  * 7: Position (Position array, Position code or Selection Name) <ARRAY>, <CODE> or <STRING> (Optional)
//    ,20                                   //  * 8: Distance <NUMBER> (Optional)
//    ,[false,false,false,false,false]      //  * 9: Other parameters [showDisabled,enableInside,canCollapse,runOnHover,doNotCheckLOS] <ARRAY> (Optional)
//    ,{}                                   //  * 10: Modifier function <CODE> (Optional)
] call ace_interact_menu_fnc_createAction;

