class CfgFunctions
{
	class PREFIX            // Tag
	{
        tag = ADDON;
		class COMPONENT           // Category
		{
			file = PATH_TO_FUNC;

    	    class postInit { postInit = 1; };

    	    class createFlagMarker {};
    	    class findAllFlags {};
		};
	}; 
};