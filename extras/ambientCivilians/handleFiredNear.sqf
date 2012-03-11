

if (!isNil "gnrf_scaringCivs") exitWith {}; 
private ["_roles", "_nearCivs"];
sleep 0.5;
gnrf_scaringCivs = true;

waitUntil {!isNil "gnrf_nearCivs"};

_nearCivs = [];

{
	_roles = _x getVariable "roles";
	if ((_x in gnrf_MovingCivs) AND ("onFoot" in _roles) AND !("zpd" in _roles) AND !("housed" in _roles)) then {_nearCivs set [count _nearCivs, _x]};
} forEach gnrf_nearCivs;

[0, {{[_x] spawn gnrf_fleeIntoBuilding_fnc} forEach _this}, _nearCivs] call CBA_fnc_globalExecute;

sleep 5;
gnrf_nearCivs = nil;
gnrf_scaringCivs = nil;
