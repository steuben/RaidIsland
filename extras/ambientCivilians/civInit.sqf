
[-2, {progressLoadingScreen 0.5}] call CBA_fnc_globalExecute;

gnrf_civSetRdy = true;
gnrf_civUnits = [];
gnrf_movingCivs = [];
gnrf_housedCivs = [];
gnrf_scaredCivs = [];

civCenter = createCenter civilian;
gnrf_civSet = createGroup civilian;
gnrf_civBuilding_grp = createGroup civilian;

_unit = "TK_CIV_Takistani01_EP1" createUnit [[10000,10000,0], gnrf_civSet, "", 1, ""];
_civLeader = leader gnrf_civSet;
doStop _civLeader;
_civLeader disableAI "MOVE";
_civLeader disableAI "AUTOTARGET";
_civLeader disableAI "FSM";
_nic = [nil, leader gnrf_civSet, "per", rHideObject, true] call RE;

_unit = "TK_CIV_Takistani01_EP1" createUnit [[10000,10000,0], gnrf_civBuilding_grp, "", 1, ""];
_civLeader = leader gnrf_civBuilding_grp;
doStop _civLeader;
_civLeader disableAI "MOVE";
_civLeader disableAI "AUTOTARGET";
_civLeader disableAI "FSM";
_nic = [nil, leader gnrf_civBuilding_grp, "per", rHideObject, true] call RE;


for "_i" from 1 to 70 do {
		
		waitUntil {gnrf_civSetRdy};
		[] spawn gnrf_createCivSet_fnc;
		sleep 0.01;
};

//////civs in Buildings
for "_i" from 0 to 60 do {	

	waitUntil {isNil "gnrf_currentUnit"};
	[] spawn gnrf_civInBuilding_fnc;
	sleep 0.01;
};

//////add EH´s
{_x addMPEventhandler ["MPKilled", "if (isServer) then {_this select 0 removeAllEventHandlers 'MPkilled'; [_this select 0, _this select 1] spawn killDetector_compiled}"];} forEach gnrf_civUnits;

//////civ movement
[] spawn compile preprocessFile "extras\ambientCivilians\civMovement.sqf";

[-2, {endLoadingScreen}] call CBA_fnc_globalExecute;
