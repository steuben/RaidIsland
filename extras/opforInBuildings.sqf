
		if (!isNil "grnf_villaIsTriggered") exitWith {};		
		grnf_villaIsTriggered = true;
		["gnrf_clientExecute", ["titleText", ["Enemy presence detected", "PLAIN"]]] call CBA_fnc_globalEvent;

		
		_spawnPos = _this select 0;
		_spawnPos = [_spawnPos select 0, _spawnPos select 1, 0];
		_spawnPos = _spawnPos findEmptyPosition [3,30, "Man"];		
		_building = _spawnPos nearestObject "Building";
		
		//groups
		_opforSet1 = createGroup EAST;
		_opforSet2 = createGroup EAST;
		_opforSet3 = createGroup EAST;
		
		////defending group
		// Leader
		_createUnit="ACE_RU_Soldier_Officer_D" createUnit [_spawnPos, _opforSet1, "", 9, "Sergeant"];

		// Marksman
		_createUnit="ACE_RU_Soldier_Marksman_D" createUnit [_spawnPos, _opforSet1, "", 9, "Corporal"];

		// Automatic Rifleman 
		_createUnit="ACE_RU_Soldier_AR_D" createUnit [_spawnPos, _opforSet1, "", 9, "Corporal"];
					
		// Rifleman 
		_createUnit="ACE_RU_Soldier_D" createUnit [_spawnPos, _opforSet1, "", 9, "Corporal"];
					
		// Rifleman 
		_createUnit="ACE_RU_Soldier_D" createUnit [_spawnPos, _opforSet1, "", 9, "Corporal"];
		
		// Rifleman 
		_createUnit="ACE_RU_Soldier_D" createUnit [_spawnPos, _opforSet1, "", 9, "Corporal"];

		// Grenadier
		_createUnit="ACE_RU_Soldier_GL_D" createUnit [_spawnPos, _opforSet1, "", 9, "Corporal"];


		////attacking group
		// Team Leader  
		_createUnit="ACE_RU_Soldier_TL_D" createUnit [_spawnPos, _opforSet2, "", 9, "Corporal"];
		
		// AT Heavy 
		_createUnit="ACE_RU_Soldier_HAT_D" createUnit [_spawnPos, _opforSet2, "", 9, "Corporal"];
		
		// Machinegunner
		_createUnit="ACE_RU_Soldier_MG_D" createUnit [_spawnPos, _opforSet2, "", 9, "Corporal"];
		
		// AT
		_createUnit="ACE_RU_Soldier_RPOM_D" createUnit [_spawnPos, _opforSet2, "", 9, "Corporal"];
		
		// AT  
		_createUnit="ACE_RU_Soldier_AT_D" createUnit [_spawnPos, _opforSet2, "", 9, "Corporal"];
					
		// Rifleman 
		_createUnit="ACE_RU_Soldier_D" createUnit [_spawnPos, _opforSet2, "", 9, "Corporal"];

		// Grenadier
		_createUnit="ACE_RU_Soldier_GL_D" createUnit [_spawnPos, _opforSet2, "", 9, "Corporal"];
		
		// Grenadier
		_createUnit="ACE_RU_Soldier_GL_D" createUnit [_spawnPos, _opforSet2, "", 9, "Corporal"];
		
		////statics
		//mg1
		_createUnit = "ACE_RU_Soldier_D" createUnit [_spawnPos, _opforSet3, "grnf_currentUnit = this;", 9, "Corporal"];
		_staticMG1 = "DSHKM_TK_GUE_EP1" createVehicle [0,0,0];
		_staticMG1 setPosASL [4845.69,4589.48,41.9963];
		_staticMG1 setDir 225;
		grnf_currentUnit moveInGunner _staticMG1;				
		grnf_currentUnit doWatch [4808.41,4527.07,5];
		_mag = (getArray (configFile >> "CfgVehicles" >> typeOf _staticMG1 >> "Turrets" >> "MainTurret" >> "magazines")) select 0;	
		_staticMG1 setVehicleAmmo 0;
		{_staticMG1 addMagazine _mag} forEach [1,2,3,4];
		
		//mg2
		_createUnit = "ACE_RU_Soldier_D" createUnit [_spawnPos, _opforSet3, "grnf_currentUnit = this;", 9, "Corporal"];
		_staticMG2 = "DSHKM_TK_GUE_EP1" createVehicle [0,0,0];
		_staticMG2 setPosASL [4844.62,4609.73,45.4529];
		_staticMG2 setDir 45;
		grnf_currentUnit moveInGunner _staticMG2;		
		grnf_currentUnit doWatch [4875.43,4684.39,0];
		_mag = (getArray (configFile >> "CfgVehicles" >> typeOf _staticMG2 >> "Turrets" >> "MainTurret" >> "magazines")) select 0;	
		_staticMG2 setVehicleAmmo 0;
		{_staticMG2 addMagazine _mag} forEach [1,2,3,4];		
		
		//set AI behaviour
//		_opforSet1 enableAttack false;
//		_opforSet2 setCombatMode "RED";
		
		//sort units
		_allUnits = (units _opforSet1) + (units _opforSet2) + (units _opforSet3);
		_mostUnits = (units _opforSet1) + (units _opforSet2);
		
		//add Killed EH´s
		{_x setBehaviour "SAFE"; _x addMPEventhandler ["MPKilled", "if (isServer) then {_this select 0 removeAllEventHandlers 'MPkilled'; [_this select 0, _this select 1] spawn killDetector_compiled;}"]} forEach _allUnits;
		
		//stop units from fleeing
		{_x allowFleeing 0} forEach _allUnits; 
		
		//movment script
		{[_x, _building] spawn gnrf_moveInBuilding_fnc} forEach _mostUnits;
		
		
		//check if building is cleared
		waitUntil {sleep 1.23; ({alive _x} count _allUnits) < 1};		
		["gnrf_clientExecute", ["titleText", ["Building Cleared", "PLAIN"]]] call CBA_fnc_globalEvent;			
		
		//reinforce
		["gnrf_clientExecute", [[], "execVM", "loadout\reinforcement.sqf"]] call CBA_fnc_globalEvent;	

		// reset /repair
		_building setDamage 0;
		grnf_villaIsTriggered = nil;
		gnrf_villaRepeat = true;


		//clean up
		_code = 
		{
			sleep 20;
			_staticMG1 = _this select 0;
			_staticMG2 = _this select 1;
			_allUnits  = _this select 2;
			deleteVehicle _staticMG1;
			deleteVehicle _staticMG2;
			[_allUnits] call CBA_fnc_deleteEntity;
		};		
		[_staticMG1, _staticMG2, _allUnits] spawn _code;
		
		
		
		
/*
//Parameters::
//0 Object - patrolling unit 
//1 Object - building to patrol 
//2 Array - buildingPos waypoints; 
//   each waypoint may consist of either just a buildingPos (number), or an array of a buildingPos & direction to face 
//3 Boolean - true to setPos unit to first WP (used to start unit inside building) 
//4 Array/Number (Optional) - break to WP(buildingPos)/dir pair, or just a buildingPos, unit will move here when alerted 
//5 Number (Optional) - probability unit has to crouch after being alerted, otherwise
//////////////////////////////////////////////

// start initializing params 
_unit = _this select 0; 
if(local _unit)then{ 
_building = _this select 1; 
_wps = _this select 2; 
_start = _this select 3; 

// unit will start in the building 
if(_start)then{ 
    _wpp = _wps select 0; 
    if(typeName _wpp == "ARRAY")then{ 
        _unit setPos (_building buildingPos (_wpp select 0)); 
        _unit setDir (_wpp select 1); 
    }else{ 
        _unit setPos (_building buildingPos _wpp); 
    }; 
    _unit setBehaviour "SAFE"; 
}; 

// finish initializing varaibles & params 
_awp = "Null"; 
_crouch = 0.5; 
_cond = "false"; 
if(count _this >= 5)then{_awp = _this select 4}; 
if(count _this >= 6)then{_crouch = _this select 5}; 
if(count _this == 7)then{_cond = _this select 6}; 

// ensure that the condition evaluates to a boolean 
_testCond = { 
    private["_test","_testType"]; 
    _test = call compile _this; 
    _testType = typeName _test; 
    if(format ["%1",_testType] != "BOOL")then{_test = false}; 
    _test 
}; 

_unit setUnitPos "UP"; 
_cwp = 0; 
_pos = _building buildingPos 0; 
_dir = 0; 
while{alive _unit && !(_cond call _testCond)}do
{ 

    if (unitPos _unit == "MIDDLE")then{_unit setUnitPos "UP"}; 

    // move to next WP 
    if (count _wps > 1 || !_start)then{ 
        _wpp = _wps select _cwp; 
        _wp = _wpp; 
        _dir = "null"; 
        if (typeName _wpp == "ARRAY")then{ 
            _wp = _wpp select 0; 
            _dir = _wpp select 1; 
        }; 
        _pos =  (_building buildingPos _wp); 
        _unit doMove _pos; 
        _unit doWatch objNull; 
    }; 

    // wait until unit has arrived at WP 
    waitUntil
	{ 
        ((_unit modelToWorld [0,0,0]) distance _pos <= 1.5) || (behaviour _unit != "SAFE" && format ["%1",_awp] != "Null") || (!alive _unit)||(_cond call _testCond) 
    }; 

    // tell unit to watch specified direction 
    if(format ["%1",_dir] != "null")then{ 
        _watchPos = [(_pos select 0)+(10*sin _dir),(_pos select 1)+(10*cos _dir),_pos select 2]; 
        _unit doWatch _watchPos; 
    }; 

    // break out of patrol if a break-out WP is defined 
    if(alive _unit && behaviour _unit != "SAFE" && format ["%1",_awp] != "Null" && !(_cond call _testCond)) then { 
        _wp = _awp; 
        _dir = "null"; 
        if(typeName _awp == "ARRAY")then{ 
            _wp = _awp select 0; 
            _dir = _awp select 1; 
        }; 
        _pos = (_building buildingPos _wp); 
        _unit doMove _pos; 
        _unit doWatch objNull; 
        waitUntil{((_unit modelToWorld [0,0,0]) distance _pos <= 1.5) || !(alive _unit)||(_cond call _testCond)}; 

        // if unit returns to SAFE, resume the patrol 
        while{alive _unit && behaviour _unit != "SAFE" && !(_cond call _testCond)}do{ 
            if((_crouch > random 1)&&(unitPos _unit != "MIDDLE"))then{_unit setUnitPos "MIDDLE"}; 
            if(format ["%1",_dir] != "null")then{ 
                _watchPos = [(_pos select 0)+(10*sin _dir),(_pos select 1)+(10*cos _dir),_pos select 2]; 
                _unit doWatch _watchPos; 
            }; 
            sleep (15 + random 25); 
            if(behaviour _unit == "SAFE")then{sleep (7 + random 5)}; 
        }; 
    }; 
    if((_crouch > random 1)&&(unitPos _unit != "MIDDLE")&&(behaviour _unit != "SAFE"))
 then {_unit setUnitPos "MIDDLE"; sleep (5 + random 3)}; 
    sleep (4 + random 13); 
    if(_cwp < ((count _wps)-1))then{_cwp = _cwp + 1}else{_cwp = 0}; 
}; // while alive 

// cease patrol 
if(alive _unit)then
{ 
    _unit doFollow (leader group _unit); 
    _unit setUnitPos "AUTO"; 
    _unit doWatch objNull; 
}; 

}; // local unit 

*/
		