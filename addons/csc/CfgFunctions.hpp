class CfgFunctions
{
	class ADDON            // Tag
	{
		class COMPONENT           // Category
		{
			file = PATH_TO_FUNC_SUB(old);
			class createNode {};
			class addCSC {};
            class spawnCSC {};
		};
	};

    class cvo_csc2
    {
        class COMPONENT
        {
            file = PATH_TO_FUNC;

            class preInit { preInit = 1; };

            class catalog {};
            class defaultEntry {};
            class defaultEntry_update {};
            class createAction {};

            class register {};
            class link {};
            class request {};
        };
    };
};