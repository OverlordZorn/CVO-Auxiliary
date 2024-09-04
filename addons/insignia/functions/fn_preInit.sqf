addMissionEventHandler ["GroupCreated", {
	params ["_group"];
    
    diag_log format ['[CVO](debug)(fn_preInit) _group: %1', _group];
    diag_log format ['[CVO](debug)(fn_preInit) units _group: %1', units _group];
    private _hasPlayers = (units _group findif {isPlayer _x}) isNotEqualTo -1;
    diag_log format ['[CVO](debug)(fn_preInit) _hasPlayers: %1', _hasPlayers];

}];
