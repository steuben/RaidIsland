
private ["_minDis", "_nearestPos", "_offSet", "_playerPos", "_x", "_y", "_z", "_spawnPos", "_magazines", "_weapons", "_carrierSpawn"];
waitUntil {alive player};

_minDis = 10000;
_nearestPos = [];
_offSet = 0;
_carrierSpawn = false;
_playerPos = player getVariable "deathPos";

{
	_pos = _x select 0;
	
	_dis = _playerPos distance _pos;
	if (_dis < _minDis) then {_nearestPos = _pos; _offSet = _x select 1; _minDis = _dis};	

} forEach gnrf_respawnInfo;

if (typeName _nearestPos == "OBJECT") then 
{
	_carrierSpawn = _nearestPos == ussChickenFucker;
	_nearestPos = getPos _nearestPos;		
};

//set player to respawn position
if (!_carrierSpawn) then 
{
	_x = (_nearestPos select 0) + (_offSet - random(_offSet*2)); 
	_y = (_nearestPos select 1) + (_offSet - random(_offSet*2)); 
	_z = 0;
	_spawnPos = [_x, _y, _z];
	if (_offSet != 0) then {_spawnPos = _spawnPos findEmptyPosition [1,20, "Man"]};
	player setpos _spawnPos;
} else 
{
	_spawnpos = call gnrf_playerPos_fnc;
	player setPosASL _spawnpos;
};

//Add custom loadout
removeAllWeapons player;
_magazines = player getVariable "magazines";
_weapons = player getVariable "weapons";
{player addMagazine _x} forEach _magazines;
{player addWeapon _x} forEach _weapons;
reload player;

//re-attach helper arrow
if ((paramsArray select 5) == 1) then 
{
	_dude = player;
	["gnrf_clientExecute", [_dude, "spawn", "grnf_helperArrow_fnc"]] call CBA_fnc_remoteEvent;
};

//re-add debug actions 
if ((debugModeOn) OR (!isNil "gnrf_debugCalledOnce")) then {[] spawn gnrf_addDebugOptions_fnc};