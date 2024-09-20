if (!isServer) exitWith {};

/*
* Author: Zorn
* Post Init Function for the Mission. Establishes the Rockslide Script.
*
* Parameters:

    ["_startObj",   objNull,    [objNull]   ],
    ["_layerName",  "",         [""]        ],
    ["_numBombs",   1,          [0]         ],
    ["_duration",   40,         [0]         ],
    ["_recieveDmg", false,      [true]      ]

* Example:
    [rockslide_start, "ROCKSLIDE"] call cvo_rockslide_fnc_prep;
*/


[rockslide_start, "ROCKSLIDE", 4] call cvo_rockslide_fnc_prep;