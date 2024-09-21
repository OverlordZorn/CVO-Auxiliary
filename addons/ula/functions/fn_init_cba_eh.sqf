#include "..\script_component.hpp"

// Server Event
if (isNil QGVAR(EHID_reveal)    ) then { GVAR(EHID_reveal) = [QGVAR(EH_reveal_object), FUNC(reveal_object)] call CBA_fnc_addEventHandler; }; // Server Event, Headless or PlayerServer

// Player Events
if (isNil QGVAR(EHID_add_action)) then { GVAR(EHID_add_action) = [QGVAR(EH_add_action), FUNC(add_action)] call CBA_fnc_addEventHandler; }; // this needs to be executed on all clients
if (isNil QGVAR(EHID_meme)      ) then { GVAR(EHID_meme) = [QGVAR(EH_playSound), FUNC(play_sound)] call CBA_fnc_addEventHandler; }; // this needs to be executed on all clientsGVAR()