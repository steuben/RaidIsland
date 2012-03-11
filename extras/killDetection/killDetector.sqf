

if (!isServer) exitWith {};
waitUntil {isNil "gnrf_killDetectorBusy"};
gnrf_killDetectorBusy = true;

private ["_victim", "_killer", "_gunners", "_killerType", "_victimType", "_victimDisplay", "_verb", "_article", "_victimName", "_killerName", "_string"];
_victim = _this select 0;
_killer = _this select 1; 


/////factions
_east = ["RU", "INS", "BIS_TK", "BIS_TK_INS", "BIS_TK_GUE", "BIS_UN", "PMC_BAF", "ACE_RU_Desert", "ACE_MVD", "ACE_GRU", "ACE_VDV", "GUE"];
_west = ["USMC", "CDF", "BIS_US", "BIS_CZ", "BIS_GER", "BIS_BAF", "BIS_UN", "PMC_BAF", "BIS_BAF", "ACE_USAF", "ACE_USNAVY", "ACE_USMC_Desert", "ACE_USARMY", "ACE_USARMY_DESERT", "ACE_160SOAR"];
_civ = ["CIV", "CIV_RU", "BIS_TK_CIV", "BIS_CIV_special"];



//if killer returns a vehicle, killer is "guessed" if blufor but remains a vehicle if opfor
if (((_killer isKindOf "LandVehicle") OR (_killer isKindOf "Air") OR (_killer isKindOf "Ship")) AND (!(faction _killer in _east))) then {	

		_gunners = [];	
		{if (count (assignedVehicleRole _x) > 1) then {_gunners = _gunners + [_x]}} forEach (crew _killer); 		
		if ((count _gunners) > 0) then {_killer = _gunners select 0} else {_killer = crew _killer select 0};
	
}; 

//////determine killerType	

	switch true do {
	
		//killer is blufor
		case (((isPlayer _killer) OR (isPlayer (leader group _killer))) AND (_killer != _victim)) : {_killerType = "blufor"};
		
		//killer is opfor
		case ((faction _killer in _east) AND (_killer != _victim)) :     {_killerType = "opfor"};
		
		//killer is a civ (driver)
		case ((faction _killer in _civ) AND (_killer != _victim)) : 	 {_killerType = "civ"};
		
		//killed by bomb (assumed)
		case (isNull _killer) : 										 {_killerType = "bomb"};
		
		//killed by collision
		case (_killer == _victim) : 									 {_killerType = "collision"};
		
		case (((_killer isKindOf "LandVehicle") OR (_killer isKindOf "Air") OR (_killer isKindOf "Ship")) AND (count crew _killer < 1)): {_killerType = "none"};
				
		default 														 {_killerType = "none"};	
	};




//////determine victimType

switch true do {

	case ((isPlayer _victim) OR (isPlayer (leader group _victim))) :   {_victimType = "blufor"};
		
	case (faction _victim in _east) : 								   {_victimType = "opfor"};
	
	case (faction _victim in _civ) : 								   {_victimType = "civ"};
	
	default															   {_victimType = "none"};
};



//////generate kill message

//	 define syntax
if (_victim isKindOf "Man") then {_verb = "killed"} else {_verb = "destroyed"};
_killerName = _killer call grnf_SGetDisplayName_fnc;
_victimName = _victim call grnf_SGetDisplayName_fnc; 
if ((toArray _victimName) select 0 in (toArray "AaEeIiOo")) then {_article = "an"} else {_article = "a"};

switch (_victimType) do {

	case "blufor" : 
	{	
		//player or team killed by friendlies
		if (_killerType == "blufor") then {
			
			_string = format ["%1 was %2 by %3 - Friendly Fire!", _victimName, _verb, _killerName];
			[-1, {major sideChat _this}, _string] call CBA_fnc_globalExecute;
		};
		
		//player or team killed by opfor
		if (_killerType == "opfor") then {
			
			_string = format ["%1 was %2 by %3 %4", _victimName, _verb, _article, _killerName];
			[-1, {major sideChat _this}, _string] call CBA_fnc_globalExecute;
		};
		
		//player or team killed by bomb
		if (_killerType == "bomb") then {
			
			_string = format ["%1 was obliterated", _victimName];
			[-1, {major sideChat _this}, _string] call CBA_fnc_globalExecute;
		};
		
		//player or team killed by collision
		if (((_killerType == "collision") OR (_killerType == "civ")) AND (_victim isKindOf "Man")) then {
			
			_string = format ["%1 was crushed", _victimName];
			[-1, {major sideChat _this}, _string] call CBA_fnc_globalExecute;
		};
	};

	case "opfor" : 
	{
		//opfor killed by player or team
		if (_killerType == "blufor") then {
		
			_string = format ["%1 %2 %3 %4", _killerName, _verb, _article, _victimName];
			[-1, {major sideChat _this}, _string] call CBA_fnc_globalExecute;
		};
		
		//opfor killed by opfor
		if (_killerType == "opfor") then {
			
			_string = format ["%1 was %2 by an allied %3!", _victimName, _verb, _killerName];
			[-1, {major sideChat _this}, _string] call CBA_fnc_globalExecute;
		};
		
		//opfor killed by bomb
		if (_killerType == "bomb") then {
		
			_string = format ["%1 was obliterated", _victimName];
			[-1, {major sideChat _this}, _string] call CBA_fnc_globalExecute;
		};
		
		//opfor killed by collision
		if (((_killerType == "collision") OR (_killerType == "civ")) AND (_victim isKindOf "Man")) then {
		
			_string = format ["%1 was crushed", _victimName];
			[-1, {major sideChat _this}, _string] call CBA_fnc_globalExecute;
		};
	};

	case "civ" : 
	{

		//civ killed by player or team
		if (_killerType == "blufor") then 
		{
			_string = format ["%1 %2 %3 %4 - Collateral Damage!", _killerName, _verb, _article, _victimName];		
			[-1, {major sideChat _this}, _string] call CBA_fnc_globalExecute;
		};
    
		//civ killed by opfor
		if (_killerType == "opfor") then 
		{	
			_string = format ["An innocent %1 was killed by an enemy %2", _victimName, _killerName];		
			[-1, {major sideChat _this}, _string] call CBA_fnc_globalExecute;
		};
		
		//civ killed by bomb
		if (_killerType == "bomb") then 
		{		
			_string = format ["%1 was obliterated", _victimName];		
			[-1, {major sideChat _this}, _string] call CBA_fnc_globalExecute;
		};		
		
	};
};

//////save stats
//	  victims are stored in "stats" array as [[opforInf], [opforVehicles], [blufor], [civs]]

private ["_player", "_team", "_stats"];

if (_killerType == "blufor") then {

	if (!isPlayer _killer) then {
	
		_player = leader group _killer;
		_team = true;
		_stats = _player getVariable ["teamStats", [[], [], [], []] ];
		
	} else {
	
		_player = _killer;
		_team = false;
		_stats = _player getVariable ["stats", [[], [], [], []] ];
	};
	
	switch (_victimType) do {
		
		case "opfor"  : {
							if (_victim isKindOf "Man") then {
						
								_stats select 0 set [count (_stats select 0), _victimName];
							
							} else {
						
								_stats select 1 set [count (_stats select 1), _victimName];
							};
						};
		
		case "blufor" : {_stats select 2 set [count (_stats select 2), _victimName]};
		
		case "civ"    : {_stats select 3 set [count (_stats select 3), _victimName]};
	};
	

	if (_team) then {
	
		_player setVariable ["teamStats", _stats, true];
	
	} else {
	
		_player setVariable ["stats", _stats, true];
	};
};
	
gnrf_killDetectorBusy = nil;	
	
	




//debug
//if ((_killerType == "none") AND (_victimType == "none")) then {[-1, {major sideChat format ["Undefined killmessage type. Killer: %1  Victim: %2", _this select 0, _this select 1]}, [_killerType, _victimType]] call CBA_fnc_globalExecute};
//if ((_killerType == "none") AND (_victimType != "none")) then {[-1, {major sideChat format ["Undefined killmessage type. Killer: %1  Victim: %2", _this select 0, _this select 1]}, [_killerType, _victimType]] call CBA_fnc_globalExecute};
//if ((_killerType != "none") AND (_victimType == "none")) then {[-1, {major sideChat "Empty vehicle?"}] call CBA_fnc_globalExecute};

