class CfgFunctions
{
<<<<<<< Updated upstream
    class ADDON
    {
        class COMPONENT
        {

            file = PATH_TO_FNC;
=======
    class PREFIX
    {
        tag = ADDON;
        class COMPONENT
        {

            file = PATH_TO_FUNC;
>>>>>>> Stashed changes

            class init_cba_eh { postInit = 1; };
            
            class prep {};

            class global_effects {};
            class local_effects {};
            class local_smoke {};
            class local_rocks {};
        };
    };
};