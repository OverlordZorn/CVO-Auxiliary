// #####################################################
// ###### greenMag TAB
// #####################################################

_modLoaded = isClass (configfile >> "CfgPatches" >> "greenmag_main");

// Creates List of all GreenMag Classnames
private _greenTab = "('greenmag' in configName _x) && !('core' in configName _x)" configClasses (configFile >> "CfgWeapons") apply {configName _x}; 

// Creates GreenMag Arsenal Tab
	[_greenTab, "greenMag", "\z\cvo_aux\addons\arsenal\img\greenMag.paa"] call ace_arsenal_fnc_addRightPanelButton;
	diag_log "[CVO] [ARSENAL] - Green Tab Applied";

diag_log ("[CVO] [LOADOUT] - " + str player + " - init completed");

