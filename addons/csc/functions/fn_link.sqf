#include "../script_component.hpp"

/*
* Author: Zorn
* 
*
* Arguments:
*
* Return Value:
* 
*
* Example:
* ['something', player] call prefix_component_fnc_functionname
* ["ZEUS", "ACE Medical Box"] call FUNC(link);
*
* Public: Yes
*/

params [
    ["_target",      "404",     ["", objNull] ],     // Object, Classname or ZEUS Action
    ["_entryName",   "Default", [""] ],
    ["_catName", "global",  [""] ]
];

if (_target isEqualTo "404") exitWith {ZRN_LOG_MSG(No target provided);};



private _cat = [_catName] call FUNC(catalog);
if (_cat isEqualTo "404") exitWith {ZRN_LOG_MSG_1(Catalog not found,_catName);};
private _links = _cat get _entryName getOrDefault ["links", []];


// Check if zeus is enabled for this catalog already - if not - create zeus action and attach it to zeus.
private _fn_zeus = {
    private _zeusEnabled = missionNamespace getVariable [[_catName,"zeusEnabled"] call FUNC(getCatName), false];
    if (!_zeusEnabled) then {
        private _aceAction = [_catName] call FUNC(createAction);
        [ ["ACE_ZeusActions"], _aceAction ] call ace_interact_menu_fnc_addActionToZeus;
        missionNamespace setVariable [[_catName,"zeus"] call FUNC(getCatName),true];
    };
};

private _fn_obj = {
    // Add action to Object 
    if (count _links == 0) then {
        private _aceAction = [_catName] call FUNC(createAction);
        [_target, 0, ["ACE_MainActions"], _aceAction] call ace_interact_menu_fnc_addActionToObject;
    };
    // Add Object to Entry-Links
    _links pushBackUnique _target;
};

private _fn_class = {
   // TBA 
};


switch true do {
    case (_target isEqualType objNull): _fn_obj;
    case (_target isEqualTo "ZEUS"):    _fn_zeus;
    case (_target isEqualType ""):      _fn_class;
    default {  };
};