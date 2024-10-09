class CfgFunctions
{
    class ADDON
    {
        class COMPONENT
        {

            file = PATH_TO_FUNC;

            // class missionSetup { preInit = 1; }; // For the Mod, this will only be acting as example-template

            class init_CEH { preInit = 1; };

            class register {};
            class defaultEntry {};
            class createZeusInteraction {};

            class defineTarget {};
            class getPosFromMap {};
            class dispatchAircraft {};

            class dropCrate {};
            class fillCrate {};

        };
    };
};