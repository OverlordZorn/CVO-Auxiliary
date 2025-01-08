// This file serves as an example for a missionConfig based setup of CSC for a mission.
// Insert the following into your description.ext
// "true" and "false" will be converted into booleans

// "DefaultEntry" is a special case and will define the "Defaults" for all properties.

class CfgArsenal
{
    editor_layer_name = "Toast";
    object_variable_names[] = {"source"};
    
    class Base
    {
        // The Function will search for all entries within "Base", so the property name of the arrays are not relevant.
        medical[] = {
            "ACE_packingBandage",
            "ACE_fieldDressing",
            "ACE_tourniquet", 
            "ACE_morphine",
            "ACE_epinephrine", 
            // "ACE_splint",
            // "ACE_salineIV", 
            "ACE_salineIV_500",
            "ACE_salineIV_250",
            "ACE_personalAidKit",
            "ACE_bodyBag"
        };

        rations[] = {
            "ACE_MRE_BeefStew",
            "ACE_MRE_ChickenTikkaMasala",
            "ACE_MRE_ChickenHerbDumplings",
            "ACE_MRE_CreamChickenSoup",
            "ACE_MRE_CreamTomatoSoup",
            "ACE_MRE_LambCurry",
            "ACE_MRE_MeatballsPasta",
            "ACE_MRE_SteakVegetables"            
        };

        adv_rappeling[] = {
            "AUR_Rappel_Rope_70",
            "AUR_Rappel_Rope_50",
            "AUR_Rappel_Rope_30",
            "AUR_Rappel_Rope_20",
            "AUR_Rappel_Rope_10",
            "AUR_Rappel_Gear"
        };

        acre_base[] = {
            "ACRE_PRC343"
        };
    };
    class Roles
    {
        class Medic
        {
            code = "";
            items[] = {
                "ACE_quikclot", 
                "ACE_elasticBandage", 
                "ACE_adenosine", 

                "ACE_plasmaIV",
                "ACE_plasmaIV_500",
                "ACE_plasmaIV_250",
                "ACE_bloodIV",
                "ACE_bloodIV_500",
                "ACE_bloodIV_250",

                "ACE_splint",
                "ACE_salineIV", 

                // "ACE_suture",
                "ACE_surgicalKit"
            };
        };

        class Engineer
        {
            code = "";
            items[] = {
                "ACE_VMM3",
                "ACE_VMH3", 
                "ACE_wirecutter",
                "ToolKit", 
                "ACE_Fortify",
                "ACE_DefusalKit"
            };
        };

        class Officer
        {
            code = "";
            items[] = {
                "ACRE_VHF30108SPIKE", 
                "ACRE_VHF30108", 
                "ACRE_VHF30108MAST",
                "ACRE_PRC148"
            };
        };
    };

    class Players
    {
        class EditorDebug
        {
            id = "_SP_PLAYER_";
            code = "systemChat ""CVO_A_Playerkit test Successful - ACE_Sandbag_empty Given""; 	[""ACE_Sandbag_empty""]";
            items[] = { "ACE_Banana" };
        };
        class Zorn
        {
            id = "76561197970306509";
            code = "";
            items[] = {
                "G_Spectacles_Tinted",
                "G_Balaclava_blk",
                "H_Beret_blk",
                "B_LegStrapBag_black_F",
                "WSLV_Brown_gn_black_Camo",
                "ACE_SpraypaintBlack"
            };
        };
    };
};


