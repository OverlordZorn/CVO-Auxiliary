class CfgPatches {

	class CVO_Fonts
	{
		// Meta information for editor
        name = "CVO Insignias";
		version = "1.0.0";

		authors[]= {"Overlord Zorn [CVO]"};
        url = "http://chronivoron.net";

        // Minimum compatible version. When the game's version is lower, pop-up warning will appear when launching the game.
        requiredVersion = 2.0;

        // Required addons, used for setting load order.
        // When any of the addons is missing, pop-up warning will appear when launching the game.
        requiredAddons[] = {};

		// Optional. If this is 1, if any of requiredAddons[] entry is missing in your game the entire config will be ignored and return no error (but in rpt) so useful to make a compat Mod (Since Arma 3 2.14)
		skipWhenMissingDependencies = 1;
        
        // List of objects (CfgVehicles classes) contained in the addon. Important also for Zeus content (units and groups)
        units[] = {};

        // List of weapons (CfgWeapons classes) contained in the addon.
        weapons[] = {};

	};

};

class CfgFontFamilies
{
	class VTKSSMASH
	{
        fonts[] =
        {
            "CVO_AUX\Fonts\VTKSSMASH\VTKSSMASH10",
            "CVO_AUX\Fonts\VTKSSMASH\VTKSSMASH11",
            "CVO_AUX\Fonts\VTKSSMASH\VTKSSMASH12",
            "CVO_AUX\Fonts\VTKSSMASH\VTKSSMASH13",
            "CVO_AUX\Fonts\VTKSSMASH\VTKSSMASH14",
            "CVO_AUX\Fonts\VTKSSMASH\VTKSSMASH15",
            "CVO_AUX\Fonts\VTKSSMASH\VTKSSMASH16",
            "CVO_AUX\Fonts\VTKSSMASH\VTKSSMASH17",
            "CVO_AUX\Fonts\VTKSSMASH\VTKSSMASH18",
            "CVO_AUX\Fonts\VTKSSMASH\VTKSSMASH19",
            "CVO_AUX\Fonts\VTKSSMASH\VTKSSMASH20",
            "CVO_AUX\Fonts\VTKSSMASH\VTKSSMASH21",
            "CVO_AUX\Fonts\VTKSSMASH\VTKSSMASH22",
            "CVO_AUX\Fonts\VTKSSMASH\VTKSSMASH23",
            "CVO_AUX\Fonts\VTKSSMASH\VTKSSMASH24",
            "CVO_AUX\Fonts\VTKSSMASH\VTKSSMASH25",
            "CVO_AUX\Fonts\VTKSSMASH\VTKSSMASH26",
            "CVO_AUX\Fonts\VTKSSMASH\VTKSSMASH27",
            "CVO_AUX\Fonts\VTKSSMASH\VTKSSMASH28",
            "CVO_AUX\Fonts\VTKSSMASH\VTKSSMASH29",
            "CVO_AUX\Fonts\VTKSSMASH\VTKSSMASH30",
            "CVO_AUX\Fonts\VTKSSMASH\VTKSSMASH31",
            "CVO_AUX\Fonts\VTKSSMASH\VTKSSMASH32",
            "CVO_AUX\Fonts\VTKSSMASH\VTKSSMASH33",
            "CVO_AUX\Fonts\VTKSSMASH\VTKSSMASH34",
            "CVO_AUX\Fonts\VTKSSMASH\VTKSSMASH35",
            "CVO_AUX\Fonts\VTKSSMASH\VTKSSMASH36",
            "CVO_AUX\Fonts\VTKSSMASH\VTKSSMASH37",
            "CVO_AUX\Fonts\VTKSSMASH\VTKSSMASH38",
            "CVO_AUX\Fonts\VTKSSMASH\VTKSSMASH39",
            "CVO_AUX\Fonts\VTKSSMASH\VTKSSMASH40",
            "CVO_AUX\Fonts\VTKSSMASH\VTKSSMASH42",
            "CVO_AUX\Fonts\VTKSSMASH\VTKSSMASH44",
            "CVO_AUX\Fonts\VTKSSMASH\VTKSSMASH46",
            "CVO_AUX\Fonts\VTKSSMASH\VTKSSMASH48",
            "CVO_AUX\Fonts\VTKSSMASH\VTKSSMASH50",
            "CVO_AUX\Fonts\VTKSSMASH\VTKSSMASH54",
            "CVO_AUX\Fonts\VTKSSMASH\VTKSSMASH58",
            "CVO_AUX\Fonts\VTKSSMASH\VTKSSMASH60",
            "CVO_AUX\Fonts\VTKSSMASH\VTKSSMASH64",
            "CVO_AUX\Fonts\VTKSSMASH\VTKSSMASH70",
            "CVO_AUX\Fonts\VTKSSMASH\VTKSSMASH80",
            "CVO_AUX\Fonts\VTKSSMASH\VTKSSMASH90",
            "CVO_AUX\Fonts\VTKSSMASH\VTKSSMASH100"
        };
    };
};
