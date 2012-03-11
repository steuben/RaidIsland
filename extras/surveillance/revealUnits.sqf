
if (!isDedicated) then {

	while {true} do {
	
		_allUnits = + allUnits;
		_vehicles = + vehicles;
		_array = _allUnits + _vehicles;
		opforUnits = [];
		{if (side _x == east) then {opforUnits set [count opforUnits, _x];};} forEach _array;


		if (player == steuben) then {
			steubenKnows = [];
			{if (player knowsAbout _x >= 0.1) then {steubenKnows set [count steubenKnows, [_x, player knowsAbout _x]];};} forEach opforUnits;
			publicVariable "steubenKnows";
			waitUntil {!isNil "bbqKnows"};
			{if (player knowsabout (_x select 0) < _x select 1) then {player reveal (_x select 0);};} forEach bbqKnows;
			bbqKnows = nil;
			opforUnits = nil;
		};

		if (player == bbq) then {
			bbqKnows = [];
			{if (player knowsAbout _x >= 0.1) then {bbqKnows set [count bbqKnows, [_x, player knowsAbout _x]];};} forEach opforUnits;
			publicVariable "bbqKnows";
			waitUntil {!isNil "steubenKnows"};
			{if (player knowsabout (_x select 0) < _x select 1) then {player reveal (_x select 0);};} forEach steubenKnows;
			steubenKnows = nil;
			opforUnits = nil;
		};	
	sleep 5;
	};
};









