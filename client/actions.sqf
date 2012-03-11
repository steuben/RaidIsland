
//////////global client actions//////////
/* EXAMPLE: 


waitUntil {!isNil "gnrf_drebinFlagPole"};
gnrf_buildDrebin_Act = gnrf_drebinFlagPole addAction [("<t color=""#1F67CC"">" + ("Establish Camp Drebin") + "</t>"),"gen_action.sqf",[{

	if (!isNil "gnrf_drebinEst") exitWith {};
	gnrf_drebinEst = true;
	publicVariable "gnrf_drebinEst";
	[0, {[] execVM "extras\campDrebin.sqf";}] call CBA_fnc_globalExecute;

}],0,true,true,"",""];


gnrf_counterAttack_Act = {
if (isDedicated) exitWith {};
_counterAttack_Act = gnrf_drebinOfficer addAction [("<t color=""#1F67CC"">" + ("Get new orders") + "</t>"),"gen_action.sqf",[{

	if (!isNil "gnrf_CAcalled") exitWith {};
	gnrf_CAcalled = true;
	publicVariable "gnrf_CAcalled";
	[0, {[] execVM "extras\opforAssault\assaultInit.sqf";}] call CBA_fnc_globalExecute;

	["gnrf_clientExecute", ["titleText", ["Enemy Forces Advancing On Zargabad From The North.", "PLAIN"]]] call CBA_fnc_globalEvent;
	sleep 2;
	["gnrf_clientExecute", [major, "sideChat", "All GHOSTRIDER units, be advised."]] call CBA_fnc_globalEvent;
	["gnrf_clientExecute", [major, "sideChat", "Russian Forces have massed up on the northern flank."]] call CBA_fnc_globalEvent;
	sleep 4;
	["gnrf_clientExecute", [major, "sideChat", "Expect a fierce combined arms assault, there are multiple armor units in support of a company sized Mech.Inf. Element approaching Hazar Bagh."]] call CBA_fnc_globalEvent;
	sleep 4;
	["gnrf_clientExecute", [major, "sideChat", "Hold the line! The City you just fucked up is counting on you now. Hammer out."]] call CBA_fnc_globalEvent;

}],0,true,true,"","isNil 'gnrf_CAcalled' AND !isNil'gnrf_drebinEst'"];

};
*/


