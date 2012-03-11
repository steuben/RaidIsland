
//determine lenght and direction of attack vector
_len = (gnrf_clientBombPos1 distance gnrf_clientBombPos2);	
_dir = [gnrf_clientBombPos1, gnrf_clientBombPos2] call BIS_fnc_dirTo;

//create visible plane spawn marker
_pos = gnrf_clientBombPos1;
_dis = -2500;
_planeSpawnPos = [(_pos select 0)+(sin _dir)*_dis, (_pos select 1)+(cos _dir)*_dis, 500];
_planeSpawn = createMarker ["gnrf_planeSpawnMakerName",_planeSpawnPos];
_planeSpawn setMarkerColor "ColorRed";
_planeSpawn setMarkerType "Arrow";
_planeSpawn setMarkerText "Air Support";
_planeSpawn setMarkerDir _dir;

//determine center of bombardement
_dis = _len / 2;
_carpetCenterPos = [(_pos select 0)+(sin _dir)*_dis, (_pos select 1)+(cos _dir)*_dis, _pos select 2];
_carpetCenterPos set [2, 200];

//set max length of bombing area
_maxLen = 500; 

//trim bombing area if too long
if (_len > _maxLen) then {

	_len = _maxLen;
	_dis = _len / -2;	
	gnrf_clientBombPos1 = [(_carpetCenterPos select 0)+(sin _dir)*_dis, (_carpetCenterPos select 1)+(cos _dir)*_dis, _carpetCenterPos select 2];
	
	_dis = _len / 2;	
	gnrf_clientBombPos2 = [(_carpetCenterPos select 0)+(sin _dir)*_dis, (_carpetCenterPos select 1)+(cos _dir)*_dis, _carpetCenterPos select 2];
	
	[-1, {titleText [format ["Maximum length of bombing area is %1. Target coordinates were adjusted accordingly.", _this], "PLAIN DOWN"]}, _len] call CBA_fnc_globalExecute;

} else {
	
	[-1, {titleText ["Strategic bombardmend ordered on target area", "PLAIN DOWN"]}] call CBA_fnc_globalExecute;
};

//mark bombing area
_targetArea = createMarker ["gnrf_targetAreaName",_carpetCenterPos];
_targetArea setMarkerColor "ColorRed";
_targetArea setMarkerShape "RECTANGLE";
_targetArea setMarkerSize [30, _dis];
_targetArea setMarkerBrush "FDIAGONAL";
_targetArea setMarkerDir _dir;

//create pilot
grnf_echo1Grp = Creategroup WEST;
echoPilot = grnf_echo1Grp createUnit ["USMC_Soldier_Pilot", _planeSpawnPos, [], 10, "FORM"];
echoPilot setGroupId ["Echo-1"];
publicVariable "echoPilot";  

//create plane
echoPlane = "ACE_HC130_N" createVehicle [_planeSpawnPos select 0, _planeSpawnPos select 1, 5000];
echoPlane setPos [getPos echoPlane select 0, getPos echoPlane select 1, 200];
echoPilot moveInDriver echoPlane;
echoPlane flyInHeight 200;
echoPlane setDir _dir;
echoPlane setVelocity [64*(sin _dir), 64*(cos _dir), 0];

publicVariable "echoPlane";

//determine numbers of bombs to be spawned depending on bombing area lenght
_bombCnt = ceil(_len * 0.057);
echoPlane setVariable ["bombCnt", _bombCnt];

//trigger starts bombardement at right distance
_trg = createTrigger["EmptyDetector", _carpetCenterPos]; 
_rad = _dis + 650;
_trg setTriggerArea[_rad,_rad,0,false]; 
_trg setTriggerActivation ["ANY","PRESENT",false]; 
_trg setTriggerStatements ["echoPlane in thisList", "[] spawn gnrf_echoDropPayload", ""];

//create move-waypoint at target position
_wp = grnf_echo1Grp addWaypoint [_carpetCenterPos, 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "LIMITED";

echoPlane flyInHeight 200;

//ingame message
[-1, {echoPilot sideChat format ["%1, this is Echo-1. We're approaching target destination.", _this]}, echoCaller] call CBA_fnc_globalExecute;

//wait until close to taget area
waitUntil {sleep 2.14; _dis = [echoPlane, gnrf_clientBombPos1] call BIS_fnc_distance2D; (_dis <= 1000) OR (!alive echoPlane) OR (!alive echoPilot)};

//all bombs are pre-spawned off-screen
for "_i" from 1 to _bombCnt do {

	if ((!alive echoPlane) OR (!alive echoPilot)) exitWith {};
	
	call compile format ["
	
		gnrf_carpetBombA%1 = 'Bo_Mk82' createVehicle [0, 0, 10000];
		gnrf_carpetBombB%1 = 'Bo_Mk82' createVehicle [0, 0, 10000];
		gnrf_carpetBombC%1 = 'Bo_Mk82' createVehicle [0, 0, 10000];		
	", _i];	
};

//////trigger fires here! see dropPayload.sqf//////

//continue when bombs are dropped or plane is killed
waitUntil {sleep 0.925; (!isNil "gnrf_echoBombsDropped") OR (!alive echoPlane) OR (!alive echoPilot)};

deleteMarker _targetArea;

//plane returns to spawnpoint
if ((alive echoPlane) AND (alive echoPilot)) then {
	
	[-1, {echoPilot sideChat "Bombs away!"}] call CBA_fnc_globalExecute;
	sleep 1;	
	echoPilot doMove (_planeSpawnPos);
	echoPlane flyInHeight 500;
	echoPilot setSpeedMode "FULL";
	sleep 6;
	if ((alive echoPlane) AND (alive echoPilot)) then {[-1, {echoPilot sideChat format ["That was money well spent, %1. Payload is deployed, Echo-1 is heading back to airbase.", _this]}, echoCaller] call CBA_fnc_globalExecute};
	
//create move-waypoint at home position
	_wp = grnf_echo1Grp addWaypoint [_planeSpawnPos, 0];
	_wp setWaypointType "MOVE";
	_wp setWaypointBehaviour "SAFE";
	_wp setWaypointSpeed "FULL";
	_wp setWaypointCompletionRadius 300;
	_wp setWaypointStatements ["true", "grnf_echoHome = true"];
	
//make sure bomber gets home
	_timer = 0;
	while {sleep 5; (alive echoPlane) AND (alive echoPilot) AND (isNil "grnf_echoHome")} do {

		echoPilot doMove (_planeSpawnPos);
		_timer = _timer + 1;
		if (_timer >= 18) then {grnf_echoHome = true};
	};
	
	waitUntil {sleep 2.32; (!alive echoPlane) OR (!alive echoPilot) OR (!isNil "grnf_echoHome")};	
};


//if plane is shot down
if ((!alive echoPlane) OR (!alive echoPilot)) then {
	
	[-1, {echoPilot sideChat "Mayday! Mayday! Echo1 is going down. Oh my god, no! Tell my family I lo---"}] call CBA_fnc_globalExecute;
	 
	deleteMarker _targetArea;
	deleteMarker _planeSpawn;
	 
	sleep 60;
	
	deleteVehicle echoPlane;
	deleteVehicle echoPilot;
	
	[-1, {titleText ["Echo bomb squadron has been replenished.", "PLAIN"]}] call CBA_fnc_globalExecute;

//replenish 
} else {
	
	deleteMarker _planeSpawn;
	deleteVehicle echoPlane;	

	[-1, {echoPilot sideChat "Echo-1 is now refueled, rearmed and ready for new orders.";}] call CBA_fnc_globalExecute;

	sleep 1;
	deleteVehicle echoPilot;
};

//clean up

deleteVehicle _trg;

echoPlane = nil;
gnrf_echoBombsDropped = nil;
grnf_echoHome = nil;
_targetArea = nil;
_planeSpawn = nil;
_carpetCenterPos = nil;
_planeSpawnPos = nil;
_distanceHome = nil;
_distanceTarget = nil;
_maxLen = nil;
_len = nil;
_pos = nil;
_dir = nil;
_dis = nil;

[-1, {AirSupport_SUBMENU set [1, ["Carpet Bombardment", [2], "", -5, [["expression", "[player] execVM 'extras\carpetBomber\carpetInit.sqf'"]], "1", "1"]]}] call CBA_fnc_globalExecute;

[-2, {echoReady = nil; echoPilot = nil; echoCaller =nil}] call CBA_fnc_globalExecute;
















