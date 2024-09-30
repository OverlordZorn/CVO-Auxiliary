#include "script_component.hpp"

class CfgPatches {
	class ADDON {

        // Meta information for editor
		name = ADDON_NAME;
		author = "$STR_cvo_Author";
        authors[] = {"OverlordZorn [CVO]"};
		
        url = "$STR_cvo_URL";

		VERSION_CONFIG;

        // Addon Specific Information
        // Minimum compatible version. When the game's version is lower, pop-up warning will appear when launching the game.
        requiredVersion = 2.02;

        // Required addons, used for setting load order.
        // When any of the addons is missing, pop-up warning will appear when launching the game.
        requiredAddons[] = {"cba_common"};
        
        // List of objects (CfgVehicles classes) contained in the addon. Important also for Zeus content (units and groups)
        units[] = {};

        // List of weapons (CfgWeapons classes) contained in the addon.
        weapons[] = {};
    };
};


#include "CfgFunctions.hpp"
#include "CfgMusic.hpp"
#include "CfgMusicClasses.hpp"

#include "XEH_preInit.hpp"
