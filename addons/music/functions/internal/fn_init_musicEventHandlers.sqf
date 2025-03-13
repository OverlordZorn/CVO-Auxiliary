#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to add musicEventHandlers
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

if !(hasInterface) exitWith {};

addMusicEventHandler ["MusicStart", {
    ZRN_LOG_MSG_1(mEH triggered - started,_this);
	params ["_musicClassname", "_eventHandlerId", "_currentPosition", "_totalLength"];

    private _completedAt = CBA_MissionTime + _totalLength - linearConversion [0,1,_currentPosition,0,_totalLength,true];

    [_completedAt] call FUNC(serverUpdate_buffer);
    [_musicClassname] call FUNC(updateHistory);
}];


addMusicEventHandler ["MusicStop", {
	ZRN_LOG_MSG_1(mEH triggered - stopped,_this);
    params ["_musicClassname", "_eventHandlerId", "_currentPosition", "_totalLength"];
    
    private _completedAt = -1;
    [_completedAt] call FUNC(serverUpdate_buffer);

}];