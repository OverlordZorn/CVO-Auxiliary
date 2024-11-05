class CfgFunctions
{
	class ADDON            // Tag
	{
		class DOUBLES(COMPONENT,old)           // Category
		{
			file = PATH_TO_FUNC_SUB(old);

            class define_playlists { preInit = 1; };
			class postInit { postInit = 1; };

            class add_playlist {};
			
            class songFromPlaylist {};
    	    class play {};

            class fadeStop {};

            class message {};
            class message_backlog {};
		};
        class DOUBLES(COMPONENT,internal)
        {
            file = PATH_TO_FUNC_SUB(internal);

            class catalog {};
            class verify {};


        };
	}; 
};