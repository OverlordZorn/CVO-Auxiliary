class CfgFunctions
{
	class ADDON            // Tag
	{
		class COMPONENT           // Category
		{
			file = PATH_TO_FUNC;
            class postInit { postInit = 1; };

			class eventHandlers { postInit = 1; };
			class saveStartingLoadout { postInit = 1; };

			class open	{};
			class update  {};
			class addAction {};
		};

		class Arsenal_Tabs
		{
			file = PATH_TO_FUNC_SUB(arsenal_tabs);
			class greenmag { postInit = 1; };
		};

        class missionConfig
        {
            file = PATH_TO_FUNC_SUB(missionConfig);
            class missionConfig { postInit = 1; };
        };
	};
};