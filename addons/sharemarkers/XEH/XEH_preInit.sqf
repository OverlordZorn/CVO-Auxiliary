#include "../script_component.hpp"

[
	QSET(provide_filter),						//    _setting     - Unique setting name. Matches resulting variable name <STRING>
	"LIST",									//    _settingType - Type of setting. Can be "CHECKBOX", "EDITBOX", "LIST", "SLIDER" or "COLOR" <STRING>
	["Provide Markers: Type","Choose which markers to provide\nAll Markers - even those provided by the mission\nOnly Player Markers: Ignore Editor or Script placed Markers\nOnly Personal Markers: Only markers that the player themselves have put on the map during the session"],
											//    _title       - Display name or display name + tooltip (optional, default: same as setting name) <STRING, ARRAY>
	["CVO", "Share Markers"],					//    _category    - Category for the settings menu + optional sub-category <STRING, ARRAY>
	[["ALL", "ALLPLAYERS", "ONLYTHIS"], ["All Markers", "Only Player Markers", "Only Personal Markers"],1],									//    _valueInfo   - Extra properties of the setting depending of _settingType. See examples below <ANY>
	0,										//    _isGlobal    - 1: all clients share the same setting, 2: setting can't be overwritten (optional, default: 0) <NUMBER>
	{},										//    _script      - Script to execute when setting is changed. (optional) <CODE>
	false									//    _needRestart - Setting will be marked as needing mission restart after being changed. (optional, default false) <BOOL>
] call CBA_fnc_addSetting;
