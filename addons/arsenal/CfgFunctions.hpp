class CfgFunctions
{
	class PREFIX            // Tag
	{
        tag = ADDON;
		class Arsenal           // Category
		{
			file = "z\cvo\addons\arsenal\functions";


			class eventHandlers  { postInit = 1; };
			class saveStartingLoadout { postInit = 1; };

			class open	{};
			class update  {};
			class addArsenalInteraction {};
		};

		class CVO_Arsenal_GreenMag
		{
			file = "z\cvo\addons\arsenal\functions";
			requiredAddons[] = { "greenmag_main" };


			class greenmag_tab { postInit = 1; };
		};
	};
};