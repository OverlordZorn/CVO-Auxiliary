#include "../script_component.hpp"

[
	
	QSET(enabled),					//    _setting     - Unique setting name. Matches resulting variable name <STRING>
	"CHECKBOX",								//    _settingType - Type of setting. Can be "CHECKBOX", "EDITBOX", "LIST", "SLIDER" or "COLOR" <STRING>
	["Display Music Title","This enables the message of the currently played music title by the CVO Music System"],
											//    _title       - Display name or display name + tooltip (optional, default: same as setting name) <STRING, ARRAY>
	["CVO Music"],							//    _category    - Category for the settings menu + optional sub-category <STRING, ARRAY>
	false,									//    _valueInfo   - Extra properties of the setting depending of _settingType. See examples below <ANY>
	2,										//    _isGlobal    - 1: all clients share the same setting, 2: setting can't be overwritten (optional, default: 0) <NUMBER>
	{},										//    _script      - Script to execute when setting is changed. (optional) <CODE>
	false									//    _needRestart - Setting will be marked as needing mission restart after being changed. (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
	QSET(name_type),					//    _setting     - Unique setting name. Matches resulting variable name <STRING>
	"LIST",								//    _settingType - Type of setting. Can be "CHECKBOX", "EDITBOX", "LIST", "SLIDER" or "COLOR" <STRING>
	["Display Title or Classname?","Should the message show the Title of the track or its classname?"],
											//    _title       - Display name or display name + tooltip (optional, default: same as setting name) <STRING, ARRAY>
	["CVO Music", "Client Settings"],					//    _category    - Category for the settings menu + optional sub-category <STRING, ARRAY>
	[["NAME", "CLASS"], ["Show Name", "Show ClassName"], 0],
											//    _valueInfo   - Extra properties of the setting depending of _settingType. See examples below <ANY>
	2,										//    _isGlobal    - 1: all clients share the same setting, 2: setting can't be overwritten (optional, default: 0) <NUMBER>
	{},										//    _script      - Script to execute when setting is changed. (optional) <CODE>
	false									//    _needRestart - Setting will be marked as needing mission restart after being changed. (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
	QSET(delivery_method),					//    _setting     - Unique setting name. Matches resulting variable name <STRING>
	"LIST",									//    _settingType - Type of setting. Can be "CHECKBOX", "EDITBOX", "LIST", "SLIDER" or "COLOR" <STRING>
	["Type of Notification","Controls how the Notifications are being delivered"],
											//    _title       - Display name or display name + tooltip (optional, default: same as setting name) <STRING, ARRAY>
	["CVO Music", "Client Settings"],					//    _category    - Category for the settings menu + optional sub-category <STRING, ARRAY>
	[["SYSTEMCHAT", "HINT", "DIAG_LOG"], ["systemChat", "hint", "Entry in the RPT"], 0],
											//    _valueInfo   - Extra properties of the setting depending of _settingType. See examples below <ANY>
	2,										//    _isGlobal    - 1: all clients share the same setting, 2: setting can't be overwritten (optional, default: 0) <NUMBER>
	{},										//    _script      - Script to execute when setting is changed. (optional) <CODE>
	false									//    _needRestart - Setting will be marked as needing mission restart after being changed. (optional, default false) <BOOL>
] call CBA_fnc_addSetting;


[
	QSET(LowVolume),				//    _setting     - Unique setting name. Matches resulting variable name <STRING>
	"CHECKBOX",								//    _settingType - Type of setting. Can be "CHECKBOX", "EDITBOX", "LIST", "SLIDER" or "COLOR" <STRING>
	["Enable Low Music Volume Notification","This enables a notification when music is played and the clients musicvolume is below 5%"],
											//    _title       - Display name or display name + tooltip (optional, default: same as setting name) <STRING, ARRAY>
	["CVO Music", "Client Settings"],					//    _category    - Category for the settings menu + optional sub-category <STRING, ARRAY>
	true,									//    _valueInfo   - Extra properties of the setting depending of _settingType. See examples below <ANY>
	2,										//    _isGlobal    - 1: all clients share the same setting, 2: setting can't be overwritten (optional, default: 0) <NUMBER>
	{},										//    _script      - Script to execute when setting is changed. (optional) <CODE>
	false									//    _needRestart - Setting will be marked as needing mission restart after being changed. (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
	QSET(LowVolume_Threshold),	//    _setting     - Unique setting name. Matches resulting variable name <STRING>
	"SLIDER",								//    _settingType - Type of setting. Can be "CHECKBOX", "EDITBOX", "LIST", "SLIDER" or "COLOR" <STRING>
	["Low Music Volume Value", "Defines the Threshold as Percentage for the Low Music Volume Notification"],
											//    _title       - Display name or display name + tooltip (optional, default: same as setting name) <STRING, ARRAY>
	["CVO Music", "Client Settings"],					//    _category    - Category for the settings menu + optional sub-category <STRING, ARRAY>
	[0, 0.05, 1, 2, true],					//    _valueInfo   - Extra properties of the setting depending of _settingType. See examples below <ANY>
	2,										//    _isGlobal    - 1: all clients share the same setting, 2: setting can't be overwritten (optional, default: 0) <NUMBER>
	{},										//    _script      - Script to execute when setting is changed. (optional) <CODE>
	false									//    _needRestart - Setting will be marked as needing mission restart after being changed. (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
	QSET(delay_min),				//    _setting     - Unique setting name. Matches resulting variable name <STRING>
	"SLIDER",								//    _settingType - Type of setting. Can be "CHECKBOX", "EDITBOX", "LIST", "SLIDER" or "COLOR" <STRING>
	["Minimum Delay","The minimum delay in secounds that has to pass before the next title in the Music Queue will be played"],
											//    _title       - Display name or display name + tooltip (optional, default: same as setting name) <STRING, ARRAY>
	["CVO Music", "Server Settings"],				//    _category    - Category for the settings menu + optional sub-category <STRING, ARRAY>
	[0, 60, 30, 0, false],					//    _valueInfo   - Extra properties of the setting depending of _settingType. See examples below <ANY>
	1,										//    _isGlobal    - 1: all clients share the same setting, 2: setting can't be overwritten (optional, default: 0) <NUMBER>
	{},										//    _script      - Script to execute when setting is changed. (optional) <CODE>
	false									//    _needRestart - Setting will be marked as needing mission restart after being changed. (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
	QSET(delay_random),				//    _setting     - Unique setting name. Matches resulting variable name <STRING>
	"SLIDER",								//    _settingType - Type of setting. Can be "CHECKBOX", "EDITBOX", "LIST", "SLIDER" or "COLOR" <STRING>
	["Randomized Delay","This number will be added to the Minimum Delay, combined they will result in the maximum delay in secounds that has to pass before the next title in the Music Queue will be played."],
											//    _title       - Display name or display name + tooltip (optional, default: same as setting name) <STRING, ARRAY>
	["CVO Music", "Server Settings"],					//    _category    - Category for the settings menu + optional sub-category <STRING, ARRAY>
	[0, 600, 300, 0, false],				//    _valueInfo   - Extra properties of the setting depending of _settingType. See examples below <ANY>
	1,										//    _isGlobal    - 1: all clients share the same setting, 2: setting can't be overwritten (optional, default: 0) <NUMBER>
	{},										//    _script      - Script to execute when setting is changed. (optional) <CODE>
	false									//    _needRestart - Setting will be marked as needing mission restart after being changed. (optional, default false) <BOOL>
] call CBA_fnc_addSetting;