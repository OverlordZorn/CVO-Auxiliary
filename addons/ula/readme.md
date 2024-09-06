# Unhide Layer Action

## What this?

Creates an Ace Interaction on an object to simulate the building of "something", by unhiding the objects sind a layer.





## Showcase
https://www.youtube.com/watch?v=buWmeaKfe0M


## Parameters
0 - Object: the object that acts as the "building supplies crate" which has the action attached to it.
1 - Array of Layernames: One crate can be used for multiple layers.
2 - Distance: Minimum Distance the Object needs to be from the Median Position of the Layer
3 - Time: The time it takes per individual Entity to be placed.

```sqf
params [
    ["_obj",        objNull,        [objNull]       ],
    ["_layers",     [],             [[]]            ],
    ["_distance",   25,             [0]             ],
    ["_time",       5,              [0]             ]
];
```

## Example
```sqf
[this, ["SIGINT at Comms Alpha", "SIGINT at Comms Alpha"]] call cvo_ula_fnc_register_object;
```

## Notes:

Median Position: The "Median" Position will be calculated by finding the middlepoint of entities who are part of the layer.

This feature only "unhides" each object by using `_obj hideObjectGlobal false`.

Attributes regarding, Simulation, Simple Object have to be managed in the Editor.

> [!CAUTION]
Objects set as "LOCAL ONLY" will not work in Multiplayer.