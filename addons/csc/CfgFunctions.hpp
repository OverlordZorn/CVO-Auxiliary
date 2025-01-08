class CfgFunctions
{
	class ADDON            // Tag
	{
		class DOUBLES(COMPONENT,old)           // Category
		{
			file = PATH_TO_FUNC_SUB(old);
			class addCSC {};
		};

		class DOUBLES(COMPONENT,internal)           // Category
		{
			file = PATH_TO_FUNC_SUB(internal);

            class preInit { preInit = 1; };

            class catalog {};
            class getCatName {};

            class createAction {};

            class request {};
            class request_server {};

            class getPos {};
            class createCrate {};
		};

		class DOUBLES(COMPONENT,airdrop)           // Category
		{
			file = PATH_TO_FUNC_SUB(airdrop);

            class getPosFromMap {};
			class dispatch {};
            class dropCrate {};

            class request_airdrop {};
		};
        class DOUBLES(COMPONENT,missionConfig)
        {
            file = PATH_TO_FUNC_SUB(missionConfig);
            class updateDefault { preInit = 1; };
            class importPresets { postInit = 1; };
        };

        class COMPONENT
        {
            file = PATH_TO_FUNC;

            class defaultEntry {};
            class register {};
            class link {};
        };
    };
};