#include "../script_component.hpp"

/*
* Author: Zorn
* Function to get the player object from the server
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* ["123123123"] call cvo_common_fnc_getplayerIDobject;
*
* Public: Yes
*/

params ["_playerID", "", [""]];

if (_playerID == "") exitWith { objNull };

private _allPlayers = allPlayers;

private _index = _allPlayers findIf {_playerID isEqualTo getPlayerID _x};

private _object = if (_index isEqualTo -1) then { objNull } else { _allPlayers select _index };

_object