#include "../script_component.hpp"

/*
* Author: Zorn
* Function to register a new CSC Entry. Does not define where to make it available.
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


params [
	["_entryName",  "Default",  	[""]            ],
	["_items",		[], 			[[]]            ],
	["_backpacks",	[],				[]	            ],
	["_hashMap",	"404",		    [createHashMap] ],
    ["_catName",    "global",       [""]            ]
];


// Verfiy Input

private _failedParams = false;

{
    // Current result is saved in variable _x
    ZRN_LOG_MSG_1(Validating array,_x);
    {
        private _return = _x isEqualTypeParams ["", 0];
        ZRN_LOG_MSG_2(validating:,_x,_return);

        if ( ! _return ) then { _failedParams = true };
    } forEach _x;
    
} forEach [_items, _backpacks];


if (_failedParams) exitWith {ZRN_LOG_MSG(FAILED - ITEM/BACKPACK ARRAY INVALID ENTRY);};

private _cat = [_catName] call FUNC(catalog);

private _entry = _cat getOrDefault [_entryName, "404"];

if (_entry isEqualTo "404") then {

    _entry = createHashMapFromArray [ ["entryName", _entryName] ];
    _entry merge [+ (_cat get "Default Entry"), false];
};

_entry set ["items", _items];
_entry set ["backpacks", _backpacks];

if (_hashMap isNotEqualTo "404") then {
    _entry merge [_hashMap, true];
};

_cat set [_entryName, _entry];