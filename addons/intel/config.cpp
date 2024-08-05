class CfgPatches
{
    class cvo_intel
    {
        // Meta information for editor
        name = "CVO Intel";
        authors[] = {"Overlord Zorn"};
        url = "http://chronivoron.net";

        // Minimum compatible version. When the game's version is lower, pop-up warning will appear when launching the game.
        requiredVersion = 2.0;

        // Required addons, used for setting load order.
        // When any of the addons is missing, pop-up warning will appear when launching the game.
        requiredAddons[] = {"cba_common","ace_marker_flags"};
        
        // List of objects (CfgVehicles classes) contained in the addon. Important also for Zeus content (units and groups)
        units[] = {};

        // List of weapons (CfgWeapons classes) contained in the addon.
        weapons[] = {};
    };
};


class CfgFunctions
{
	class CVO_Intel            // Tag
	{
		class Flags           // Category
		{
			file = "z\cvo_aux\addons\intel\functions";

    	    class postInit { postInit = 1; };

    	    class createFlagMarker {};
    	    class findAllFlags {};
		};
	}; 
};

class Extended_PreInit_EventHandlers {
    class CVO_Music_CBA_Settings_XHE_PreInit {
        init = "call compile preprocessFileLineNumbers 'z\cvo_aux\addons\intel\XEH_preInit.sqf'";
    };
};