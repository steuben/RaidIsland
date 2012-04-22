
if (isDedicated) exitWith {};

_UPIsetTarget_KeyEH = (findDisplay 46) displayAddEventHandler ["keyDown", "if ((isNil 'gnrf_UPIactive') AND (count groupSelectedUnits player > 0)) then {_this call gnrf_UPIsetTarget_fnc}"];
_UPIend_KeyEH = (findDisplay 46) displayAddEventHandler ["keyUp", "_this call gnrf_UPImove_fnc"];

gnrf_UPIpointer = "Sign_arrow_down_large_EP1" createVehicleLocal [0,0,10000];	

// arange move order; called by keyDown
gnrf_UPIsetTarget_fnc =
{
	private["_handled", "_dikCode", "_shift", "_ctrlKey", "_alt", "_pos"];
		
	_dikCode = _this select 1;
	_shift = _this select 2;
	_ctrlKey = _this select 3;
	_alt = _this select 4;  
	_handled = false;

	if (!_shift && !_ctrlKey && !_alt && _dikCode == 86) then  
	{	
		_pos = screenToWorld [0.5,0.5];
		gnrf_UPIpointer setPos _pos;
		_handled = true;
	};

	if (!_shift && _ctrlKey && !_alt && _dikCode == 86) then  
	{	
		_dir = getDir gnrf_UPIpointer;
		gnrf_UPIpointer setDir (_dir + 2);
		_handled = true;
	};

	if (_shift && !_ctrlKey && !_alt && _dikCode == 86) then  
	{	
		_dir = getDir gnrf_UPIpointer;
		gnrf_UPIpointer setDir (_dir - 2);
		_handled = true;
	};	
	_handled;
};

// handle positioning; called by keyUp
gnrf_UPImove_fnc = 
{
	_dikCode = _this select 1;
	_shift = _this select 2;
	_ctrlKey = _this select 3;
	_alt = _this select 4;  
	_handled = false;
	
	_target = getPos gnrf_UPIpointer;
	
	if (!_alt && _dikCode == 86 && count (_target - [0,0,0]) != 0) then 
	{
		_target set [2, 0];		
		
		gnrf_UPIunits = groupSelectedUnits player;	
		_leader = gnrf_UPIunits select 0;
		_leader doMove _target;
		
		for "_i" from 1 to  (count gnrf_UPIunits) - 1 do 
		{
			_unit = gnrf_UPIunits select _i;
			_unit doFollow _leader;
		};

//		{_x doMove _target} forEach gnrf_UPIunits;
	};

	if (_dikCode == 86) then  
	{		
		gnrf_UPIpointer setPos [0,0,10000];
		gnrf_UPIactive = nil;
		_handled = true;
	};
	
	_handled;
};

//setVector function; 
//usage: [object,dir,angle,pitch] call gnrf_setVector_fnc;
//example: [_myObject,0,90,0] call gnrf_setVector_fnc;
gnrf_setVector_fnc =
{

	_object = _this select 0;
	_dir = 0;
	_angle = 90;
	_pitch = 0;
	
	_vecdx = sin(_dir) * cos(_angle);
	_vecdy = cos(_dir) * cos(_angle);
	_vecdz = sin(_angle);

	_vecux = cos(_dir) * cos(_angle) * sin(_pitch);
	_vecuy = sin(_dir) * cos(_angle) * sin(_pitch);
	_vecuz = cos(_angle) * cos(_pitch);

	_object setVectorDirAndUp [ [_vecdx,_vecdy,_vecdz], [_vecux,_vecuy,_vecuz] ];
};

/////////DEBUG
gnrf_UPIdebug_fnc =
{
	_unit = (gnrf_UPIunits select 0);
	waitUntil {_bool = unitReady _unit; sleep 0.5; _bool};	
	_pos = getPos _unit;
	player sideChat format ["unit:%1", _pos];
	_dis = _pos distance (_this select 0);
	player sideChat format ["distance:%1", _dis];
	
};












