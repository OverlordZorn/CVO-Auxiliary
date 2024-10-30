class CfgFunctions
{
	class ADDON            // Tag
	{
		class cvo_csc_old           // Category
		{
			file = PATH_TO_FUNC_SUB(old);
			class createNode {};
			class addCSC {};
            class spawnCSC {};
		};

        class COMPONENT
        {
            file = PATH_TO_FUNC;

            class preInit { preInit = 1; };

            class catalog {};
            class getCatName {};
            class defaultEntry {};
            class createAction {};

            class register {};
            class link {};
            class request {};
        };
    };
};