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
            QSPVAR(Flag_Red),
            QSPVAR(Flag_Olive),

            QSPVAR(Banner_Red),
            QSPVAR(Banner_Olive),

            QSPVAR(Portrait_Director)
        };
		weapons[] = {};
		VERSION_CONFIG;
        authors[] = {"OverlordZorn [CVO]"};
	};
};

#include "CfgVehicles.hpp"
#include "CfgMarkers.hpp"
