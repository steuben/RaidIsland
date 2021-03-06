
private ["_minDis", "_nearestPos", "_spawnPos"];

//determine spawnPos closest to the player
waitUntil {alive player};
_minDis = 10000;
_nearestPos = [];

{
	_pos = _x select 0;
	
	if (typeName _pos == "OBJECT") then 
	{
		_pos = getPos _pos;
	};
		
	_dis = (getPos player) distance _pos;
	if (_dis < _minDis) then {_nearestPos = _pos; _minDis = _dis};	

} forEach gnrf_respawnInfo;

_spawnPos = [_nearestPos select 0, _nearestPos select 1, 0];


//CREATE TEAM STEUBEN (alpha)
if (player == steuben) then 
{

if (!alive steuben1) then {
	"rb_marksman" createUnit [getMarkerPos "elvisSpawn", alpha, "steuben1=this", 1, ""];
	steuben1 MoveInCargo [elvis, 1];
};

if (!alive steuben2) then {
	"rb_ar" createUnit [getMarkerPos "elvisSpawn", alpha, "steuben2=this", 1, ""];
	steuben2 MoveInCargo [elvis, 2];
};

if (!alive steuben3) then {
	"rb_ranger1" createUnit [getMarkerPos "elvisSpawn", alpha, "steuben3=this", 1, ""];
	steuben3 MoveInCargo [elvis, 3];
};

if (!alive steuben4) then {
	"rb_engineer" createUnit [getMarkerPos "elvisSpawn", alpha, "steuben4=this", 1, ""];
	steuben4 MoveInCargo [elvis, 4];
};



{_x assignTeam "RED"} foreach [steuben1,steuben2,steuben3,steuben4];


};

////////////////////////////////////////////////////////////////////////

//CREATE TEAM BBQ (bravo)

if (player == bbq) then {

if (!alive bbq1) then {
	"rb_medic" createUnit [getMarkerPos "elvisSpawn", bravo, "bbq1=this", 1, ""];
	bbq1 MoveInCargo [elvis, 5];
};

if (!alive bbq2) then {
	"rb_ar" createUnit [getMarkerPos "elvisSpawn", bravo, "bbq2=this", 1, ""];
	bbq2 MoveInCargo [elvis, 6];
};

if (!alive bbq3) then {
	"rb_ranger1" createUnit [getMarkerPos "elvisSpawn", bravo, "bbq3=this", 1, ""];
	bbq3 MoveInCargo [elvis, 7];
};

if (!alive bbq4) then {
	"rb_at" createUnit [getMarkerPos "elvisSpawn", bravo, "bbq4=this", 1, ""];
	bbq4 MoveInCargo [elvis, 8];
};


{_x assignTeam "RED"} foreach [bbq1,bbq2,bbq3,bbq4];



};

// FAHRZEUGE AUFLADEN
/*
leadVictor setFuel 1;
leadVictor setVehicleAmmo 1;

utilityVictor setFuel 1;

hummvee1 setFuel 1;
hummvee1 setVehicleAmmo 1;

hummvee2 setFuel 1;
hummvee2 setVehicleAmmo 1;

medevacVictor setFuel 1;
*/


// rearm team
for "_i" from 2 to 9 do {

	_unit = str(player) + str(_i);
	
	call compile format ["
		_unit = %1;
		waitUntil {alive _unit};
		removeAllWeapons _unit;
		{_unit addMagazine _x;} forEach %1%2Magazines;
		{_unit addWeapon _x;} forEach %1%2Weapons;
		reload _unit;
		_unit setDamage 0;
	
	", _unit]
};

// rearm player
removeAllWeapons player;
_magazines = player getVariable "magazines";
_weapons = player getVariable "weapons";
{player addMagazine _x} forEach _magazines;
{player addWeapon _x} forEach _weapons;
reload player;
steuben setDamage 0;
bbq setDamage 0;
{_x setDamage 0} forEach units group steuben;
{_x setDamage 0} forEach units group bbq;


//remove all KilledEH�s
{_x removeAllEventHandlers "MPkilled"} forEach units group player;

//add KilledEH
{_x addMPEventhandler ["MPKilled", "if (isServer) then {[_this select 0, _this select 1] spawn killDetector_compiled}"]} forEach units group player;
