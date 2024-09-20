#include "script_component.hpp"

class CfgPatches
{
    class cvo_bigBoom
    {
        // Meta information for editor
        name = "CVO BigBoom";
        authors[] = {"Overlord Zorn"};
        url = "http://chronivoron.net";

        // Minimum compatible version. When the game's version is lower, pop-up warning will appear when launching the game.
        requiredVersion = 2.0;

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