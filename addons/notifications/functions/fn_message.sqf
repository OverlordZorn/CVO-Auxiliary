#include "../script_component.hpp"

/*
* Author: Zorn
* Function to send a flexible Message to the based on CBA Settings
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


params [
    ["_message", "", [""]]
];

if !(SET(enabled)) exitWith {};

private _mode = SET(message_type);

if (_mode in ["DIAG_LOG"]) then {
    _message = "[CVO][MUSIC] " + _message;
};

if (_mode in ["HINT", "HINTSILENT"]) then {

    _message = format ["<t size='0.8' align='center' color='#ffa500'>%1</t>", _message];
    private _backlog = [_message] call FUNC(message_backlog);
    private _array = ["<img size='4' image='\z\CVO\addons\branding\data\Raven_Voron_512.paa'/><br/><t font='VTKSSMASH' size='2' align='center' color='#ffa500'>CVO MUSIC</t><br/>"];
    _array append _backlog;
    _message = (_array joinString "<br/>");
};


switch (_mode) do {
    case "HINT":        { hint parseText       _message };
    case "DIAG_LOG":    { diag_log             _message };
    case "HINTSILENT":  { hintSilent parseText _message };
    case "SYSTEMCHAT":  { systemChat           _message };
};