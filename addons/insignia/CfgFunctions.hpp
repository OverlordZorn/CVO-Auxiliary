class CfgFunctions
{
	class PREFIX
    {
        tag = ADDON;
		class COMPONENT
        {
			file = PATH_TO_FUNC;

			class postInit { postInit = 1; };

			class eh_arsenal {};
			class eh_group {};

            class autoAssign {};

			class identify {};
			class apply {};
		};
	};
};
