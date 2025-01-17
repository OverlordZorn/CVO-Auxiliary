#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		author = "$STR_grad_Author";
		name = ADDON_NAME;
		url = "$STR_grad_URL";
		requiredVersion = 2.0;
		requiredAddons[] = {"cvo_main", "A3_Ui_F","ace_common","cba_common"};
		units[] = {};
		weapons[] = {};
		VERSION_CONFIG;
        authors[] = {"McDiod"};
	};
};

#include "cfgScriptPaths.hpp"
#include "cfgFunctions.hpp"
#include "cfgUnitInsignia.hpp"
#include "dialogs.hpp"
