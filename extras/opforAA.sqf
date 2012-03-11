
// call or spawn with [_shooter, _target, "missile classname"]

private ["_firer","_velocityX", "_velocityY", "_velocityZ", "_target","_missileSpeed","_maxVeloc","_primaryTarget","_missileStart","_missileType"];

_firer  			= _this select 0;
_primaryTarget 	= _this select 1;
_missileStart 		= [(getPos _firer select 0) - 1, (getPos _firer select 1) + 2, (getPos _firer select 2) + 1];
_missileType 		= _this select 2;
_missileSpeed 	= 200; //missile startSpeed
_maxVeloc 		= 300; //missile maxSpeed

if (_missileSpeed > _maxVeloc) then { _missileSpeed = _maxVeloc; };

_perSecondChecks = 25; //direction checks per second
_getPrimaryTarget = {if (typeName _primaryTarget == typename {}) then {call _primaryTarget} else {_primaryTarget}};
_target = call _getPrimaryTarget;

_missile = _missileType createVehicle _missileStart;
_missile setPos _missileStart;
_missile setDir (getDir _firer);

//procedure for guiding the missile
_homeMissile = 
{
	if (_missileSpeed < _maxVeloc) then { _missileSpeed = _missileSpeed + 10; };
	_travelTime = (_target distance _missile) / _missileSpeed;
	_steps = floor (_travelTime * _perSecondChecks);

	_relDirHor = [_missile, _target] call BIS_fnc_DirTo;
	_missile setDir _relDirHor;

	_relDirVer = asin ((((getPosASL _missile) select 2) - ((getPosASL _target) select 2)) / (_target distance _missile));
	_relDirVer = (_relDirVer * -1);
	[_missile, _relDirVer, 0] call BIS_fnc_setPitchBank;

	_velocityX = (((getPosASL _target) select 0) - ((getPosASL _missile) select 0)) / _travelTime;
	_velocityY = (((getPosASL _target) select 1) - ((getPosASL _missile) select 1)) / _travelTime;
	_velocityZ = (((getPosASL _target) select 2) - ((getPosASL _missile) select 2)) / _travelTime;

	[_velocityX, _velocityY, _velocityZ]
};

call _homeMissile;

//fuel burning should illuminate the landscape
_fireLight = "#lightpoint" createVehicle position _missile;
_fireLight setLightBrightness 0.5;
_fireLight setLightAmbient [1.0, 1.0, 1.0];
_fireLight setLightColor [1.0, 1.0, 1.0];
_fireLight lightAttachObject [_missile, [0, -0.5, 0]];

//missile flying
while {alive _missile} do 
{
	_velocityForCheck = call _homeMissile;
	if ({(typeName _x) == (typeName 0)} count _velocityForCheck == 3) then {_missile setVelocity _velocityForCheck};
	sleep (1 / _perSecondChecks)
};
deleteVehicle _fireLight;