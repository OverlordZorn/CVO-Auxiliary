#include "../script_component.hpp"

///// Player to Player Transfer

// 1. Transaction. Requester -> Provider - Request kicks of the process
[QGVAR(EH_P2P_1_request), FUNC(process)] call CBA_fnc_addEventHandler;
// 2. Transaction. Provider -> Requester  - Deliver kicks of the recieve
[QGVAR(EH_P2P_2_deliver), FUNC(recieve)] call CBA_fnc_addEventHandler;


///// Player to Server-Catalog Transfer

// 1. Transaction. Provider -> Server  Store Markers from Player on Server
[QGVAR(EH_SRV_1_provide), FUNC(toCatalog)] call CBA_fnc_addEventHandler;

// 2. Transaction. Requester -> Server - Request Data
[QGVAR(EH_SRV_2_request), FUNC(fromCatalog)] call CBA_fnc_addEventHandler;

// 3. Transaction. Server -> Requester  Store Markers from Player on Server
[QGVAR(EH_SRV_3_deliver), FUNC(recieve)] call CBA_fnc_addEventHandler;
