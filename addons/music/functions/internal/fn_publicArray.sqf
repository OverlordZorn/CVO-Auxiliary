#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to update and Broadcast the public array which is used for the ACE Interacion.
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* ['something', player] call prefix_component_fnc_functionname
*
* Public: No
*/

params [ "_hashmap" ];

private _previousKeys = GETMGVAR(public_keys,[]);

private _newKeys = keys  _hashmap select { !( "_pool" in _x ) && { count (_hashMap get _x) > 0 } };

if !( _previousKeys isEqualTo _newKeys ) then { SETMGVAR_PUBLIC(public_keys,_newKeys,true);};
