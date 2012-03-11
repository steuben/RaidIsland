

//examples: 
//["gnrf_clientExecute", [major, "sideChat", "All GHOSTRIDER units, be advised."]] call CBA_fnc_globalEvent;
// ["gnrf_clientExecute", [_dude, "spawn", "grnf_helperArrow_fnc"]] call CBA_fnc_remoteEvent
// ["gnrf_clientExecute", ["titleText", ["Enemy Forces Advancing On Zargabad From The North.", "PLAIN"]]] call CBA_fnc_globalEvent;
//["gnrf_clientExecute", [[], "execVM", "loadout\reinforcement.sqf"]] call CBA_fnc_globalEvent;

["gnrf_clientExecute", 
{
	private ["_param", "_cmd", "_fnc"];

	if (count _this == 2) then 
	{
		_param = "";
		_cmd = _this select 0;
		_fnc = _this select 1;
	
	} else 
	{	
		_param = _this select 0;	
		_cmd = _this select 1;
		_fnc = _this select 2;
	};
	
	if ((typeName _fnc == "STRING") AND (_cmd != "call") AND (_cmd != "spawn")) then {_fnc = str(_fnc)};
	
	call compile format ["%1 %2 %3;",_param, _cmd, _fnc];
	
}] call CBA_fnc_addEventHandler;




