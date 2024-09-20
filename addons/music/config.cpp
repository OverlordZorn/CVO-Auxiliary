class CfgPatches
{
    class cvo_music
    {
        // Meta information for editor
        name = "CVO Music";
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


class CfgMusic
{
	#include "cvo_CfgMusicTracks.hpp"
};

class CfgMusicClasses
{
	class cvo_musicClass
	{
		displayName = "24th Chorni Voron Music";
	};
   	class desiderii_Procession
	{
		displayName = "Desiderii Marginis - Procession";
	};
   	class desiderii_BlackLight
	{
		displayName = "Desiderii Marginis - Bathe in Black Light";
	};
    class OmnistarEast
	{
		displayName = "Omnistar East";
	};
    class GameOST
	{
		displayName = "Game Soundtracks";
	};
    class Others
	{
		displayName = "Others";
	};


};



class CfgFunctions
{
	class CVO_Music            // Tag
	{
		class Music           // Category
		{
			file = "z\cvo\addons\music\functions";
			class playlist	    {    postInit = 1;  };
    	    class play          {   };
            class fadeStop      {   };
		};
	}; 
};


class Extended_PreInit_EventHandlers {
    class CVO_Music_CBA_Settings_XHE_PreInit {
        init = "call compile preprocessFileLineNumbers 'z\cvo\addons\music\XEH_preInit.sqf'";
    };
};