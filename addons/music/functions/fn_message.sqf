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

ZRN_LOG_1(_this);
if !(SET(enabled)) exitWith {
    ZRN_LOG_MSG(turned off);
};

private _mode = SET(delivery_method);

if (_mode in ["DIAG_LOG"]) then {
    _message = "[CVO][MUSIC] " + _message;
};

_test = _mode in ["HINT", "HINTSILENT"];
ZRN_LOG_2(_mode,_test);

if (_mode in ["HINT", "HINTSILENT"]) then {

    _message = format ["<t size='1.1' align='center' color='#ffa500'>%1</t>", _message];

    private _backlog = [_message] call FUNC(message_backlog);

    private _array = ["<img size='4' image='\z\CVO\addons\branding\data\Raven_Voron_512.paa'/><br/><t font='VTKSSMASH' size='2' align='center' color='#ffa500'>CVO MUSIC</t>"];
    
    _array append _backlog;

    ZRN_LOG_2(_array,_backlog);

    private _str = parseText (_array joinString "<br/>");
};

ZRN_LOG_2(_message,_str);

switch (_mode) do {
    case "HINT":        { hint       _str     };
    case "DIAG_LOG":    { diag_log   _message };
    case "HINTSILENT":  { hintSilent _str     };
    case "SYSTEMCHAT":  { systemChat _message };
};