/*
* Author: Zorn
* Adds eventhandler to the helicopter to change the owner of sling loaded cargo.
* To be used in the helicopters init attribute field.
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* [this] call CVO_Common_fnc_slingload_cargoOwner;
* Public: Yes
*/

params [
    ["_heli", objNull, [objNull]]
];

if (isServer) then {
    _heli addEventHandler ["RopeAttach", {
        params ["_heli", "_rope", "_cargo"];
        _cargo setOwner (owner driver _heli);
    }];

    _heli addEventHandler ["RopeBreak", {
        params ["_heli", "_rope", "_cargo"];
        _cargo setOwner 2;
    }];
};





/*

if (isServer) then {
    this addEventHandler ["RopeAttach", {
        params ["_heli", "_rope", "_cargo"];
        _cargo setOwner (owner driver _heli);
    }];

    this addEventHandler ["RopeBreak", {
        params ["_heli", "_rope", "_cargo"];
        _cargo setOwner 2;
    }];
};


*/