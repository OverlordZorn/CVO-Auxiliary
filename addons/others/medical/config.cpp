class CfgPatches
{
	class CVO_Others_Medical
	{
		// Use meta information from specified addon. Used to avoid repeated declarations.
		addonRootClass = "CVO_Others";

		requiredVersion = 2.00;
		requiredAddons[] = { "CVO_Others" };
		units[] = {};
		weapons[] = {};
	};
};

class CfgSounds
{
	sounds[] = {}; // OFP required it filled, now it can be empty or absent depending on the game's version

	class cvo_healsound
	{
		name = "cvo_healsound";															// display name
		sound[] = { "z\cvo_aux\addons\others\medical\medical_healsound.ogg", 1, 1, 100 };	// file, volume, pitch, maxDistance
		titles[] = { 0, "[Healsound]" };												// subtitles

		forceTitles = 0;			// Arma 3 - display titles even if global show titles option is off (1) or not (0)
		titlesStructured = 0;		// Arma 3 - treat titles as Structured Text (1) or not (0)
	};
};


class CfgFunctions
{
	class CVO            // Tag
	{
		class Medical           // Category
		{
			class fullHeal      // Function name -> Final Function will be: TAG_FNC_FunctionName
			{
				file = "z\cvo_aux\addons\others\medical\fnc_fullHeal.sqf";  
			};
		};
	}; 
};