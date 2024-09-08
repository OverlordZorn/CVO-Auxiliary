class CfgPatches {

	class CVO_Arsenal
	{
		// Meta information for editor
        name = "CVO Arsenal";
		version = "1.0.0";

		author = "Overlord Zorn [CVO]";
		authors[] = {"Overlord Zorn [CVO]"};
        url = "http://chronivoron.net";

        // Minimum compatible version. When the game's version is lower, pop-up warning will appear when launching the game.
        requiredVersion = 2.02;

        // Required addons, used for setting load order.
        // When any of the addons is missing, pop-up warning will appear when launching the game.
        requiredAddons[] = {"ace_interaction","ace_arsenal", "cba_common"};

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
	class CVO_Arsenal            // Tag
	{
		class Arsenal           // Category
		{
			file = "z\cvo_aux\addons\arsenal\functions";


			class eventHandlers  { postInit = 1; };
			class saveStartingLoadout { postInit = 1; };

			class open	{};
			class update  {};
			class addArsenalInteraction {};
		};

		class CVO_Arsenal_GreenMag
		{
			file = "z\cvo_aux\addons\arsenal\functions";
			requiredAddons[] = { "greenmag_main" };


			class greenmag_tab { postInit = 1; };
		};
	};
};

class Extended_PreInit_EventHandlers {
    class CVO_Arsenal_CBA_Settings_XHE_PreInit {
        init = "call compile preprocessFileLineNumbers 'z\cvo_aux\addons\arsenal\XEH_preInit.sqf'";
    };
};