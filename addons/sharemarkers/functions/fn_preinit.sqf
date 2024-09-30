#include "../script_component.hpp"


// 1. Transaction. Requester -> Provider - expresses interest at the provider
[QGVAR(EH_1_initial_request), ""] call CBA_fnc_addEventHandler;

// 2. Transaction. Provider -> Requester - Returns available markers based on type
[QGVAR(EH_2_offer), ""] call CBA_fnc_addEventHandler;

// 3. Transaction. Requester -> Provider - compares known with unkown markers
[QGVAR(EH_3_compare), ""] call CBA_fnc_addEventHandler;

// 4. Transaction. Requester
[QGVAR(EH_4_order), ""] call CBA_fnc_addEventHandler;
