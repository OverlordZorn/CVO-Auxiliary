// This file serves as an example for a missionConfig based setup of CSC for a mission.
// Insert the following into your description.ext
// #include "CfgCustomSupplyCrates.hpp"
// "true" and "false" will be converted into booleans

// "DefaultEntry" is a special case and will define the "Defaults" for all the implemented

class CfgCustomSupplyCrates
{
    class DefaultEntry
    {
        // The following properties are the existing defaults.
        items[] = {};
        backpacks[] = {};

        zeus_enabled = "true";

        //// Modes
        // "AIRDROP" will start the airdrop feature. Target Pos will be defined through "airdrop_targetMode"/"airdrop_targetMode_zeus"
        // "POS" will take spawn_pos [2/3D or Object] and spawn the crate on that position
        // "REL" will spawn the crate relative to its size behind the provided object
        zeus_mode = "AIRDROP";
        normal_mode = "REL";
        box_class = "C_supplyCrate_F";
        box_empty = "true";

        // can be fixed position[pos2d/3d] or object (helipad, tarp, sth like that) or "REL" which will put the box relative behind the source object
        // spawn_pos = "REL";         // "REL" as a magic key
        // spawn_pos = "myHeliPad";   // Variable Name as a String
        spawn_pos[] = { 0, 0, 0 };

        ace_medical_facility = "false";
        ace_medical_vehicle = "false";

        ace_repair_facility = "false";
        ace_repair_vehicle = "false";

        ace_rearm_source = "false";
        ace_rearm_source_value = 50;

        ace_refuel_source = "false";
        ace_refuel_source_value = 50;
        ace_refuel_source_nozzlePos[] = { 0, 0, 0 };

        ace_drag_canDrag = "true";
        ace_drag_relPOS[] = { 0, 1.5, 0 };
        ace_drag_dir = 0;
        ace_drag_ignoreWeight = "true";

        ace_carry_canCarry = "true";
        ace_carry_relPOS[] = { 0, 1, 1 };
        ace_carry_dir = 0;
        ace_carry_ignoreWeight = "false";

        ace_cargo_setSpace = 0;
        ace_cargo_setSize = "DEFAULT";

        ace_cargo_add_spareWheels = 0;
        ace_cargo_add_jerrycans = 0;
        ace_cargo_add_tracks = 0;

        airdrop_targetMode = "MAPCLICK";        // MAPCLICK, FIXED (spawn_pos), PLAYER, TARGET

        airdrop_targetMode_zeus = "MAPCLICK";

        airframe_side = "CIV";                  // String version: "WEST" "EAST" "GUER" "CIV"
        airframe_protected = "true";
        airframe_class = "C_Heli_Light_01_civil_F";

        airdrop_pos_start[] = { 0, 0, 0 };
        airdrop_pos_end = "RETURN";

        airdrop_alt = 100;
        airdrop_alt_forced = "true";

        airdrop_flyInHeightASL[] = { 35, 35, 35 };

        airdrop_attachSmoke = "true";
        airdrop_class_smoke = "SmokeShellOrange"; // CfgMagazines

        parachute_class = "B_Parachute_02_F";

        parachute_attachStrobe = "true";
        parachute_strobe_class = "ACE_IR_Strobe_Effect";
    };

    class myMedicalCrate
    {
        name = "Medical Supply Crate";
        box_class = "ACE_medicalSupplyCrate_advanced";
        ace_medical_facility = "true";

        link_object[] = { "csc_source_object" };        // only used for config defined templates - to be linked to objects.
        link_class[] = { };                             // only used for config defined templates - to be linked to classes.

        items[] = {
            // { "ACE_suture", 100 },
            { "ACE_surgicalKit", 1 },
            { "ACE_painkillers", 5 },
            { "ACE_bodyBag", 25 },
            { "ACE_personalAidKit", 15 },
            { "ACE_salineIV", 10 },
            { "ACE_salineIV_500", 20 },
            { "ACE_fieldDressing",  40 },
            { "ACE_packingBandage", 40 },
            { "ACE_elasticBandage", 50 },
            { "ACE_Morphine", 5 },
            { "ACE_Epinephrine", 10 }
        };
    };
};


