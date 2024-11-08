class CfgFunctions
{
	class ADDON            // Tag
	{
        class debug
        {
            file = PATH_TO_FUNC_SUB(debug);
            class getTrackDuration {  };
            class test {  };
        };

        class config
        {
            file = PATH_TO_FUNC_SUB(config);

            class initial_playlists { preInit = 1; };
            class fromConfig {};
            class getName {};
            class addonLoaded {};
        };

        class internal
        {
            file = PATH_TO_FUNC_SUB(internal);

            class init_zeusAction { postInit = 1; };
            
            class init_musicEventHandlers { preInit = 1; };
            class init_cbaEvents { preInit = 1; };
            

            class createAction {};
            class catalog {};
            class publicArray {};
            class queue {};
            class request {};
            class select {};
            class verify {};
            class play {};


        };

        class remote
        {
            file = PATH_TO_FUNC_SUB(remote);
            class request_server {};
            class update_server {};
            class fade_client {};
            class play_client {};
        };
	}; 
};