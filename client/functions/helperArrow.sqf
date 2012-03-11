if (isDedicated) exitWith {};
private ["_target", "_inVehicle"];

_target = _this;

_helperArrow = 	"Sign_arrow_down_EP1" createVehicleLocal [0,0,0];
_helperArrow attachTo [_target, [0,0,4]];
_inVehicle = false;

while {alive _target} do 
{
	if ((vehicle _target != _target) AND (!_inVehicle)) then 
	{
		_helperArrow attachTo [vehicle _target, [0,0,5]];
		_inVehicle = true;
	};

	if ((vehicle _target == _target) AND (_inVehicle)) then 
	{
		_helperArrow attachTo [_target, [0,0,4]];
		_inVehicle = false;
	};
	
	sleep 0.873;
};

deleteVehicle _helperArrow;