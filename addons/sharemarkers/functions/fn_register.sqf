#include "../script_component.hpp"

/*
* Author: Zorn
* This function sets up the object as a marker catalog
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
ZRN_LOG_MSG(INIT);

params [
    ["_object",     objNull,            [objNull]   ],
    ["_catalogName", QGVAR(cat_global), [""]        ]
];

if (_object isEqualTo objNull) exitWith {ZRN_LOG_MSG(objNull);};

private _aceAction = [
    QGVAR(Action_Node)                    // * 0: Action name <STRING>
    ,"Share Markers"                        //  * 1: Name of the action shown in the menu <STRING>
    ,""                                   //  * 2: Icon <STRING> "\A3\ui_f\data\igui\cfg\simpleTasks\types\backpack_ca.paa"
    ,{}                                   //  * 3: Statement <CODE>
    ,{true}                               //  * 4: Condition <CODE>
    ,FUNC(node_children)                  //  * 5: Insert children code <CODE> (Optional)
    ,[_catalogName]                       //  * 6: Action parameters <ANY> (Optional)
    ,[0,0,0]                              //  * 7: Position (Position array, Position code or Selection Name) <ARRAY>, <CODE> or <STRING> (Optional)
    ,20                                   //  * 8: Distance <NUMBER> (Optional)
    ,[false,false,false,false,false]      //  * 9: Other parameters [showDisabled,enableInside,canCollapse,runOnHover,doNotCheckLOS] <ARRAY> (Optional)
    ,{}                                   //  * 10: Modifier function <CODE> (Optional)
] call ace_interact_menu_fnc_createAction;


[
    _object                    		// * 0: Object the action should be assigned to <OBJECT>
    ,0                         		    // * 1: Type of action, 0 for actions, 1 for self-actions <NUMBER>
    ,["ACE_MainActions"]             	// * 2: Parent path of the new action <ARRAY> (Example: ["ACE_SelfActions", "ACE_Equipment"])
    ,_aceAction    	         			// * 3: Action <ARRAY>    
] call ace_interact_menu_fnc_addActionToObject;

ZRN_LOG_MSG(END);