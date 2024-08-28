class CfgPatches {

	class CVO_Others
	{
		// Meta information for editor
        name = "CVO Others";
		version = "1.0.0";

		author[]= {"Overlord Zorn [CVO]"};
        url = "http://chronivoron.net";

        // Minimum compatible version. When the game's version is lower, pop-up warning will appear when launching the game.
        requiredVersion = 2.0;

        // Required addons, used for setting load order.
        // When any of the addons is missing, pop-up warning will appear when launching the game.
        requiredAddons[] = {"ace_medical", "ace_interaction","cba_common"};

		// Optional. If this is 1, if any of requiredAddons[] entry is missing in your game the entire config will be ignored and return no error (but in rpt) so useful to make a compat Mod (Since Arma 3 2.14)
		skipWhenMissingDependencies = 1;
        
        // List of objects (CfgVehicles classes) contained in the addon. Important also for Zeus content (units and groups)
        units[] = {};

        // List of weapons (CfgWeapons classes) contained in the addon.
        weapons[] = {};

	};

};


class CfgFunctions
{
	class CVO_Common            // Tag
	{
		class Common           // Category
		{
            file = "z\cvo_aux\addons\others\functions";
            class executeUnit {};
            class airlift_cargo {};
            class slingload_cargoOwner {};
		};
	}; 
};




/*
class CfgMarkers
{
	#include "markers.hpp"	
};
*/