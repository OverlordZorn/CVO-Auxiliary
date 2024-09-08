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

## cvo_common_medical

```sqf
/*
Description:
	 Adds an Ace Interaction to a vehicle class so players can perform a fullheal with a progressbar (30s) on said vehicle.

Dependency: ACE, CBA

Parameter(s):
	0: <_target> can be one of: 
					<Object>	     	    							- Individual Object to add the Full Heal ACE Action
					<String of classname>   							- Entire Class to add the Full Heal ACE Action
		1:  <_duration>	<Number in secounds>    <Optional> <Default: 30>	- Duration of the Healing Process
	2: 	<_chance> 	<Number 0..100> 		<Optional> <Default: 5>		- Defines the chance for the Easeregg sound - 0 disables the Easteregg
	Returns:
	Returns False when <_target> is not defined.

*/
		[ourMedicalVehicleObject]                 call CVO_Others_fnc_fullHeal;	// Adds Full Health Check on a single object
		["mod_vehicle_medical_classname", 30, 0]  call CVO_Others_fnc_fullHeal;	// Adds Full Health Check on all objects of this classname and disables the easteregg
```

