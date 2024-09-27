#include "../script_component.hpp"

/*
* Author: Zorn
* Initilizes the basic framework and creates the zeus interaction
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

// ############################################################
// ###### Add CBA Event
// ############################################################

[QGVAR(EH_MusicStopped), {
    // Deletes JIP ID
    [QGVAR(JIP_playMusic)] call CBA_fnc_removeGlobalEventJIP;
    GVAR(isPlaying) = false;

    // Define Delay and Execute "NEXT" on the server with cba_fnc_waitAndExecute
    private _delay = SET(delay_min) + (ceil random SET(delay_random));
    [{	["NEXT"] call FUNC(play);	}, [], _delay ] call CBA_fnc_waitAndExecute;	
    diag_log format ["[CVO][Music](CBAEvent)(Next) Delay until Next Song: %1 -- Music Queue: %2", _delay, GVAR(Queue)];

}] call CBA_fnc_addEventHandler;

[QGVAR(EH_MusicStarted), {
    params ["_musicClassname"];

    GVAR(isPlaying) = true;

    /*
    private _path = (configFile >> "CfgMusic" >> _musicClassname);
    _duration = [_path,"duration", 60*15] call BIS_fnc_returnConfigEntry;
    */



}] call CBA_fnc_addEventHandler;



[QGVAR(EH_play), FUNC(play)] call CBA_fnc_addEventHandler;
[QGVAR(EH_fadeStop), FUNC(fadeStop)] call CBA_fnc_addEventHandler;
[QGVAR(EH_playMusic), { if !(hasInterface) exitWith {}; playMusic _this; }] call CBA_fnc_addEventHandler;
[QGVAR(EH_playlist),FUNC(songFromPlaylist)] call CBA_fnc_addEventHandler;




if (isServer) then {GVAR(Queue) = []; GVAR(isPlaying) = false;};

// ############################################################
// ###### Adds CLIENT Music Event Handler
// ############################################################

if (hasInterface) then {

    addMusicEventHandler ["MusicStart", { 
        params ["_musicClassname", "_ehId"];

        _path = (configFile >> "CfgMusic" >> _musicClassname);
        _name = [_path,"name", "Not Found"] call BIS_fnc_returnConfigEntry;

        _str = switch (missionNamespace getVariable [QSET(displayMusic_Type), "NAME"]) do {
            case "NAME": { _name };
            default { _musicClassname };
        };

        // Only the client with the oldest Steam64ID will execute the CBA Event to avoid multiple executions
        private _array = call BIS_fnc_listPlayers apply { getPlayerUID _x };
        _array sort true;
       
        if (getPlayerUID player == _array select 0) then {
            [QGVAR(EH_MusicStarted), _musicClassname] call CBA_fnc_serverEvent;
        };

        if (SET(displayMusic)) then { systemChat format ["[CVO][Music] Now Playing: %1", _str];	};
        if (SET(displayMusic_LowVolume) && getAudioOptionVolumes#1 < 0.05) 	then {	systemChat format ["[CVO][Music] Your Music Volume is low @ %1%2", floor((getAudioOptionVolumes#1)*1000)/10,"%"];	}; 
    }];

    addMusicEventHandler ["MusicStop", { 
        params ["_musicClassname", "_ehId"];
        diag_log format ["[CVO][Music](Stopped) %1", _musicClassname];

        // Only the client with the oldest Steam64ID will execute the CBA Event to avoid multiple executions
        private _array = call BIS_fnc_listPlayers apply { getPlayerUID _x };
        _array sort true;
        
        if (getPlayerUID player == _array select 0) then {
            [QGVAR(EH_MusicStopped)] call CBA_fnc_serverEvent;
        };
    }];
};

// ############################################################
// ###### Adds Zeus Interaction Nodes
// ############################################################

// ############################################################
// ###### Adds Zeus Parent Node
    _action = [
        QGVAR(zeus_node),
        "CVO Music",
        "z\cvo\addons\branding\data\Raven_Voron_256.paa",
        {},
        {true}
        ] call ace_interact_menu_fnc_createAction;
    [["ACE_ZeusActions"], _action] call ace_interact_menu_fnc_addActionToZeus;

// ###### FadeStop
    _action = ["cvo_music_zeus_fadeFade","FadeStop Next","\A3\ui_f\data\igui\cfg\simpleTasks\types\exit_ca.paa",
    { [QGVAR(EH_play), "fadeStop"] call CBA_fnc_serverEvent; },{true}] call ace_interact_menu_fnc_createAction;
    [["ACE_ZeusActions",QGVAR(zeus_node)], _action] call ace_interact_menu_fnc_addActionToZeus;

    _action = ["cvo_music_zeus_fadeFadeClear","FadeStop and Clear the Queue","\A3\ui_f\data\igui\cfg\simpleTasks\types\exit_ca.paa",
    { [QGVAR(EH_play), "fadeStopClear"] call CBA_fnc_serverEvent; },{true}] call ace_interact_menu_fnc_createAction;
    [ ["ACE_ZeusActions",QGVAR(zeus_node)], _action] call ace_interact_menu_fnc_addActionToZeus;

// ############################################################
// ###### Adds Zeus Playlist Node

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

/*
 * Argument:
 * 0: Action name <STRING>
 * 1: Name of the action shown in the menu <STRING>
 * 2: Icon <STRING>
 * 3: Statement <CODE>
 * 4: Condition <CODE>
 * 5: Insert children code <CODE> (Optional)
 * 6: Action parameters <ANY> (Optional)
 * 7: Position (Position array, Position code or Selection Name) <ARRAY>, <CODE> or <STRING> (Optional)
 * 8: Distance <NUMBER> (Optional)
 * 9: Other parameters [showDisabled,enableInside,canCollapse,runOnHover,doNotCheckLOS] <ARRAY> (Optional)
 * 10: Modifier function <CODE> (Optional)
 */

_action = [
    QGVAR(zeus_playlists),                                          // name
    "Playlists",                                                    // title
    "\A3\ui_f\data\igui\cfg\simpleTasks\types\documents_ca.paa",    // Icon
    {},                                                           // Statement
    {true},                                                         // Condition
    _insertChildren                                                 // Insert children Code
] call ace_interact_menu_fnc_createAction;

[["ACE_ZeusActions",QGVAR(zeus_node)], _action] call ace_interact_menu_fnc_addActionToZeus;


