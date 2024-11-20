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

		class Arsenal_Tabs
		{
			file = PATH_TO_FUNC_SUB(arsenal_tabs);
			requiredAddons[] = {"cvo_main",  "greenmag_main" };
			class greenmag { postInit = 1; };
		};
	};
};