class CfgVehicles
{
    // Flags with CVO Flag Texture
    class FlagCarrier_Asym;
    class GVAR(Flag_Red): FlagCarrier_Asym
    {
        _generalMacro=QGVAR(Flag_Red);

        author="$STR_cvo_Author";
        displayName="$STR_CVO_branding_red_display";
        scope = 2;
        scopeCurator = 2;


        class EventHandlers { init=QUOTE((_this select 0) setFlagTexture QUOTE(QPATHTOF(data\flag_voron_red_2048.paa))); };

        class ACE_Actions {
            class ACE_MainActions {
                displayName = ECSTRING(interaction,MainAction);
                condition = "true";
                position = "[-0.1, -0.35, -2.6]";
                distance = 2;
            };
        };
    };
    class GVAR(Flag_Olive) : GVAR(Flag_Red)
    {
        _generalMacro=QGVAR(Flag_Olive);
        displayName="$STR_CVO_branding_olive_display";
        class EventHandlers
        {
            init=QUOTE((_this select 0) setFlagTexture QUOTE(QPATHTOF(data\flag_voron_olive_2048.paa)));
        };
    };

    // A portrait of the oh so glorious leader
    class GalleryFrame_01_large_portrait_F;
    class GVAR(Leadership_Portrait) : GalleryFrame_01_large_portrait_F
    {
        _generalMacro=QGVAR(Leadership_Portrait);

        displayName="Leadership Portrait (CVO)";

        hiddenSelectionsTextures[] =
        {
            QPATHTOF(data\cvo_leaderportrait.paa),
            "a3\props_f_aow\civilian\gallery\data\galleryframe_01_large_portrait_f_co.paa",
            "a3\props_f_aow\civilian\gallery\data\galleryframe_01_large_portrait_f_co.paa"
        };
    };

    // Banners with CVO Flag Texture
    class Banner_01_F;
    class GVAR(Banner_Red) : Banner_01_F
    {
        _generalMacro=QGVAR(Banner_Red);
        displayName="Banner (CVO - Red)";
        hiddenSelectionsTextures[] = {QPATHTOF(data\flag_voron_red_2048.paa)};
    };
    class GVAR(Banner_Olive) : Banner_01_F
    {
        _generalMacro=QGVAR(Banner_Olive);
        displayName="Banner (CVO - Olive)";
        hiddenSelectionsTextures[] = {QPATHTOF(data\flag_voron_olive_2048.paa)};
    };
};
