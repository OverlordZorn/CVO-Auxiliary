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
{ if ( ! (_x params [ ["", "", [""]], ["", 0,[0] ] ] ) ) then {_failedParams = true}; } forEach _items;
{ if ( ! (_x params [ ["", "", [""]], ["", 0,[0] ] ] ) ) then {_failedParams = true}; } forEach _backpacks;

if (_failedParams) exitWith {};

private _cat = [_catName] call FUNC(catalog);

private _entry = _cat getOrDefault [_entryName, "404"];

if (_entry isEqualTo "404") then {

    _entry = createHashMapFromArray [ ["entryName", _entryName] ];
    _entry merge [(_cat get "Default Entry"), false];
};

_entry set ["items", _items];
_entry set ["backpacks", _backpacks];

if (_hashMap isNotEqualTo "404") then {
    _entry merge [_hashMap, true];
};

_cat set [_entryName, _entry];