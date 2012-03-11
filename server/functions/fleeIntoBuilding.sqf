
	
	private ["_unit", "_pos", "_posArray", "_someH", "_building", "_cnt", "_done", "_targetPos"]; 
	
	_unit = _this select 0; 	
	if (!(_unit in gnrf_movingCivs)) exitWith {};
	gnrf_movingCivs = gnrf_movingCivs - [_unit];
	
	_targetPos = [_unit, gnrf_allBuildings1st] call CBA_fnc_getNearest;		
	
	doStop _unit;
	_unit domove (_targetPos); 
	_unit forceSpeed 100;		
	waitUntil { sleep 1; (_unit distance _targetPos) < 2};
	_unit setUnitPos "MIDDLE";
	_unit disableAI "MOVE";
	_time = 10 + (random 20);
	sleep _time;
	_unit enableAI "MOVE"; 
	_unit forceSpeed 1;
	_unit setUnitPos "UP";
	gnrf_movingCivs = gnrf_movingCivs + [_unit];
	
	
	
	
	