if (!isServer) exitWith {};
if (_this select 0 == 0) exitWith {gnrf_moveCrusaderReady = true; publicVariable "gnrf_moveCrusaderReady";};

private ["_startPos", "_objects", "_markers", "_objRelPosArray", "_mrkRelPosArray", "_str", "_objAbsPos", "_mrkAbsPos"];

switch (_this select 0) do {

	case 1 : {_startPos = [5270,4200,0]};

	case 2 : {_startPos = [3200,4060,0]};
};

_markers = ["bbqSpawn", "steubenSpawn", "manateeSpawn", "mortarTeamSpawn", "HQ"];
_mrkRelPosArray = [];
{_mrkRelPosArray set [count _mrkRelPosArray, (gnrf_crusaderHQ worldToModel getMarkerPos _x)]} forEach _markers;

_objects = (getPos gnrf_crusaderHQ) nearObjects 150;

{_x attachTo [gnrf_crusaderHQ]} forEach _objects;

gnrf_crusaderHQ setPos _startPos;
_dir = [gnrf_crusaderHQ, [4180,4220,0]] call BIS_fnc_dirTo; 
gnrf_crusaderHQ setDir _dir;

for "_i" from 0 to (count _mrkRelPosArray) do {

	_mrkAbsPos = gnrf_crusaderHQ modelToWorld (_mrkRelPosArray select _i);
	(_markers select _i) setMarkerPos [_mrkAbsPos select 0, _mrkAbsPos select 1, 0];
};

sleep 1;
{detach _x} forEach _objects;
{_pos = getPos _x; _pos set [2, 0]; _x setPos _pos} forEach _objects;

gnrf_moveCrusaderReady = true;
publicVariable "gnrf_moveCrusaderReady";
