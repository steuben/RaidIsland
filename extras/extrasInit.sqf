//////client//////
if (!isDedicated) then {

	//////client functions precompiled
	gnrf_playerRespawn_fnc = compile preProcessFileLineNumbers "client\functions\respawn.sqf";
	grnf_getDisplayName_fnc = compile preProcessFileLineNumbers "client\functions\getDisplayName.sqf";
	grnf_addActions_fnc = compile preProcessFileLineNumbers "client\actions.sqf";
	grnf_keyHandling_fnc = compile preProcessFileLineNumbers "client\functions\keyHandling.sqf";
	grnf_helperArrow_fnc = compile preProcessFileLineNumbers "client\functions\helperArrow.sqf";

	
	//////scripts
	if ((paramsArray select 0) == 1) then {[] execVM "debug\debugMode.sqf"};
	[] execVM "client\XeventHandlers.sqf";
	[] execVM "extras\atv\initATV.sqf";
	[] execVM "extras\supportSquad\supportSquadInit.sqf";
	[] execVM "extras\surveillance\revealUnits.sqf";
	[] execVM "extras\mapTool.sqf";
	[] execVM "extras\assman\assmanInit.sqf";
	[] spawn grnf_addActions_fnc;		
	_fnc_debugRank = {while {true} do {player setUnitRank "COLONEL"; sleep 2;};};
	[] spawn _fnc_debugRank;
	[] execVM "extras\CoIn\CoIn.sqf";
	[] execVM "extras\freezeTime.sqf";
	[] execVM "client\eventHandlers.sqf";
	
};

///////////////ab hier Server only//////////////////

if (!isServer) exitWith {};

//////objects
gnrf_manateeHelipad = "HeliH" createVehicle [4211.59,2187.06,15.2563];

//////variables
steubenKills = [];
bbqKills = [];
steubenTeamKills = [];
bbqTeamKills = [];

alphaKills = [];
bravoKills = [];
alphaTeamKills = [];
bravoTeamKills = [];

//////serverFunctions preCompiled

grnf_SGetDisplayName_fnc = compile preProcessFileLineNumbers "server\functions\serverGetDisplayName.sqf";

carpetBombing = compile preProcessFileLineNumbers "extras\carpetBomber\carpetBombing.sqf";
publicVariable "carpetBombing"; 
gnrf_echoDropPayload = compile preProcessFileLineNumbers "extras\carpetBomber\dropPayload.sqf";

killDetector_compiled = compile preProcessFileLineNumbers "extras\killDetection\killDetector.sqf";
publicVariable "killDetector_compiled";



//////scripte

//[] execVM "extras\noGoZone\noGoZoneServer.sqf";
//[] execVM "extras\opforAssault\assaultInit.sqf";
// [] execVM "extras\ambientCivilians\civInit.sqf";
