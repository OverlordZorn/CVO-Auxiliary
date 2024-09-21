//////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////
// General Marker Settings

[
	"CVO_SET_Insignia_on_arsenalClosed",			//    _setting     - Unique setting name. Matches resulting variable name <STRING>
	"CHECKBOX",								//    _settingType - Type of setting. Can be "CHECKBOX", "EDITBOX", "LIST", "SLIDER" or "COLOR" <STRING>
	["AutoAssign on ACE Arsenal Closed","Identifes and AutoAssigns Units Insignia when the ACE Arsenal is being closed."],
											//    _title       - Display name or display name + tooltip (optional, default: same as setting name) <STRING, ARRAY>
	["CVO", "Insignia"],					//    _category    - Category for the settings menu + optional sub-category <STRING, ARRAY>
	true,									//    _valueInfo   - Extra properties of the setting depending of _settingType. See examples below <ANY>
	0,										//    _isGlobal    - 1: all clients share the same setting, 2: setting can't be overwritten (optional, default: 0) <NUMBER>
	{
		[_this] call CVO_Insignia_fnc_EH_Arsenal;
	},										//    _script      - Script to execute when setting is changed. (optional) <CODE>
	false									//    _needRestart - Setting will be marked as needing mission restart after being changed. (optional, default false) <BOOL>
] call CBA_fnc_addSetting;


[
	"CVO_SET_Insignia_on_missionStart",		//    _setting     - Unique setting name. Matches resulting variable name <STRING>
	"CHECKBOX",								//    _settingType - Type of setting. Can be "CHECKBOX", "EDITBOX", "LIST", "SLIDER" or "COLOR" <STRING>
	["AutoAssign on Mission Start","Identifes and AutoAssigns Units Insignia during Mission Start."],
											//    _title       - Display name or display name + tooltip (optional, default: same as setting name) <STRING, ARRAY>
	["CVO", "Insignia"],					//    _category    - Category for the settings menu + optional sub-category <STRING, ARRAY>
	true,									//    _valueInfo   - Extra properties of the setting depending of _settingType. See examples below <ANY>
	0,										//    _isGlobal    - 1: all clients share the same setting, 2: setting can't be overwritten (optional, default: 0) <NUMBER>
	{},										//    _script      - Script to execute when setting is changed. (optional) <CODE>
	true									//    _needRestart - Setting will be marked as needing mission restart after being changed. (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

/*

[
	"CVO_SET_Insignia_on_GroupChange",		//    _setting     - Unique setting name. Matches resulting variable name <STRING>
	"CHECKBOX",								//    _settingType - Type of setting. Can be "CHECKBOX", "EDITBOX", "LIST", "SLIDER" or "COLOR" <STRING>
	["AutoAssign on Join/Leave of Group","Identifes and AutoAssigns Units Insignia when someone joins/leaves the Squad."],
											//    _title       - Display name or display name + tooltip (optional, default: same as setting name) <STRING, ARRAY>
	["CVO", "Insignia"],					//    _category    - Category for the settings menu + optional sub-category <STRING, ARRAY>
	true,									//    _valueInfo   - Extra properties of the setting depending of _settingType. See examples below <ANY>
	1,										//    _isGlobal    - 1: all clients share the same setting, 2: setting can't be overwritten (optional, default: 0) <NUMBER>
	{
		[_this] call CVO_Insignia_fnc_EH_Group;
	},										//    _script      - Script to execute when setting is changed. (optional) <CODE>
	false									//    _needRestart - Setting will be marked as needing mission restart after being changed. (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

*/

/* Add Further Option: AutoAssign on Group Change

Whenever Leader changes? (this might trigger when unit gets uncon/killed?) -> Doesnt matter cause leadership is based on rank, not on actual leader of the group :smort:
Whenever Unit Joins or Leaves the squad. GroupIdChanged
// https://community.bistudio.com/wiki/Arma_3:_Event_Handlers#Group_Event_Handlers


*/

[
	"CVO_SET_Insignia_threshold_SL",		//    _setting     - Unique setting name. Matches resulting variable name <STRING>
	"SLIDER",								//    _settingType - Type of setting. Can be "CHECKBOX", "EDITBOX", "LIST", "SLIDER" or "COLOR" <STRING>
	["Threshhold for Squadleaders","An Infantrysquad needs to have atleast this many units for the highest ranking Unit to become an SL instead of a TL."],
											//    _title       - Display name or display name + tooltip (optional, default: same as setting name) <STRING, ARRAY>
	["CVO", "Insignia"],					//    _category    - Category for the settings menu + optional sub-category <STRING, ARRAY>
	[3,12,5,0,false],						//    _valueInfo   - Extra properties of the setting depending of _settingType. See examples below <ANY>
	1,										//    _isGlobal    - 1: all clients share the same setting, 2: setting can't be overwritten (optional, default: 0) <NUMBER>
	{},										//    _script      - Script to execute when setting is changed. (optional) <CODE>
	false									//    _needRestart - Setting will be marked as needing mission restart after being changed. (optional, default false) <BOOL>
] call CBA_fnc_addSetting;