class CfgFunctions
{
	class ADDON            // Tag
	{
		class COMPONENT           // Category
		{
			file = PATH_TO_FUNC;

            class define_playlists { preInit = 1; };
			class postInit { postInit = 1; };

            class add_playlist {};
			
            class songFromPlaylist {};
    	    class play {};

            class fadeStop {};

            class message {};
		};
	}; 
};