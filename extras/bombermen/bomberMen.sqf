private ["_bomber", "_bombVeh", "_explosive", "_range", "_target", "_targets", "_targetPos", "_onTarget", "_roamSectors", "_spawnSector", "_wpSet", "_randomWaypointNumber"];
//preLoad functions
if (isNil "gnrf_bombermanBoom_fnc") then {[] execVM "extras\bombermen\functions.sqf"};

//setVariables
_sector = _this select 0;
_callsign = ["Alpha","Bravo","Charlie","Delta"] call BIS_fnc_selectRandom;
_randomSpawn = str(round(random 2));
_veh = ["man", "bike", "car", "car"] call BIS_fnc_selectRandom;
_bombVeh = objNull;

//bombermen with vehicles have a chance to spawn in / drive to adjacent sectors, but preference will be on home sector
if (_veh != "man") then {

	switch (_sector) do {
	
		case "omaha"    : {_roamSectors = ["omaha", "falafel"]};
		
		case "falafel"  : {_roamSectors = ["falafel", "falafel", "falafel", "falafel", "falafel", "omaha", "mushroom", "golem", "panties", "bacon"]};
		
		case "mushroom" : {_roamSectors = ["mushroom", "mushroom", "bacon", "falafel"]};
		
		case "golem"    : {_roamSectors = ["golem", "golem", "golem", "omaha", "falafel", "panties"]};
		
		case "panties"  : {_roamSectors = ["panties", "panties", "falafel", "golem"]};
		
		case "bacon"    : {_roamSectors = ["bacon", "bacon", "falafel", "mushroom"]};
	};
	
	_spawnSector = _roamSectors call BIS_fnc_selectRandom;

	} else {

	_spawnSector = _sector;
	_roamSectors = _sector;
};

//determine semi-random spawnpoint
_spawnMarker = _spawnSector + _callsign + "Spawn" + _randomSpawn;
_pos = getMarkerPos _spawnMarker;

//create group
_bombGrp = Creategroup civilian;
_bombGrp setGroupId ["Suicide Bomber"];

//define random classnames
_bomberClass = ["TK_CIV_Takistani01_EP1", "TK_CIV_Takistani02_EP1", "TK_CIV_Takistani03_EP1", "TK_CIV_Takistani04_EP1", "TK_CIV_Takistani05_EP1", "TK_CIV_Takistani06_EP1"] call BIS_fnc_selectRandom;
_carClass = ["S1203_TK_CIV_EP1", "Volha_1_TK_CIV_EP1", "Volha_2_TK_CIV_EP1", "Lada1", "Lada2_TK_CIV_EP1", "SkodaRed", "SkodaGreen", "car_sedan", "car_hatchback"] call BIS_fnc_selectRandom;
_bikeClass = ["Old_moto_TK_Civ_EP1", "TT650_TK_CIV_EP1"] call BIS_fnc_selectRandom;

//create bomber and vehicle
if (_veh == "man") then {
		
	_bomber = _bombGrp createUnit [_bomberClass, _pos, [], 10, "FORM"];
	_explosive = "ace_fuelexpsmall";
	_range = 4;
	_wpSet = "Default";
	_randomWaypointNumber = 15;
};


if (_veh == "bike") then {
			
	_bombVeh = _bikeClass createVehicle _pos;
	_bomber = _bombGrp createUnit [_bomberClass, _pos, [], 10, "FORM"];
	_bomber moveInDriver _bombVeh;	
	_explosive = "ace_fuelexpbig";
	_bombVeh lock true;
	_range = 7;
	_wpSet = "Vehicle";
	_randomWaypointNumber = 12;
	_bomber setVariable ["vehicle", _bombVeh];
};

if (_veh == "car") then {
	
	_bombVeh = _carClass createVehicle _pos;
	_bomber = _bombGrp createUnit [_bomberClass, _pos, [], 10, "FORM"];
	_bomber moveInDriver _bombVeh;
	_bombVeh lock true;
	_explosive = "HelicopterExploBig";
	_range = 9;
	_wpSet = "Vehicle";
	_randomWaypointNumber = 12;
	_bomber setVariable ["vehicle", _bombVeh];
};

//store data in bomberman
_bomber setVariable ["explosive", _explosive];
_bomber setVariable ["wpSet", _wpSet];

//gnrf_testBomberman = _bomber; /// debug

[_bomber, _roamSectors] spawn gnrf_randomWPgen_fnc;

//main loop
_timer = 1;
_targets = [];
_hasTarget = false;
while {alive _bomber} do {

	//5 sec loop	
	if (_timer == 10) then {
		
		//OMG get in the car!!!
		if ((!isNull _bombVeh) AND (canMove _bombVeh)) then {_bomber moveInDriver _bombVeh};
		
		//search for targets
		_array = nearestObjects [getPos _bomber, ["USMC_Soldier_Base", "FR_Base"], 100];
		_targets =+ _array;
		//sort out dead targets
		{if (!alive _x) then {_targets = _targets - [_x]}} forEach _array;	
		_target = _targets select 0;
		
		//engage target	
		if (count _targets > 0) then {
			
			//mid distance behaviour
			if ((_bomber distance _target) > 30) then {
			
				_targetPos = getPos _target;
				[group _bomber, currentWaypoint group _bomber] setWaypointPosition [_targetPos, 0];
				_bomber doMove (_targetPos);
//				_bomber setSpeedMode "FULL"; ////////////////////////////
			
			//on short distance bomber aims for a position behind his target (to ensure contact)
			} else {
			
				_targetPos = [_bomber, _target] call gnrf_bombermanGetCloser_fnc;
				[group _bomber, currentWaypoint group _bomber] setWaypointPosition [_targetPos, 0];
				_bomber doMove (_targetPos);
				_bomber setSpeedMode "FULL";
			};			
			
			//on first contact bomber breaks out of random wp cycle
			if (!_hasTarget) then {
			
				_hasTarget = true;
				[group _bomber, currentWaypoint group _bomber] setWaypointCompletionRadius 0;	
				[group _bomber, currentWaypoint group _bomber] setWaypointStatements ["true", ""];
				[group _bomber, currentWaypoint group _bomber] setWaypointTimeout [0, 0, 0];				
			};
			
		} else {
			
			//return to normal behaviour if target is lost
			if (_hasTarget) then {

				_hasTarget = false;	
				[group _bomber, currentWaypoint group _bomber] setWaypointStatements ["true", "[this, 0] spawn gnrf_randomWPgen_fnc;"];
				[group _bomber, currentWaypoint group _bomber] setWaypointPosition [getPos _bomber, 0];
			};
		};
	}; 
	
//twice per second part

	//the Tick
	_timer = _timer +1;
	if (_timer > 10) then {_timer = 1};
	sleep 0.493;	
	
	//detonate if severely injured
	if (damage _bomber > 0.5) then {_onTarget = false; _bomber setDamage 1};
	
	//detonate if close to target
	if (_hasTarget) then {
	
		{if ((_bomber distance _x) < _range) exitWith {_onTarget = true; _bomber setDamage 1}} forEach _targets;
	};
		
};

[_bomber, _onTarget] spawn gnrf_bombermanBoom_fnc;
	
