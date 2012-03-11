
//keyHandling
waitUntil {!isNull (findDisplay 46) AND (!isNil "grnf_keyHandling_fnc")};
(findDisplay 46) displayAddEventHandler ["keyDown", "_this call grnf_keyHandling_fnc"];

//player respawn
player addEventHandler ["killed", 
{ 
	[] spawn {		
		player setVariable ["deathPos", getPos player];
		waitUntil {alive player}; 
		[] spawn gnrf_playerRespawn_fnc;			
	};	
}];

//fired near player
player addEventhandler ["FiredNear", {[_this select 0] spawn grnf_firedNearPlayer_fnc}];


