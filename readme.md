# Steam Workshop
https://steamcommunity.com/sharedfiles/filedetails/?id=3037257908


# Addons
## [CSC - Custom Supply Crates](/addons/csc/readme.md)
Creates an ACE Interaction on an individual Object or Objects of a certain Classname.
When Action is being executed, an AmmoCrate with customizable Content is being spawned.

## [ULA - Unhide Layer Action](/addons/ula/readme.md)
Creates an Ace Interaction on an object. The object needs to be near a set of editor objects inside a layer with a certain name. 
When the action is being executed, it simulates the building of "something", by unhiding the objects in the defined layer, one after another - based on bbjects ASL from lowest to highest object.


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
![alt text](/img/readme/dynamicGroups.png)

Modifies and enhances BI's dynamic groups system.

* removes *unconscious* and *dead* icons from player list in group menu
* removes randomized insignia on group creation
* adds insignia selection menu to group menu (click on insignia symbol)
