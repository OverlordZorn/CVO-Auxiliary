#include "../script_component.hpp"


// 1. Transaction. Requester -> Provider - Request kicks of the process
[QGVAR(EH_1_request), FUNC(process)] call CBA_fnc_addEventHandler;


// 2. Transaction. Provider -> Requester  - Deliver kicks of the recieve
[QGVAR(EH_2_deliver), FUNC(recieve)] call CBA_fnc_addEventHandler;
