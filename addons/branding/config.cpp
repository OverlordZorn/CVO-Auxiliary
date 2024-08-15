#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		author = "$STR_cvo_Author";
		name = QUOTE(ADDON);
		url = "$STR_cvo_URL";
		requiredVersion = 2.0;
		requiredAddons[] = {"cvo_aux_main", "A3_Structures_F_Mil_Flags"};
		units[] = 
        {
            QGVAR(Flag_Red),
            QGVAR(Flag_Olive),

            QGVAR(Banner_Red),
            QGVAR(Banner_Olive),

            QGVAR(Leadership_Portrait)
        };
		weapons[] = {};
		VERSION_CONFIG;
        authors[] = {"OverlordZorn [CVO]"};
	};
};

#include "cfgVehicles.hpp"
