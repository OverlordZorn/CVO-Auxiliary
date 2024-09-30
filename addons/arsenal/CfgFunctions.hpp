class CfgFunctions
{
	class ADDON            // Tag
	{
		class COMPONENT           // Category
		{
			file = PATH_TO_FUNC;


			class eventHandlers  { postInit = 1; };
			class saveStartingLoadout { postInit = 1; };

			class open	{};
			class update  {};
			class addArsenalInteraction {};
		};

		class Arsenal_GreenMag
		{
			file = PATH_TO_FUNC;
			requiredAddons[] = {"cvo_main",  "greenmag_main" };


			class greenmag_tab { postInit = 1; };
		};
	};
};