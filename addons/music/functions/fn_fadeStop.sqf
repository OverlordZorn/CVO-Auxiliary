/*
 * Author: [Name of Author(s)]
 * To be executed on each client. Saves the current musicVolume, fades the current volume, stops the music then restores the previous musicVolume 
 *
 * Arguments:
 * 0: <Optional> Time to Fade <Number> (Default: 5)
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * []   remoteExec ["cvo_music_fnc_fadeStop"];
 * [30] remoteExec ["cvo_music_fnc_fadeStop"];
 *
 * Public: yes
 */

params [
	["_fadeTime", 5, [0]]
];

if (!isNil "CVO_Music_isFading") exitWith {};

CVO_Music_isFading = true;
private _savedMusicVolume = musicVolume;
_fadeTime fadeMusic 0;
[
	{	playMusic "";
		0 fadeMusic _this;
		CVO_Music_isFading = nil;	},		// Code
	_savedMusicVolume,						// Parameters
	(_fadeTime + 1)							// Time To wait
] call CBA_fnc_waitAndExecute;