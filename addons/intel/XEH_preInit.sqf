//////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////
// General Marker Settings
[
	"CVO_SET_Intel_Flag_marker_size",		//    _setting     - Unique setting name. Matches resulting variable name <STRING>
	"Slider",								//    _settingType - Type of setting. Can be "CHECKBOX", "EDITBOX", "LIST", "SLIDER" or "COLOR" <STRING>
	["Marker Size","Size of the Markers."],
											//    _title       - Display name or display name + tooltip (optional, default: same as setting name) <STRING, ARRAY>
	["CVO Intel", "Marker Settings"],					//    _category    - Category for the settings menu + optional sub-category <STRING, ARRAY>
	[0, 2, 0.5, 2, true],									//    _valueInfo   - Extra properties of the setting depending of _settingType. See examples below <ANY>
	1,										//    _isGlobal    - 1: all clients share the same setting, 2: setting can't be overwritten (optional, default: 0) <NUMBER>
	{},										//    _script      - Script to execute when setting is changed. (optional) <CODE>
	true									//    _needRestart - Setting will be marked as needing mission restart after being changed. (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
	"CVO_SET_Intel_Flag_marker_alpha",		//    _setting     - Unique setting name. Matches resulting variable name <STRING>
	"Slider",								//    _settingType - Type of setting. Can be "CHECKBOX", "EDITBOX", "LIST", "SLIDER" or "COLOR" <STRING>
	["Marker Transparancy","Size of the Markers."],
											//    _title       - Display name or display name + tooltip (optional, default: same as setting name) <STRING, ARRAY>
	["CVO Intel", "Marker Settings"],					//    _category    - Category for the settings menu + optional sub-category <STRING, ARRAY>
	[0, 1, 0.5, 2, true],									//    _valueInfo   - Extra properties of the setting depending of _settingType. See examples below <ANY>
	1,										//    _isGlobal    - 1: all clients share the same setting, 2: setting can't be overwritten (optional, default: 0) <NUMBER>
	{},										//    _script      - Script to execute when setting is changed. (optional) <CODE>
	true									//    _needRestart - Setting will be marked as needing mission restart after being changed. (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

//////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////

// Marker At MissionStart Settings
[
	"CVO_SET_Intel_Flag_initial_isEnabled",			//    _setting     - Unique setting name. Matches resulting variable name <STRING>
	"CHECKBOX",								//    _settingType - Type of setting. Can be "CHECKBOX", "EDITBOX", "LIST", "SLIDER" or "COLOR" <STRING>
	["Enabled ","Enables/Disables the feature. Creates Map Markers for the selected ACE Marker Flag after Missionstart."],
											//    _title       - Display name or display name + tooltip (optional, default: same as setting name) <STRING, ARRAY>
	["CVO Intel", "Missionstart - Markers for ACE Marker Flags"],					//    _category    - Category for the settings menu + optional sub-category <STRING, ARRAY>
	false,									//    _valueInfo   - Extra properties of the setting depending of _settingType. See examples below <ANY>
	1,										//    _isGlobal    - 1: all clients share the same setting, 2: setting can't be overwritten (optional, default: 0) <NUMBER>
	{},										//    _script      - Script to execute when setting is changed. (optional) <CODE>
	true									//    _needRestart - Setting will be marked as needing mission restart after being changed. (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
	"CVO_SET_Intel_Flag_initial_Delay",			//    _setting     - Unique setting name. Matches resulting variable name <STRING>
	"SLIDER",								//    _settingType - Type of setting. Can be "CHECKBOX", "EDITBOX", "LIST", "SLIDER" or "COLOR" <STRING>
	["Delay in Seconds","The Initial delay after Missionstart before for the existing flags markers are being marked. This is mainly for persistancy scripts/mods to be effective before."],
											//    _title       - Display name or display name + tooltip (optional, default: same as setting name) <STRING, ARRAY>
	["CVO Intel", "Missionstart - Markers for ACE Marker Flags"],					//    _category    - Category for the settings menu + optional sub-category <STRING, ARRAY>
	[0, 300, 30, 0],									//    _valueInfo   - Extra properties of the setting depending of _settingType. See examples below <ANY>
	1,										//    _isGlobal    - 1: all clients share the same setting, 2: setting can't be overwritten (optional, default: 0) <NUMBER>
	{},										//    _script      - Script to execute when setting is changed. (optional) <CODE>
	true									//    _needRestart - Setting will be marked as needing mission restart after being changed. (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

// Marker At MissionStart Types
[
	"CVO_SET_Intel_Flag_initial_Black",			//    _setting     - Unique setting name. Matches resulting variable name <STRING>
	"CHECKBOX",								//    _settingType - Type of setting. Can be "CHECKBOX", "EDITBOX", "LIST", "SLIDER" or "COLOR" <STRING>
	["Black","Will create a mapmarker for ACE marker flags of this type shortly after missionstart."],
											//    _title       - Display name or display name + tooltip (optional, default: same as setting name) <STRING, ARRAY>
	["CVO Intel", "Missionstart - Type"],					//    _category    - Category for the settings menu + optional sub-category <STRING, ARRAY>
	false,									//    _valueInfo   - Extra properties of the setting depending of _settingType. See examples below <ANY>
	1,										//    _isGlobal    - 1: all clients share the same setting, 2: setting can't be overwritten (optional, default: 0) <NUMBER>
	{},										//    _script      - Script to execute when setting is changed. (optional) <CODE>
	true									//    _needRestart - Setting will be marked as needing mission restart after being changed. (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
	"CVO_SET_Intel_Flag_initial_White",			//    _setting     - Unique setting name. Matches resulting variable name <STRING>
	"CHECKBOX",								//    _settingType - Type of setting. Can be "CHECKBOX", "EDITBOX", "LIST", "SLIDER" or "COLOR" <STRING>
	["White","Will create a mapmarker for ACE marker flags of this type shortly after missionstart."],
											//    _title       - Display name or display name + tooltip (optional, default: same as setting name) <STRING, ARRAY>
	["CVO Intel", "Missionstart - Type"],					//    _category    - Category for the settings menu + optional sub-category <STRING, ARRAY>
	false,									//    _valueInfo   - Extra properties of the setting depending of _settingType. See examples below <ANY>
	1,										//    _isGlobal    - 1: all clients share the same setting, 2: setting can't be overwritten (optional, default: 0) <NUMBER>
	{},										//    _script      - Script to execute when setting is changed. (optional) <CODE>
	true									//    _needRestart - Setting will be marked as needing mission restart after being changed. (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
	"CVO_SET_Intel_Flag_initial_Red",			//    _setting     - Unique setting name. Matches resulting variable name <STRING>
	"CHECKBOX",								//    _settingType - Type of setting. Can be "CHECKBOX", "EDITBOX", "LIST", "SLIDER" or "COLOR" <STRING>
	["Red","Will create a mapmarker for ACE marker flags of this type shortly after missionstart."],
											//    _title       - Display name or display name + tooltip (optional, default: same as setting name) <STRING, ARRAY>
	["CVO Intel", "Missionstart - Type"],					//    _category    - Category for the settings menu + optional sub-category <STRING, ARRAY>
	true,									//    _valueInfo   - Extra properties of the setting depending of _settingType. See examples below <ANY>
	1,										//    _isGlobal    - 1: all clients share the same setting, 2: setting can't be overwritten (optional, default: 0) <NUMBER>
	{},										//    _script      - Script to execute when setting is changed. (optional) <CODE>
	true									//    _needRestart - Setting will be marked as needing mission restart after being changed. (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
	"CVO_SET_Intel_Flag_initial_Green",			//    _setting     - Unique setting name. Matches resulting variable name <STRING>
	"CHECKBOX",								//    _settingType - Type of setting. Can be "CHECKBOX", "EDITBOX", "LIST", "SLIDER" or "COLOR" <STRING>
	["Green","Will create a mapmarker for ACE marker flags of this type shortly after missionstart."],
											//    _title       - Display name or display name + tooltip (optional, default: same as setting name) <STRING, ARRAY>
	["CVO Intel", "Missionstart - Type"],					//    _category    - Category for the settings menu + optional sub-category <STRING, ARRAY>
	true,									//    _valueInfo   - Extra properties of the setting depending of _settingType. See examples below <ANY>
	1,										//    _isGlobal    - 1: all clients share the same setting, 2: setting can't be overwritten (optional, default: 0) <NUMBER>
	{},										//    _script      - Script to execute when setting is changed. (optional) <CODE>
	true									//    _needRestart - Setting will be marked as needing mission restart after being changed. (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
	"CVO_SET_Intel_Flag_initial_Blue",			//    _setting     - Unique setting name. Matches resulting variable name <STRING>
	"CHECKBOX",								//    _settingType - Type of setting. Can be "CHECKBOX", "EDITBOX", "LIST", "SLIDER" or "COLOR" <STRING>
	["Blue","Will create a mapmarker for ACE marker flags of this type shortly after missionstart."],
											//    _title       - Display name or display name + tooltip (optional, default: same as setting name) <STRING, ARRAY>
	["CVO Intel", "Missionstart - Type"],					//    _category    - Category for the settings menu + optional sub-category <STRING, ARRAY>
	true,									//    _valueInfo   - Extra properties of the setting depending of _settingType. See examples below <ANY>
	1,										//    _isGlobal    - 1: all clients share the same setting, 2: setting can't be overwritten (optional, default: 0) <NUMBER>
	{},										//    _script      - Script to execute when setting is changed. (optional) <CODE>
	true									//    _needRestart - Setting will be marked as needing mission restart after being changed. (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
	"CVO_SET_Intel_Flag_initial_Yellow",			//    _setting     - Unique setting name. Matches resulting variable name <STRING>
	"CHECKBOX",								//    _settingType - Type of setting. Can be "CHECKBOX", "EDITBOX", "LIST", "SLIDER" or "COLOR" <STRING>
	["Yellow","Will create a mapmarker for ACE marker flags of this type shortly after missionstart."],
											//    _title       - Display name or display name + tooltip (optional, default: same as setting name) <STRING, ARRAY>
	["CVO Intel", "Missionstart - Type"],					//    _category    - Category for the settings menu + optional sub-category <STRING, ARRAY>
	true,									//    _valueInfo   - Extra properties of the setting depending of _settingType. See examples below <ANY>
	1,										//    _isGlobal    - 1: all clients share the same setting, 2: setting can't be overwritten (optional, default: 0) <NUMBER>
	{},										//    _script      - Script to execute when setting is changed. (optional) <CODE>
	true									//    _needRestart - Setting will be marked as needing mission restart after being changed. (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
	"CVO_SET_Intel_Flag_initial_Purple",			//    _setting     - Unique setting name. Matches resulting variable name <STRING>
	"CHECKBOX",								//    _settingType - Type of setting. Can be "CHECKBOX", "EDITBOX", "LIST", "SLIDER" or "COLOR" <STRING>
	["Purple","Will create a mapmarker for ACE marker flags of this type shortly after missionstart."],
											//    _title       - Display name or display name + tooltip (optional, default: same as setting name) <STRING, ARRAY>
	["CVO Intel", "Missionstart - Type"],					//    _category    - Category for the settings menu + optional sub-category <STRING, ARRAY>
	true,									//    _valueInfo   - Extra properties of the setting depending of _settingType. See examples below <ANY>
	1,										//    _isGlobal    - 1: all clients share the same setting, 2: setting can't be overwritten (optional, default: 0) <NUMBER>
	{},										//    _script      - Script to execute when setting is changed. (optional) <CODE>
	true									//    _needRestart - Setting will be marked as needing mission restart after being changed. (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
	"CVO_SET_Intel_Flag_initial_Orange",			//    _setting     - Unique setting name. Matches resulting variable name <STRING>
	"CHECKBOX",								//    _settingType - Type of setting. Can be "CHECKBOX", "EDITBOX", "LIST", "SLIDER" or "COLOR" <STRING>
	["Orange","Will create a mapmarker for ACE marker flags of this type shortly after missionstart."],
											//    _title       - Display name or display name + tooltip (optional, default: same as setting name) <STRING, ARRAY>
	["CVO Intel", "Missionstart - Type"],					//    _category    - Category for the settings menu + optional sub-category <STRING, ARRAY>
	true,									//    _valueInfo   - Extra properties of the setting depending of _settingType. See examples below <ANY>
	1,										//    _isGlobal    - 1: all clients share the same setting, 2: setting can't be overwritten (optional, default: 0) <NUMBER>
	{},										//    _script      - Script to execute when setting is changed. (optional) <CODE>
	true									//    _needRestart - Setting will be marked as needing mission restart after being changed. (optional, default false) <BOOL>
] call CBA_fnc_addSetting;


//////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////

// Marker At MissionStart Settings
[
	"CVO_SET_Intel_Flag_progessive_isEnabled",			//    _setting     - Unique setting name. Matches resulting variable name <STRING>
	"CHECKBOX",								//    _settingType - Type of setting. Can be "CHECKBOX", "EDITBOX", "LIST", "SLIDER" or "COLOR" <STRING>
	["Enabled ","Enables/Disables the feature. Creates Map Markers for the selected ACE Marker Flag when placed during the mission."],
											//    _title       - Display name or display name + tooltip (optional, default: same as setting name) <STRING, ARRAY>
	["CVO Intel", "Placed by Player - Markers for ACE Marker Flags"],					//    _category    - Category for the settings menu + optional sub-category <STRING, ARRAY>
	false,									//    _valueInfo   - Extra properties of the setting depending of _settingType. See examples below <ANY>
	1,										//    _isGlobal    - 1: all clients share the same setting, 2: setting can't be overwritten (optional, default: 0) <NUMBER>
	{},										//    _script      - Script to execute when setting is changed. (optional) <CODE>
	true									//    _needRestart - Setting will be marked as needing mission restart after being changed. (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
	"CVO_SET_Intel_Flag_progessive_Delay",			//    _setting     - Unique setting name. Matches resulting variable name <STRING>
	"SLIDER",								//    _settingType - Type of setting. Can be "CHECKBOX", "EDITBOX", "LIST", "SLIDER" or "COLOR" <STRING>
	["Delay in Minutes","The delay for the marker to be visible on the map after a player has placed it on the map in Minutes."],
											//    _title       - Display name or display name + tooltip (optional, default: same as setting name) <STRING, ARRAY>
	["CVO Intel", "Placed by Player - Markers for ACE Marker Flags"],					//    _category    - Category for the settings menu + optional sub-category <STRING, ARRAY>
	[0, 120, 30, 0],									//    _valueInfo   - Extra properties of the setting depending of _settingType. See examples below <ANY>
	1,										//    _isGlobal    - 1: all clients share the same setting, 2: setting can't be overwritten (optional, default: 0) <NUMBER>
	{},										//    _script      - Script to execute when setting is changed. (optional) <CODE>
	true									//    _needRestart - Setting will be marked as needing mission restart after being changed. (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

// Marker At MissionStart Types
[
	"CVO_SET_Intel_Flag_progessive_Black",			//    _setting     - Unique setting name. Matches resulting variable name <STRING>
	"CHECKBOX",								//    _settingType - Type of setting. Can be "CHECKBOX", "EDITBOX", "LIST", "SLIDER" or "COLOR" <STRING>
	["Black","Will initially create a mapmarker for player placed ACE Marker Flags of this type after the set delay."],
											//    _title       - Display name or display name + tooltip (optional, default: same as setting name) <STRING, ARRAY>
	["CVO Intel", "Placed by Player - Type"],					//    _category    - Category for the settings menu + optional sub-category <STRING, ARRAY>
	false,									//    _valueInfo   - Extra properties of the setting depending of _settingType. See examples below <ANY>
	1,										//    _isGlobal    - 1: all clients share the same setting, 2: setting can't be overwritten (optional, default: 0) <NUMBER>
	{},										//    _script      - Script to execute when setting is changed. (optional) <CODE>
	true									//    _needRestart - Setting will be marked as needing mission restart after being changed. (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
	"CVO_SET_Intel_Flag_progessive_White",			//    _setting     - Unique setting name. Matches resulting variable name <STRING>
	"CHECKBOX",								//    _settingType - Type of setting. Can be "CHECKBOX", "EDITBOX", "LIST", "SLIDER" or "COLOR" <STRING>
	["White","Will create a mapmarker for ACE marker flags of this type when placed by a player."],
											//    _title       - Display name or display name + tooltip (optional, default: same as setting name) <STRING, ARRAY>
	["CVO Intel", "Placed by Player - Type"],					//    _category    - Category for the settings menu + optional sub-category <STRING, ARRAY>
	false,									//    _valueInfo   - Extra properties of the setting depending of _settingType. See examples below <ANY>
	1,										//    _isGlobal    - 1: all clients share the same setting, 2: setting can't be overwritten (optional, default: 0) <NUMBER>
	{},										//    _script      - Script to execute when setting is changed. (optional) <CODE>
	true									//    _needRestart - Setting will be marked as needing mission restart after being changed. (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
	"CVO_SET_Intel_Flag_progessive_Red",			//    _setting     - Unique setting name. Matches resulting variable name <STRING>
	"CHECKBOX",								//    _settingType - Type of setting. Can be "CHECKBOX", "EDITBOX", "LIST", "SLIDER" or "COLOR" <STRING>
	["Red","Will create a mapmarker for ACE marker flags of this type when placed by a player."],
											//    _title       - Display name or display name + tooltip (optional, default: same as setting name) <STRING, ARRAY>
	["CVO Intel", "Placed by Player - Type"],					//    _category    - Category for the settings menu + optional sub-category <STRING, ARRAY>
	true,									//    _valueInfo   - Extra properties of the setting depending of _settingType. See examples below <ANY>
	1,										//    _isGlobal    - 1: all clients share the same setting, 2: setting can't be overwritten (optional, default: 0) <NUMBER>
	{},										//    _script      - Script to execute when setting is changed. (optional) <CODE>
	true									//    _needRestart - Setting will be marked as needing mission restart after being changed. (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
	"CVO_SET_Intel_Flag_progessive_Green",			//    _setting     - Unique setting name. Matches resulting variable name <STRING>
	"CHECKBOX",								//    _settingType - Type of setting. Can be "CHECKBOX", "EDITBOX", "LIST", "SLIDER" or "COLOR" <STRING>
	["Green","Will create a mapmarker for ACE marker flags of this type when placed by a player."],
											//    _title       - Display name or display name + tooltip (optional, default: same as setting name) <STRING, ARRAY>
	["CVO Intel", "Placed by Player - Type"],					//    _category    - Category for the settings menu + optional sub-category <STRING, ARRAY>
	true,									//    _valueInfo   - Extra properties of the setting depending of _settingType. See examples below <ANY>
	1,										//    _isGlobal    - 1: all clients share the same setting, 2: setting can't be overwritten (optional, default: 0) <NUMBER>
	{},										//    _script      - Script to execute when setting is changed. (optional) <CODE>
	true									//    _needRestart - Setting will be marked as needing mission restart after being changed. (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
	"CVO_SET_Intel_Flag_progessive_Blue",			//    _setting     - Unique setting name. Matches resulting variable name <STRING>
	"CHECKBOX",								//    _settingType - Type of setting. Can be "CHECKBOX", "EDITBOX", "LIST", "SLIDER" or "COLOR" <STRING>
	["Blue","Will create a mapmarker for ACE marker flags of this type when placed by a player."],
											//    _title       - Display name or display name + tooltip (optional, default: same as setting name) <STRING, ARRAY>
	["CVO Intel", "Placed by Player - Type"],					//    _category    - Category for the settings menu + optional sub-category <STRING, ARRAY>
	true,									//    _valueInfo   - Extra properties of the setting depending of _settingType. See examples below <ANY>
	1,										//    _isGlobal    - 1: all clients share the same setting, 2: setting can't be overwritten (optional, default: 0) <NUMBER>
	{},										//    _script      - Script to execute when setting is changed. (optional) <CODE>
	true									//    _needRestart - Setting will be marked as needing mission restart after being changed. (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
	"CVO_SET_Intel_Flag_progessive_Yellow",			//    _setting     - Unique setting name. Matches resulting variable name <STRING>
	"CHECKBOX",								//    _settingType - Type of setting. Can be "CHECKBOX", "EDITBOX", "LIST", "SLIDER" or "COLOR" <STRING>
	["Yellow","Will create a mapmarker for ACE marker flags of this type when placed by a player."],
											//    _title       - Display name or display name + tooltip (optional, default: same as setting name) <STRING, ARRAY>
	["CVO Intel", "Placed by Player - Type"],					//    _category    - Category for the settings menu + optional sub-category <STRING, ARRAY>
	true,									//    _valueInfo   - Extra properties of the setting depending of _settingType. See examples below <ANY>
	1,										//    _isGlobal    - 1: all clients share the same setting, 2: setting can't be overwritten (optional, default: 0) <NUMBER>
	{},										//    _script      - Script to execute when setting is changed. (optional) <CODE>
	true									//    _needRestart - Setting will be marked as needing mission restart after being changed. (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
	"CVO_SET_Intel_Flag_progessive_Purple",			//    _setting     - Unique setting name. Matches resulting variable name <STRING>
	"CHECKBOX",								//    _settingType - Type of setting. Can be "CHECKBOX", "EDITBOX", "LIST", "SLIDER" or "COLOR" <STRING>
	["Purple","Will create a mapmarker for ACE marker flags of this type when placed by a player."],
											//    _title       - Display name or display name + tooltip (optional, default: same as setting name) <STRING, ARRAY>
	["CVO Intel", "Placed by Player - Type"],					//    _category    - Category for the settings menu + optional sub-category <STRING, ARRAY>
	true,									//    _valueInfo   - Extra properties of the setting depending of _settingType. See examples below <ANY>
	1,										//    _isGlobal    - 1: all clients share the same setting, 2: setting can't be overwritten (optional, default: 0) <NUMBER>
	{},										//    _script      - Script to execute when setting is changed. (optional) <CODE>
	true									//    _needRestart - Setting will be marked as needing mission restart after being changed. (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
	"CVO_SET_Intel_Flag_progessive_Orange",			//    _setting     - Unique setting name. Matches resulting variable name <STRING>
	"CHECKBOX",								//    _settingType - Type of setting. Can be "CHECKBOX", "EDITBOX", "LIST", "SLIDER" or "COLOR" <STRING>
	["Orange","Will create a mapmarker for ACE marker flags of this type when placed by a player."],
											//    _title       - Display name or display name + tooltip (optional, default: same as setting name) <STRING, ARRAY>
	["CVO Intel", "Placed by Player - Type"],					//    _category    - Category for the settings menu + optional sub-category <STRING, ARRAY>
	true,									//    _valueInfo   - Extra properties of the setting depending of _settingType. See examples below <ANY>
	1,										//    _isGlobal    - 1: all clients share the same setting, 2: setting can't be overwritten (optional, default: 0) <NUMBER>
	{},										//    _script      - Script to execute when setting is changed. (optional) <CODE>
	true									//    _needRestart - Setting will be marked as needing mission restart after being changed. (optional, default false) <BOOL>
] call CBA_fnc_addSetting;