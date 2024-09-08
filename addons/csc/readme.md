# Custom Supply Crates

System to add an ACE Interaction to an Object/Classname. 

Interaction will create a Supplycrate that will be filled based on provided parameters.
Also supports other ACE features like rearm, repair, refuel. Can be preloaded with ACE Spareparts.

## Parameters
| index 	| param         	| type                  	| default           	| description                                                        	|
|-------	|---------------	|-----------------------	|-------------------	|--------------------------------------------------------------------	|
| 0     	| target        	| obj or classname      	| objNull           	| defines where the ace action is being added                        	|
| 1     	| title         	| string                	| "Default Name"    	| Name of the Crate and Displayname of the Interaction               	|
| 2     	| itemArray     	| array                 	| []                	| Array of items: [["classname", 69], ["ace_banana",69]]             	|
| 3     	| className     	| string                	| "LandWoodenBox_F" 	| Classname of desired Crateobject                                   	|
| 4     	| backpackArray 	| array                 	| []                	| Array of backpacks, like itemArray                                 	|
| 5     	| spawnLoc      	| String, Object or POS 	| "REL"             	| REL - Relative to the target, at position of object or at position 	|
| 6     	| hashmap       	| Hashmap               	| createHashmap     	| Hashmap of additional attributes, for details, see below           	|


### Currently supported values for the Hashmap
keys and default values
```sqf
createHashmapFromArray [
    ["ace_medical_facility", false],
    ["ace_medical_vehicle", false],

    ["ace_repair_facility", false],
    ["ace_repair_vehicle", false],

    ["ace_rearm_source", false],
    ["ace_rearm_source_value", 50],

    ["ace_refuel_source", false],
    ["ace_refuel_source_value", 50],
    ["ace_refuel_source_nozzlePos", [0,0,0]],

    ["ace_drag_canDrag", true],
    ["ace_drag_relPOS", [0,1.5,0]],
    ["ace_drag_dir", 0],
    ["ace_drag_ignoreWeight", true],

    ["ace_carry_canCarry", true],
    ["ace_carry_relPOS", [0,1,1]],
    ["ace_carry_dir", 0],
    ["ace_carry_ignoreWeight", false],

    ["ace_cargo_add_spareWheels", 0],
    ["ace_cargo_add_jerrycans", 0],
    ["ace_cargo_add_tracks", 0],
    // Space will be automatically adjusted

    ["ace_cargo_setSpace", 0],
    ["ace_cargo_setSize", "DEFAULT"]
]
```
## CBA Events
`cvo_csc_Event_crateSpawnedServer` - ServerEvent

## Example
```sqf
[
	cursorObject, 
	"Monkey Care Package",
	[
		["Ace_banana", 100],
		["ace_maptools",100]
	]
] call CVO_CSC_fnc_addCSC;
```

```sqf
[
	"ACM_APD_Unimog", 
	"CBRN Package", 
	[
		["U_C_CBRN_Suit_01_Blue_F",6],
		["G_RegulatorMask_F",6]
	],
	"LandWoodenBox_F",
	objNull,
	[
		["B_SCBA_01_F",6]
	],
] call CVO_CSC_fnc_addCSC;
```
