class CfgVehicles
{

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


    class ACE_Flag_Black: FlagCarrier_Asym {
        author = CSTRING(ACETeam);
        displayName = CSTRING(FlagBlack);
        scope = 2;
        scopeCurator = 2;
        editorPreview = QPATHTOF(data\ace_flag_black_preview.jpg);
        class EventHandlers {
            init = QUOTE((_this select 0) setFlagTexture QUOTE(QPATHTOF(data\ace_flag_black_ca.paa)));
        };
        class ACE_Actions {
            class ACE_MainActions {
                displayName = ECSTRING(interaction,MainAction);
                condition = "true";
                position = "[-0.1, -0.35, -2.6]";
                distance = 2;
            };
        };
    };