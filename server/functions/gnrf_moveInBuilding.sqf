

	private ["_unit", "_pos", "_posArray", "_someH", "_building", "_i", "_done", "_rnd"]; 
	_unit = _this select 0; 
	if (count _this == 2) then {_building = _this select 1} else {_building = nearestBuilding _unit};	
	
	_done = false;
	_i = 0;
	_posArray = [];
	
	while {!_done} do {
		
		_tmpPos = _building buildingPos _i;
		if (count (_tmpPos - [0,0,0]) != 0) then {
		
			_posArray set [count _posArray, _tmpPos];
			_i = _i + 1;
		
		} else {
		
			_done = true;
		};
	};
	
	if (count _posArray <= 1) exitWith {};
	
	_pos = _posArray call BIS_fnc_selectRandom;
	_unit setPos _pos;

	while {(alive _unit) AND (behaviour _unit == "SAFE")} do {
	
		_pos = _posArray call BIS_fnc_selectRandom;
		_unit doMove _pos; 
		waitUntil {sleep 0.11; (_unit distance _pos) < 1.5}; 
		doStop _unit;
		_rnd = 5 + (random 40);
		sleep _rnd;
	};
