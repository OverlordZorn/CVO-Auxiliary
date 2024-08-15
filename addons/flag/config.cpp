#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		author = "$STR_cvo_Author";
		name = QUOTE(ADDON);
		url = "$STR_cvo_URL";
		requiredVersion = 2.0;
		requiredAddons[] = {"cvo_aux_main", "A3_Structures_F_Mil_Flags"};
		units[] = {QGVAR(red)};
		weapons[] = {};
		VERSION_CONFIG;
        authors[] = {"OverlordZorn [CVO], DerZade [A]"};
	};
};

#include "cfgVehicles.hpp"
