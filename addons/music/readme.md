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
