# CVO_Others

## functions

### `cvo_common_fnc_executeUnit`

adds force to a unit and sets damage to 1 afterwards.

Parameters:
```sqf
params  [
    ["_target", objNull,    [objNull]   ],
    ["_dir",    "RND",      [0,""]      ],
    ["_mag",    300,        [0]         ],
    ["_rndVal", 90,         [0]         ],
    ["_offset", [0,0,1.5],  [[]],   [3] ]
];
```

#### cba server Event:
`cvo_EVENT_executeUnitServer`


#### Preview
https://www.youtube.com/watch?v=pVdZ5OpLhb4

#### Example
```sqf
// to be used in the units init file
[this] call cvo_common_fnc_executeUnit;

[_unit, 0, 300] call cvo_common_fnc_executeUnit; 
```

