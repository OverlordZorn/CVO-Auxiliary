#include "../script_component.hpp"

// PREVIOUS SETTINGS

[
	QSET(delay_min),						//    _setting     - Unique setting name. Matches resulting variable name <STRING>
	"SLIDER",								//    _settingType - Type of setting. Can be "CHECKBOX", "EDITBOX", "LIST", "SLIDER" or "COLOR" <STRING>
	[LSTRING(set_delayMin),LSTRING(set_delayMin_desc)],
											//    _title       - Display name or display name + tooltip (optional, default: same as setting name) <STRING, ARRAY>
	[LSTRING(set_cat_title), LSTRING(set_subcat_serverSetting)],		//    _category    - Category for the settings menu + optional sub-category <STRING, ARRAY>
	[0, 60, 30, 0, false],					//    _valueInfo   - Extra properties of the setting depending of _settingType. See examples below <ANY>
	1,										//    _isGlobal    - 1: all clients share the same setting, 2: setting can't be overwritten (optional, default: 0) <NUMBER>
	{},										//    _script      - Script to execute when setting is changed. (optional) <CODE>
	false									//    _needRestart - Setting will be marked as needing mission restart after being changed. (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
	QSET(delay_random),						//    _setting     - Unique setting name. Matches resulting variable name <STRING>
	"SLIDER",								//    _settingType - Type of setting. Can be "CHECKBOX", "EDITBOX", "LIST", "SLIDER" or "COLOR" <STRING>
	[LSTRING(set_delayRnd),LSTRING(set_delayRnd_desc)],
											//    _title       - Display name or display name + tooltip (optional, default: same as setting name) <STRING, ARRAY>
	[LSTRING(set_cat_title), LSTRING(set_subcat_serverSetting)],		//    _category    - Category for the settings menu + optional sub-category <STRING, ARRAY>
	[0, 600, 300, 0, false],				//    _valueInfo   - Extra properties of the setting depending of _settingType. See examples below <ANY>
	1,										//    _isGlobal    - 1: all clients share the same setting, 2: setting can't be overwritten (optional, default: 0) <NUMBER>
	{},										//    _script      - Script to execute when setting is changed. (optional) <CODE>
	false									//    _needRestart - Setting will be marked as needing mission restart after being changed. (optional, default false) <BOOL>
] call CBA_fnc_addSetting;
