#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        author = "$STR_cvo_author";
        name = QUOTE(ADDON);
        url = "$STR_cvo_URL";
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {"cba_main","ace_main"};
        VERSION_CONFIG;
        authors[] = {"OverlordZorn [CVO]"};
    };
};
