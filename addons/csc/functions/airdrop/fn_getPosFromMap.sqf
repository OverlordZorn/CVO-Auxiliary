#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to open the Map and click on the map to define the target position.
* 
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* ['something', player] call cvo_fnc_sth
*
* Public: No
*/

if !(hasInterface) exitWith {};

params [
    ["_entryName",  "",     [""]    ],
	["_catName", 	"",		[""]	]
];

#define MSG_designate ["<t color='#0000ff' size='1'>supplyDrop<br/>Left Click to designate dropzone<br/>Alt + Left Click to abort</t>", -1, 0, 60, 1] spawn BIS_fnc_dynamicText;
#define MSG_success   ["<t color='#00ff00' size='1'>supplyDrop<br/>successful</t>", -1, 0, 5, 1] spawn BIS_fnc_dynamicText;
#define MSG_aborted   ["<t color='#ff0000' size='1'>supplyDrop<br/>aborted</t>", -1, 0, 5, 1] spawn BIS_fnc_dynamicText;


private _isCuratorOpen = !isNull (findDisplay 312);

// Closes Zeus Interface and Opens the Map with slight delay
if (_isCuratorOpen) then {
	findDisplay 312 closeDisplay 2;
	missionNamespace setVariable [QGVAR(curatorWasOpen), true];
};
[ {
	openMap [true, true];
	MSG_designate
} , [], 0.1] call CBA_fnc_waitAndExecute;


// adds Eventhandler to recieve Mouse Click Input
private _id_mapClick = addMissionEventHandler [
	"MapSingleClick",
	{
		params ["_units", "_pos", "_alt", "_shift"];
		_thisArgs params ["_entryName","_catName"];

		missionNamespace setVariable [QGVAR(mapClicked), true];
		
		if (_alt) exitWith { MSG_aborted };


		ZRN_LOG_MSG_2(Position Defined,_entryName,_pos);
		
		[QGVAR(EH_dispatch), [_entryName,_catName,_pos] ] call CBA_fnc_serverEvent;		
		MSG_success;
	},
	[_entryName,_catName]
];


// Handles Timeout and Cleanup

private _code = {
	params ["_id_mapClick"];

	openMap [false, false];
	removeMissionEventHandler ["MapSingleClick", _id_mapClick];
	missionNamespace setVariable [QGVAR(mapClicked), nil];

	if (missionNamespace getVariable [QGVAR(curatorWasOpen), false]) then {openCuratorInterface};
};
private _code_timeout = {
	params ["_id_mapClick"];

	openMap [false, false];
	removeMissionEventHandler ["MapSingleClick", _id_mapClick];
	missionNamespace setVariable [QGVAR(mapClicked), nil];

	if (missionNamespace getVariable [QGVAR(curatorWasOpen), false]) then {openCuratorInterface};
	
	MSG_aborted
};

[
	{ missionNamespace getVariable [QGVAR(mapClicked), false] },
	_code,
	[_id_mapClick],
	60,
	_code_timeout
] call CBA_fnc_waitUntilAndExecute;