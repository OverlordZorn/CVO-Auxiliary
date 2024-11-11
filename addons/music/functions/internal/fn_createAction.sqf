#include "../../script_component.hpp"

/*
* Author: Zorn
* Returns the ace action that will be attached to zeus later
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


private _insertChildren = {

    params ["_target", "_player", "_actionParams"];
    private _actions = [];


    private _code = {
        params ["_target", "_player", "_actionParams"];
        _actionParams params ["_mode"];
        [_mode] call FUNC(request);
    };


    // Add "NEXT" "FADENEXT" "FADECLEAR"
    {
        private _aceAction = [
            QGVAR(_x#0)                               // * 0: Action name <STRING>
            ,_x#1                                     //  * 1: Name of the action shown in the menu <STRING>
            ,"\A3\ui_f\data\igui\cfg\simpleTasks\types\exit_ca.paa" //  * 2: Icon <STRING> "\A3\ui_f\data\igui\cfg\simpleTasks\types\backpack_ca.paa"
            ,_code                                  //  * 3: Statement <CODE>
            ,{true}                                 //  * 4: Condition <CODE>
            ,{}                                     //  * 5: Insert children code <CODE> (Optional)
            ,_x#0                                     //  * 6: Action parameters <ANY> (Optional)
        ] call ace_interact_menu_fnc_createAction;
        _actions pushBack [_aceAction, [],_target];        
    } forEach [["FADENEXT","FadeStop and play Next"],["FADECLEAR","FadeStop and Clear the Queue"]];

    private _playlistChildren = {

        params ["_target", "_player", "_actionParams"];
        private _actions = [];

        private _code = {
            params ["_target", "_player", "_actionParams"];
            _actionParams params ["_mode"];
            [_mode] call FUNC(request);
        };

        {
            private _playlistAction = [
                QGVAR(_x)                               // * 0: Action name <STRING>
                ,[_x] call FUNC(getPlaylistName)                //  * 1: Name of the action shown in the menu <STRING> 
                ,""                                     //  * 2: Icon <STRING> "\A3\ui_f\data\igui\cfg\simpleTasks\types\backpack_ca.paa"
                ,_code                                  //  * 3: Statement <CODE>
                ,{true}                                 //  * 4: Condition <CODE>
                ,{}                                     //  * 5: Insert children code <CODE> (Optional)
                ,_x                                     //  * 6: Action parameters <ANY> (Optional)
            ] call ace_interact_menu_fnc_createAction;
            _actions pushBack [_playlistAction, [],_target];            // Current result is saved in variable _x
            
        } forEach GETMGVAR(public_keys,[]);

        _actions
    };


    private _playlistNodeAction = [
        QGVAR(playlist_node)                    // * 0: Action name <STRING>
        ,"Playlists"                            //  * 1: Name of the action shown in the menu <STRING>
        ,"\A3\ui_f\data\igui\cfg\simpleTasks\types\documents_ca.paa"                                     //  * 2: Icon <STRING> "\A3\ui_f\data\igui\cfg\simpleTasks\types\backpack_ca.paa"
        ,{}                                     //  * 3: Statement <CODE>
        ,{true}                                 //  * 4: Condition <CODE>
        ,_playlistChildren                                   //  * 5: Insert children code <CODE> (Optional)
    ] call ace_interact_menu_fnc_createAction;

    _actions pushBack [_playlistNodeAction, [], _target]; // New action, it's children, and the action's target

    _actions
};

private _aceAction = [
    QGVAR(node)                                         // * 0: Action name <STRING>
    ,"CVO Music"                                        //  * 1: Name of the action shown in the menu <STRING>
    ,"z\cvo\addons\branding\data\Raven_Voron_256.paa"   //  * 2: Icon <STRING> "\A3\ui_f\data\igui\cfg\simpleTasks\types\backpack_ca.paa"
    ,{}                                                 //  * 3: Statement <CODE>
    ,{true}                                             //  * 4: Condition <CODE>
    ,_insertChildren                                    //  * 5: Insert children code <CODE> (Optional)
] call ace_interact_menu_fnc_createAction;

_aceAction