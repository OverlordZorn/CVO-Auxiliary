#include "../script_component.hpp"

/*
*	Scans all Objects on the map, then, seperates out required flag colors.
*
*
*
*/

diag_log "[CVO](debug)(fn_findAllFlags) Init ";

private _array = 8 allObjects 0;

_flags = _array select {"ace_marker_flags" in typeOf _x};

diag_log format ['[CVO](debug)(fn_findAllFlags) ACE Marker Flags found: %1', count _flags];

{
	private _color = typeOf _x splitString "_" select -1;
	private _isEnabled = missionNamespace getVariable[ ["CVO_SET_Intel_Flag_initial",_color] joinString "_", false];
	diag_log format ['[CVO](debug)(fn_findAllFlags) _x: %1 - _color: %2 - _isEnabled: %3', _x , _color ,_isEnabled];

	if (_isEnabled) then {
		[_x] call FUNC(createFlagMarker);
	};

} forEach _flags;

diag_log ("[CVO] [INTEL] [FLAGS] (FAF) completed");