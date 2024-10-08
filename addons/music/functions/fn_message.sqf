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

switch (SET(delivery_method)) do {
    case "SYSTEMCHAT":  { systemChat _message };
    case "HINT":        { hint       _message };
    case "DIAG_LOG":    { diag_log   "[CVO][MUSIC]" + _message };
    default { systemChat _message };
};