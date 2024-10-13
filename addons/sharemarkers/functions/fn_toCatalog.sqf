#include "../script_component.hpp"

/*
* Author: Zorn
* Store Markers on serverside map-marker-catalaog
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* ['something', player] call prefix_component_fnc_functionname
*
* Public: Yes
*/

if !(isServer) exitWith {};

ZRN_LOG_MSG(INIT);

params ["_markersHM","_obj","_provider","_catalogName"];

ZRN_LOG_MSG_3(INIT,_obj,_provider,_catalogName);

// Checks if there is already a catalogname attached to the object
// When new or same catalog, continue - if different catalog previously present, dont continue.

private _prevCatName =_obj getVariable [QGVAR(cat_name), false];

ZRN_LOG_1(_prevCatName);

if (  _prevCatName isNotEqualTo false && _prevCatName isNotEqualTo _catalogName ) exitWith { ZRN_LOG_MSG(FAILED);};


private _catalog = missionNamespace getVariable [_catalogName, "404"];
ZRN_LOG_1(_catalog);
if (_catalog isEqualTo "404") then {
    _catalog = createHashMap;
    missionNamespace setVariable [_catalogName, _catalog];
    ZRN_LOG_MSG_1(catalog created,_catalogName);
};


private _objRef = _obj getVariable [QGVAR(cat_objRef), false];
if (_objRef isEqualTo false) then  {
    _objRef = missionNamespace getVariable [[_catalogName,"index"] joinString "_", 0];
    _obj setVariable [QGVAR(cat_objRef), _objRef];
};


private _entryKey = [_objRef, name _provider];
private _entryValue = _markersHM;

ZRN_LOG_2(_entryKey,_entryValue);

_catalog set [_entryKey, _entryValue];


missionNamespace setVariable [([_catalogName,"keys"] joinString "_"), keys _catalog, true];



// If this object is new, it will add the catalog name and add eventhandler to cleanup the catalog if the obj gets destroyed or deleted.
if  (_obj getVariable [QGVAR(cat_name), false] isEqualTo false) then {

    _obj setVariable [QGVAR(cat_name), _catalogName, true];

    private _cleanUp = {
        params ["_obj"];

        if (_thisEvent == "Dammaged" && { damage _obj != 1}) exitWith {};

        private _catalogName = _obj getVariable [QGVAR(cat_name), false];
        if (_catalogName isEqualTo false) exitWith {};

        private _catalog = missionNamespace getVariable _catalogName;

        { _catalog deleteAt _x } forEach (keys _catalog select { _x#0 == _obj});
    };

    _obj addEventHandler ["Dammaged", _cleanUp];
    _obj addEventHandler ["Deleted",  _cleanUp];
};

_objRef = _objRef + 1;
missionNamespace setVariable [[_catalogName,"index"] joinString "_", _objRef, true];
