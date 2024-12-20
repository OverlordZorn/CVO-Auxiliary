class CfgVehicles
{
    // Flags with CVO Flag Texture
    class FlagCarrier_Asym;
    class PVAR(Flag_Red): FlagCarrier_Asym
    {
        _generalMacro=QPVAR(Flag_Red);

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
    class PVAR(Flag_Olive) : PVAR(Flag_Red)
    {
        _generalMacro=QPVAR(Flag_Olive);
        displayName="$STR_CVO_branding_olive_display";
        class EventHandlers
        {
            init=QUOTE((_this select 0) setFlagTexture QUOTE(QPATHTOF(data\flag_voron_olive_2048.paa)));
        };
    };

    // A portrait of the oh so glorious leader
    class GalleryFrame_01_large_portrait_F;
    class PVAR(Leadership_Portrait) : GalleryFrame_01_large_portrait_F
    {
        _generalMacro=QPVAR(Leadership_Portrait);

        displayName="Leadership Portrait (CVO)";

        hiddenSelectionsTextures[] =
        {
            QPATHTOF(data\cvo_portrait_director.paa),
            "a3\props_f_aow\civilian\gallery\data\galleryframe_01_large_portrait_f_co.paa",
            "a3\props_f_aow\civilian\gallery\data\galleryframe_01_large_portrait_f_co.paa"
        };
    };

    // Banners with CVO Flag Texture
    class Banner_01_F;
    class PVAR(Banner_Red) : Banner_01_F
    {
        _generalMacro=QPVAR(Banner_Red);
        displayName="Banner (CVO - Red)";
        author = "$STR_cvo_Author";
        hiddenSelectionsTextures[] = {QPATHTOF(data\flag_voron_red_2048.paa)};
    };
    class PVAR(Banner_Olive) : Banner_01_F
    {
        _generalMacro=QPVAR(Banner_Olive);
        displayName="Banner (CVO - Olive)";
        hiddenSelectionsTextures[] = {QPATHTOF(data\flag_voron_olive_2048.paa)};
    };


    
    // Branded Merch
    class B_LegStrapBag_black_F;
    class PVAR(LegStrapBag_black): B_LegStrapBag_black_F
    {
        _generalMacro=QPVAR(LegStrapBag_black);
        displayName = "Leg Strap Bag (Black - CVO)";
        author = "$STR_cvo_Author";
        maximumLoad = 120;
        hiddenSelectionsTextures[] = {QPATHTOF(data\legstrap\V_LegStrapBag_black_CVO_CO.paa)};
        hiddenSelectionsMaterials[] = {QPATHTOF(data\legstrap\V_LegStrapBag_CVO.rvmat)};
    };

    class B_Kitbag_Base;
    class PVAR(Kitbag_blk): B_Kitbag_Base
    {
        _generalMacro=QPVAR(Kitbag_blk);
        displayName = "Kitbag (Black - CVO)";
        scope = 2;
        author = "$STR_cvo_Author";
        maximumLoad = 300;
        hiddenSelectionsTextures[] = {QPATHTOF(data\kitbag\backpack_fast_blk_cvo_co.paa)};
    };
};
