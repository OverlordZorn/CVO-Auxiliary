class CfgFunctions
{
	class ADDON            // Tag
	{
		class COMPONENT           // Category
		{
			file = PATH_TO_FUNC;

		};
        class markerFlags
        {
            file = PATH_TO_FUNC_SUB(markerFlags);

    	    class postInit { postInit = 1; };
    	    class createFlagMarker {};
    	    class findAllFlags {};
        };
        class intel_objects
        {
            file = PATH_TO_FUNC_SUB(intel_objects);

            class init { postInit = 1; };

            class createIntel {};

            class addIntelEntry {};
            class addIntelAction {};

            class addIntelToGroup {};

            class addDeletedEH {};
            class checkGroup {};
            class diary_createSubject {};
            class diary_getText {};
            class diary_setRecordText {};
            class diary_updateRecord {};
        };        
	}; 
};