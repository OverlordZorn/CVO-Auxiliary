class CfgFunctions
{
	class ADDON            // Tag
	{
		class COMPONENT           // Category
		{
			file = PATH_TO_FUNC;

            class add_playlist {};

            class define_playlists { preInit = 1; };
			class postInit { postInit = 1; };
			
            class songFromPlaylist {};
    	    class play {};

            class fadeStop {};
		};
	}; 
};