#include "..\script_component.hpp"


if (!hasInterface) exitWith {};

if (isNil "CVO_ULA_EHID_reveal"    ) then { CVO_ULA_EHID_reveal = ["cvo_ula_EH_reveal_object", cvo_ula_fnc_reveal_object] call CBA_fnc_addEventHandler; }; // this needs to be executed on all clients
if (isNil "CVO_ULA_EHID_add_action") then { CVO_ULA_EHID_add_action = ["cvo_ula_EH_add_action", cvo_ula_fnc_add_action] call CBA_fnc_addEventHandler; }; // this needs to be executed on all clients
if (isNil "CVO_ULA_EHID_meme"      ) then { CVO_ULA_EHID_meme = ["cvo_ula_EH_playSound", cvo_ula_fnc_play_sound] call CBA_fnc_addEventHandler; }; // this needs to be executed on all clients
