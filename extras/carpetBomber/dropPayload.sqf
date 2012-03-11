
echoPilot doMove (gnrf_clientBombPos2);
	
_bombCnt = echoPlane getVariable "bombCnt";
_dis = 0;
waitUntil {_dis = [echoPlane, gnrf_clientBombPos1] call BIS_fnc_distance2D; _dis <= 570};

for "_i" from 1 to _bombCnt do {

	call compile format ["
		
		gnrf_carpetBombA%1 attachTo [echoPlane, [0,0,-15]];
		gnrf_carpetBombB%1 attachTo [echoPlane, [-10,0,-15]];
		gnrf_carpetBombC%1 attachTo [echoPlane, [10,0,-15]];
		sleep 0.2;
		detach gnrf_carpetBombA%1;
		detach gnrf_carpetBombB%1;
		detach gnrf_carpetBombC%1;
					
	", _i];	
		
	if (!alive echoPlane) exitWith {};

};

gnrf_echoBombsDropped = true;