


# Notes


## CSC - Custom Supply Crates
Creates an ACE Action on an individual Object or Objects of a certain Classname.
When Action is being executed, an AmmoCrate with customizable Content is being spawned.

### Functions
#### CVO_CSC_fnc_addCSC
```sqf
/*
 * Author: Zorn
 * Creates an ACE INTERACTION on the Target to request an AmmoCrate and fills it with a custom Array.
 *
 * Arguments:
 * 0: Target supplySpawner, where the ace action should be added <OBJECT> or <CLASS as STRING>
 * 1: Name of the supplyCrateAction <string>
 * 2: Nested Array of content EXCEPT BACKPACKS [["class0", amount], ["classN",#]] <Nested Array>
 * 3: Class of Crate to be used <OBJECT> <Optional - Default: "LandWoodenBox_F">
 * 4: Nested Array of Content BACKPACKS Only [[class0, #], [classN,#]] <Nested Array > <optional - Default: []>
 * 5: Spawn Location - ideally a invisible helipad or Tarp_01_Large_Black_F <Object> <optional - default: objNull>
 * 
 * Return Value:
 * None
 *
 * Examples:
 */  
[
	ourSupplyTruck, 
	"Monkey Care Package",
	[
		["Ace_banana", 100],
		["ace_maptools",100]
	]
] call CVO_CSC_fnc_addCSC;

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
	]
] call CVO_CSC_fnc_addCSC;
```

#### cvo_CSC_fn_spawnCSC
internal function that does the spawning part

## Music

### Functions
#### cvo_music_fnc_music
```sqf
// Plays random music from premade playlists
// 0: premade playlist <string>
// Example:
["postInit"] call cvo_music_fnc_music;
["leaveBase"] call cvo_music_fnc_music;
```

#### cvo_music_fnc_play
```sqf
// Plays music if the queue is empty, if not, it will be put the track into the queue
//  Arguments:
//  0: classname of music
//  1: Name of queue Variable
//  Return Value:
//  None
["NEXT"] call cvo_music_fnc_play;
["cvo_music_"] call cvo_music_fnc_play;
```

#### cvo_music_fnc_fadeStop
```sqf
// To be executed on each client. Saves the current musicVolume, fades the current volume, stops the music then restores the previous musicVolume (default 5)
[]   remoteExec ["cvo_music_fnc_fadeStop"];
[30] remoteExec ["cvo_music_fnc_fadeStop"];
```

## Others

### Functions
#### CVO_Others_fnc_fullHeal
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

### Flag Texture Paths
```sqf 
this setFlagTexture "z\cvo_aux\addons\others\img\flag_voron_red_512.paa";
this setFlagTexture "z\cvo_aux\addons\others\img\flag_voron_red_2048.paa";

this setFlagTexture "z\cvo_aux\addons\others\img\flag_voron_olive_512.paa";
this setFlagTexture "z\cvo_aux\addons\others\img\flag_voron_olive_2048.paa";
```

### Leaderportrait
tba. 
Classname  `GalleryFrame_01_large_portrait_F`
Texture #0 `z\cvo_aux\addons\others\img\Leaderportrait.paa`
Note: Seems like it doesnt like `"`
Old Path:  `z\cvo_aux\img\Leaderportrait.paa`


## Grad's Dynamic Groups
![alt text](img\readme\dynamicGroups.png)

Modifies and enhances BI's dynamic groups system.

* removes *unconscious* and *dead* icons from player list in group menu
* removes randomized insignia on group creation
* adds insignia selection menu to group menu (click on insignia symbol)