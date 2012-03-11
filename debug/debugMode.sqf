if (isDedicated) exitWith {};

If ((paramsArray select 0) == 1) then 
{
	debugModeOn = true;
	//setFriends (works only on missionstart)
	_setFriends = paramsArray select 1;
	_aiBehaviour = "";
	if (_setFriends == 1) then { 

		WEST setFriend [EAST,1]; 
		EAST setFriend [WEST,1]; 
		_aiBehaviour = "friendly";
	
	} else {
	
		_aiBehaviour = "hostile";
	};
	
	titleText [format["Mission started in Debug Mode. AI behaviour is set to %1", _aiBehaviour], "PLAIN"];
};

//initiate var´s
gnrf_debug_posArray = [];

gnrf_addDebugOptions_fnc = {
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////// simple addActions - Parameters passed to the code being executed are: [target, caller, ActionID, customParam]//////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//show debugOptions
_debugMenu_act = player addAction [("<t color=""#4693FF"">" + ("Debug Options") + "</t>"),"gen_action.sqf",[{	
	
	gnrf_debugMenu = true;
	
}],0,false,false,"","(isNil 'gnrf_debugMenu') AND debugModeOn"];

//hide debugOptions
_debugHideMenu_act = player addAction [("<t color=""#4693FF"">" + ("Hide Debug Options") + "</t>"),"gen_action.sqf",[{	
	
	gnrf_debugMenu = nil;
	
}],0,false,true,"","gnrf_debugMenu AND debugModeOn"];

//execute code from clipboard
_testCode_act = player addAction [("<t color=""#1F67CC"">" + ("Test Code") + "</t>"),"gen_action.sqf",[{
	
	_string = copyFromClipboard;
	call compile _string;
	
}],0,false, false,"","gnrf_debugMenu AND debugModeOn"];

//teleport
_teleport_act = player addAction ["<t color=""#1F67CC"">Teleport</t>","gen_action.sqf",[{	
	gnrf_teleportInUse = true;
	if (!visibleMap) then {openMap true};
	titleText ["Click on map to teleport", "PLAIN DOWN"];
	onMapSingleClick "onMapSingleClick''; player setPos _pos; openMap false; gnrf_teleportInUse = nil; true;";
}],0,false,true,"","(isNil 'gnrf_teleportInUse') AND (gnrf_debugMenu) AND debugModeOn"];

//get building positions
_getBuildingPos_act = player addAction [("<t color=""#1F67CC"">" + ("Get Building Positions") + "</t>"),"gen_action.sqf",[{
	_zargabadBuildings = [];
	
	_buildings = [4240,4160,0] nearObjects ["House",800];
	for "_i" from 0 to count (_buildings)-1 do {
	
		_house = _buildings select _i;
		_done = false;
		
		_cnt = 0;
		_debugPosArray = [];
			
		while {!_done} do {
		
			_tmpPos = _house buildingPos _cnt;
			if (count (_tmpPos - [0,0,0]) != 0) then {
		
				_debugPosArray set [count _debugPosArray, _tmpPos];
				_cnt = _cnt + 1;
		
			} else {
			
				_zargabadBuildings set [count _zargabadBuildings, _debugPosArray];
				_done = true;
			
			};
		};
	 };

	_myString = str (_zargabadBuildings);
	copyToClipboard _myString;
	player sideChat format ["%1 buildings scanned. Building positions were stored to clipboard.", count _zargabadBuildings];
	
}],0,false, false,"","gnrf_debugMenu AND debugModeOn"];


//debug object
_debugObj_act = player addAction [("<t color=""#1F67CC"">" + ("Debug Civ Unit") + "</t>"),"gen_action.sqf",[{
	
	_target = cursorTarget;
	_targetName = _target call grnf_GetDisplayName_fnc;
	_roles = _target getVariable "roles";	
	player sideChat format ["Name: %1 # Roles: %2", _targetName, _roles]; 
	
}],0,false,false,"","gnrf_debugMenu AND debugModeOn"];

//save my position
_savePos_act = player addAction [("<t color=""#1F67CC"">" + ("Save My Pos") + "</t>"),"gen_action.sqf",[{
	
	_pos = getPosASL player;
	gnrf_debug_posArray set [count gnrf_debug_posArray, _pos];
	copyToClipboard format ["%1", gnrf_debug_posArray]; 
	hintSilent format ["Position %1 added to clipboard", _pos];
	
}],0,false, false,"","gnrf_debugMenu AND debugModeOn"];

//clear all positions
_clearPos_act = player addAction [("<t color=""#1F67CC"">" + ("Clear All Positions") + "</t>"),"gen_action.sqf",[{
	
	gnrf_debug_posArray = [];
	hintSilent "Position Array Cleared";
	
}],0,false,true,"","(gnrf_debugMenu) AND (count gnrf_debug_posArray > 0) AND debugModeOn"];

//copy Map coords to clipboard via mouseklick
_coordMode_act = player addAction [("<t color=""#1F67CC"">" + ("Save Map Pos") + "</t>"),"gen_action.sqf",[{	
	gnrf_debugCoords = true;
	gnrf_debug_posArray = [];
	if (!visibleMap) then {openMap true};
	titleText ["Click on map to copy target coordinates to clipboard", "PLAIN DOWN"];
	onMapSingleClick "
	if ((_pos select 2) < 0) then {_pos = [_pos select 0, _pos select 1, abs(_pos select 2)]}; 
	gnrf_debug_posArray set [count gnrf_debug_posArray, _pos];
	copyToClipboard format ['%1', gnrf_debug_posArray]; 
	hintSilent format ['Position %1 added to clipboard', _pos];	
	true;
	";
	
}],0,false,true,"","(gnrf_debugMenu) AND (isNil 'gnrf_debugCoords') AND debugModeOn"];

//end map pos saving
_endPosMode_act = player addAction [("<t color=""#1F67CC"">" + ("Exit MapPos Mode") + "</t>"),"gen_action.sqf",[{
	
	gnrf_debugCoords = nil;
	gnrf_debug_posArray = [];
	onMapSingleClick "";
	hintSilent "Position Array Cleared";
	
}],0,false,true,"","(gnrf_debugMenu) AND (!isNil 'gnrf_debugCoords') AND debugModeOn"];


//heal all
_healAll_act = player addAction [("<t color=""#1F67CC"">" + ("Heal Units") + "</t>"),"gen_action.sqf",[{
	
	{_x setDamage 0} forEach units group player;
					
}],0,false,true,"","gnrf_debugMenu AND debugModeOn"];

//debug bomberman
_debugPortToBomberman_act = player addAction [("<t color=""#1F67CC"">" + ("Debug Bomberman") + "</t>"),"gen_action.sqf",[{	
	
	gnrf_debugBomberman = true;
	player setPos [4217,3920,0];
	_pos = getPos player;
	{_x setPos [(_pos select 0)+round(random 5), (_pos select 1)+round(random 5), 0]} forEach units group player;
	waitUntil {alive gnrf_testBomberman};
//	player setPos (getPos gnrf_testBomberman findEmptyPosition [1,20, "Man"]);
//	player moveInCargo vehicle gnrf_testBomberman;
	
}],0,false,true,"","(gnrf_debugMenu) AND (isNil 'gnrf_debugBomberman') AND debugModeOn"];

//board carpetbomber
_getInEcho_act = player addAction [("<t color=""#1F67CC"">" + ("Board Echoplane") + "</t>"),"gen_action.sqf",[{
player moveInCargo (vehicle echoPilot);
gnrf_playerInEcho = true;
}],0,false,true,"","(alive echoPilot) AND (gnrf_debugMenu) AND debugModeOn"];

//Function Viewer
_fncViewer_act = player addAction [("<t color=""#1F67CC"">" + ("Function Viewer") + "</t>"),"gen_action.sqf",[{
	waituntil {!isnil "bis_fnc_init"};
	[] call BIS_fnc_help;
}],0,false,true,"","gnrf_debugMenu AND debugModeOn"];

//kill units, only available if at least 1 unit is alive
_killUnits_act = player addAction [("<t color=""#1F67CC"">" + ("Kill Units") + "</t>"),"gen_action.sqf",[{	
	{_x SetDamage 1} foreach [bbq2,bbq3,bbq4,bbq5,bbq6,bbq7];
	{_x SetDamage 1} foreach [steuben2,steuben3,steuben4,steuben5,steuben6,steuben7];	
}],0,false,true,"","(({alive _x} count [bbq2,bbq3,bbq4,bbq5,bbq6,bbq7,steuben2,steuben3,steuben4,steuben5,steuben6,steuben7])) > 0 AND (gnrf_debugMenu) AND debugModeOn"];

// kill carpet bomber
_killEcho_act = player addAction [("<t color=""#1F67CC"">" + ("Kill Echo") + "</t>"),"gen_action.sqf",[{	
	echoPlane setDamage 1;
	hint "You killed Echo. Bastard.";		
}],0,false,true,"","alive echoPilot AND debugModeOn"];

// show all inf units on map
_revelations_act = player addAction [("<t color=""#1F67CC"">" + ("Reveal Test") + "</t>"),"gen_action.sqf",[{
	hintSilent "all inf units revealed";	
	{player reveal _x} forEach allUnits;
}],0,false,true,"","gnrf_debugMenu AND debugModeOn"];





//restart Villa
_villa_act = player addAction [("<t color=""#ff0000"">" + ("Restart Villa") + "</t>"),"gen_action.sqf",[{
	
	[0, {[[4850.7,4599.94,0]] execVM "extras\opforInBuildings.sqf";}] call CBA_fnc_globalExecute;
	
}],0,false, false,"","!isNil 'gnrf_villaRepeat' AND isNil 'grnf_villaIsTriggered' AND debugModeOn"];


////////////////add player actions above/////////////////////////////////////////////////////////////
};

[] call gnrf_addDebugOptions_fnc;

////////////non player actions //////////////////////////////////////////////////////////////////////
//heli teleport
gnrf_heli_teleport = {

gnrf_heli_teleport_act = blackhawk addAction [("<t color=""#1F67CC"">" + ("Teleport") + "</t>"),"gen_action.sqf",[{	
	titleText ["Click on map to teleport", "PLAIN DOWN"];
	if (!visibleMap) then {openMap true};
	gnrf_heliPortKlicked = false;
	onMapSingleClick "onMapSingleClick''; blackhawk setPos [_pos select 0, _pos select 1, 150]; gnrf_heliPortKlicked = true";
	waitUntil {gnrf_heliPortKlicked};
	_pos = getPos blackhawk;
	_dir = getDir blackhawk;
	_className = typeOf blackHawk;
	blackhawk removeAction gnrf_heli_teleport_act;
	deleteVehicle blackhawk;
	blackhawk = nil;
	blackhawk = createVehicle [_className, _pos, [], 0, "FLY"];
	blackhawk setDir _dir;
	player moveInDriver blackhawk;
	blackhawk engineOn true;
	player action ["autoHover", blackhawk];
	call gnrf_heli_teleport;
}],0,false,true,"","(driver blackhawk) == player AND debugModeOn"];
};

call gnrf_heli_teleport;



/*
////// Test Opfors

testGrp = Creategroup EAST;
	
_testee1="TK_INS_Soldier_AT_EP1" createUnit [getMarkerPos "respawn_WEST", testGrp, "testMan1=this", 0.7, "Sergeant"];	
_testMan1 addMPEventhandler ["MPKilled", "if (isServer) then {_this select 0 removeAllEventHandlers 'MPkilled'; [_this select 0, _this select 1] spawn killDetector_compiled;}"];
	
_testee2="TK_INS_Soldier_AT_EP1" createUnit [getMarkerPos "respawn_WEST", testGrp, "testMan2=this", 0.7, "Sergeant"];	
testMan2 addMPEventhandler ["MPKilled", "if (isServer) then {_this select 0 removeAllEventHandlers 'MPkilled'; [_this select 0, _this select 1] spawn killDetector_compiled;}"];
	
_testee3="TK_INS_Bonesetter_EP1" createUnit [getMarkerPos "respawn_WEST", testGrp, "testMan3=this", 0.7, "Sergeant"];	
_testMan3 addMPEventhandler ["MPKilled", "if (isServer) then {_this select 0 removeAllEventHandlers 'MPkilled'; [_this select 0, _this select 1] spawn killDetector_compiled;}"];
	
testVictor="LandRover_MG_TK_INS_EP1" createVehicle getMarkerPos "respawn_WEST";
testVictor setDir 135;
testVictor addMPEventhandler ["MPKilled", "if (isServer) then {_this select 0 removeAllEventHandlers 'MPkilled'; [_this select 0, _this select 1] spawn killDetector_compiled;}"];
testMan1 moveInGunner testVictor;

*/





















