

// explode fnc
gnrf_bombermanBoom_fnc = {

	_bomber = _this select 0;
	_onTarget = _this select 1;
	_explosive = _bomber getVariable "explosive";
	_boom = _explosive createVehicle (getPos _bomber);
	_bomber setDamage 1;
	
	if (_onTarget) then {
		
		[-1, {player sideChat "Damned Jihadis are packin' IED´s. Heads up everyone!"}] call CBA_fnc_globalExecute;
		
	} else {
	
		[-1, {player sideChat "Insurgency attack avoided."}] call CBA_fnc_globalExecute;		
	};
};


// get close to target
gnrf_bombermanGetCloser_fnc = {
	
	_bomber = _this select 0;
	_target = _this select 1;
	_dis = 20;
	_dir = [_bomber, _target] call BIS_fnc_dirTo;
	if (_dir < 0) then {_dir = 360 + _dir};
	_pos = getPos _target;
	_targetPos = [(_pos select 0)+(sin _dir)*_dis, (_pos select 1)+(cos _dir)*_dis, _pos select 2];	
	_emptyPos = _targetPos findEmptyPosition [0.3, 3];
	if (count _emptyPos > 0) then {_targetPos = _emptyPos};
	_bomber setVariable ["targetPos", _targetPos];
	_targetPos
};