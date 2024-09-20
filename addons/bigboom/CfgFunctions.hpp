class CfgFunctions
{
	class PREFIX            // Tag
	{
        tag = ADDON;
		class COMPONENT           // Category
		{
			file = PATH_TO_FUNC;

            class init_cba_eh { postInit = 1; };

    	    class prep {};
    	    class local_effects {};
		};
	}; 
};