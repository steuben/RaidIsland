if (isDedicated) exitWith {};

waitUntil {(!isnil "bis_fnc_init") AND (alive player)};

[] call BIS_fnc_commsMenuCreate;

Support_MAINMENU = 
[	
  	["Support",false],
	["Mortars", [2], "", -5, [["expression", "[0, player] execVM 'extras\supportSquad\arty.sqf'"]], "1", "1"],
	["Air Support", [3], "#USER:AirSupport_SUBMENU", -5, [["expression", ""]], "1", "1"],
	["SatScan", [4], "", -5, [["expression", "execVM 'extras\surveillance\satelliteScan.sqf'"]], "1", "1"]/*,
	["CoIn", [5], "", -5, [["expression", "[] execVM 'extras\CoIn\ingameCoIn.sqf';"]], "1", "1"]*/
];

AirSupport_SUBMENU =
[
	["Air Support",false],
	["Carpet Bombardment", [2], "", -5, [["expression", "[player] execVM 'extras\carpetBomber\carpetInit.sqf'"]], "1", "1"],
	["Manatee (CAS)", [3], "", -5, [["expression", "[0, player] execVM 'extras\supportSquad\CAS.sqf'"]], "1", "1"]
];

waituntil {!isnil "BIS_MENU_GroupCommunication"};
[BIS_MENU_GroupCommunication, ["Support",[2],"#USER:Support_MAINMENU",-5,[["expression",""]],"1","1"]] call BIS_fnc_arrayPush;


