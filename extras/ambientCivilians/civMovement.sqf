
private ["_unit", "_targetPos", "_dis", "_driver", "_isDriver", "_vehicle", "_roles", "_maxSpeed", "_isPassenger", "_isCop", "_isOnFoot"];

_unitArray = gnrf_movingCivs;
while {count _unitArray > 0} do {
	
	_unitArray = [];
	{if (alive _x) then {_unitArray set [count _unitArray, _x]}} forEach gnrf_movingCivs;

	for "_i" from 0 to (count _unitArray)-1 do {
	
		_unit = _unitArray select _i;
	
		//check all living civs
		if (alive _unit) then {

			_roles = _unit getVariable "roles";		
			_isDriver = "driver" in _roles;
			_isPassenger = "passenger" in _roles;
			_isCop = "zpd" in _roles;
			_isOnFoot = "onFoot" in _roles;
			_isFemale = "female" in _roles;
			_vehicle = _unit getVariable "vehicle";
			_targetPos = _unit getVariable "targetPos";
		
			switch (true) do {
			
				case (_isPassenger) :
				{
					_driver = _unit getVariable "driver";
					if (alive _driver) then {
					
						if ((vehicle _unit == _unit) AND (canMove _vehicle)) then {_unit moveInCargo _vehicle};
				
					} else {		
				
						_unit moveInDriver _vehicle;
						_roles = _roles - ["passenger"];
						_roles set [count _roles, "driver"];
						_unit setVariable ["roles", _roles, true];
						_isPassenger = false;
						_isDriver = true;
					};
				};
				
				case (_isDriver) : 
				{			
					_vehicle setFuel 1;
					_maxSpeed = 8.5;
					if ((vehicle _unit == _unit) AND (canMove _vehicle)) then {_unit moveInDriver _vehicle};
					if (!(canMove _vehicle)) then {
				
						_roles = _roles - ["driver"];
						_roles set [count _roles, "onFoot"];
						_unit setVariable ["roles", _roles, true];
						_isDriver = false;
					};
				};	

				case (_isOnFoot) :
				{
						_maxSpeed = 1;
				};
				
				case (_isFemale) :
				{
					_maxSpeed = 7;
				};
				
				case (_isCop) : 
				{
					_maxSpeed = 50;
				};
				
			};

			if (!_isPassenger) then {
			
				//move orders
				_dis = _unit distance _targetPos;
	
				if (_dis <50) then {
					//if close to target new target is defined
					_targetPos = gnrf_globalStreets call BIS_fnc_selectRandom;
					
					if (_isDriver) then {						
						//drivers will use more distant targetPositions	
						_disOK = false;
						while {!_disOK} do {
							_dis = _unit distance _targetPos;
							if (_dis > 300) then {_disOK = true} else {_targetPos = gnrf_globalStreets call BIS_fnc_selectRandom};
						};
					};
					_unit setVariable ["targetPos", _targetPos];
				};
				_unit setUnitPos "UP";
				_unit doMove _targetPos; 	
				_unit forceSpeed _maxSpeed;
			};
			
			_timer = 40.8 / (count _unitArray);
			sleep _timer;
		};
	};
};
