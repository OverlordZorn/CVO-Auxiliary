###

params [
    ["_varName",        objNull,        [""]    ],
    ["_displayName",    "Take Intel",   [""]    ],
    ["_title",          "Intel Item",   [""]    ],
    ["_structuredText", "Test Intel",   [""]    ],
    ["_soundType",      "BODY",         [""]    ],
    ["_duration",       15,             [0]     ],
    ["_intelGroup",     "Intel",        [""]    ],
    ["_removeObject",   true,           [true]  ]
];

```sqf

[
    
] call cvo_intel_fnc_createIntel
```

## Structured Text Examples

### Text Messages
```sqf
private _str_intel = format ["
<font size='14' face='EtelkaMonospacePro'>
Messenger App History with 'Boss' - 1 year ago:%1</font>%1
<font size='12' color='#2dc492' face='EtelkaMonospacePro'>Hey Boss - Bad news - The prisoner died. I think we should have given some water. - Do you want us to wait for the ION guys?</font>%1%1
<font size='12' color='#2d97fa' face='EtelkaMonospacePro'>Wait until the evening, otherwise just leave.</font>%1%1
<font size='12' color='#2dc492' face='EtelkaMonospacePro'>We kinda like...got lost on the way here and the GPS ran out of batteries - can you give us the direciton? Jamal has a compass.</font>%1%1
<font size='12' color='#2d97fa' face='EtelkaMonospacePro'>Seems like you guys outran your own wisdom again... Let me take a look...</font>%1%1
<font size='12' color='#2d97fa' face='EtelkaMonospacePro'>Right... the coordinates we gave you are 1800 meters at bearing 350 from base.</font>%1%1
",
"<br />"];
```


### Email Message
```sqf
format ["
<font size='12' face='EtelkaMonospacePro'>
Message history:%1
From: B. Keller%1
To: All Shift Captains</font>%1
%1
Hey Shift Captains, we at Daltgreen have been pioneers in extraction for decades, leading the field in new and exciting techniques for mining.%1
Today, we are rolling out another of our revolutionary innovations in geoengineering, and you will be the first people to use this revolution in the field!%1
One word of caution, some of the materials we will be working with will be moderately hazardous, and we recommend that all Daltgreen personnel use appropriate personal protective equipment.%1
Your teams will be issued the correct PPE at your next pre-shift meeting.%1
",
"<br />"]
```


### handwritten note
```sqf
format ["
You found a handwritten note in the ION barracks under a bed:%1
<font size='24' color='#ff000d' face='shaffilastri'>Take your team and go make sure that village elder cant bother us any more.</font>%1
",
"<br />"]
```


### Images
```sqf
format ["
<img width='350' image='%1'/>
",
getMissionPath "intel\handdrawnmapws.paa"
]
```


### template
```sqf
format ["

"]
```