#include "../script_component.hpp"

/*
* Author: Zorn
* Function that will initialize ether the creation of the crate where it is needed or the airDrop feature.
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

// this stuff needs to happen on the server

if !(isServer) exitWith {};

params ["_target", "_player", "_actionParams"];
_actionParams params ["_entryName","_catName"];

ZRN_LOG_MSG_1(INIT,_this);


if (typeOf _target isEqualTo "ModuleCurator_F") then { /* ZEUS AIRDROP REQUEST*/ };