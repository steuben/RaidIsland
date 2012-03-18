supportMCASBusy = true;
publicVariable "supportMCASBusy";

victor removeAction clearSupporMCAS;
Support_MAINMENU set [1, ["Dismiss Mortars", [2], "", -5, [["expression", "[0, player] execVM 'extras\supportSquad\artyClear.sqf'"]], "1", "0"]];

_dude =_this select 1;
_dude sideChat "Hammer, this is Ghostrider actual, that was outstanding. Fire mission complete!";
teamMCAS2 = Creategroup WEST;
[mortarTeamGunner1, mortarTeamGunner2] joinSilent teamMCAS2;

mortarTeamGunner1 leaveVehicle mcHammer1;
mortarTeamGunner2 leaveVehicle mcHammer2;
sleep 2;
major sideChat "You bet your ass, Ghostrider. Always a pleasure!";
sleep 6;
deleteVehicle mortarTeamGunner1;
deleteVehicle mortarTeamGunner2;

supportMCAS = false;
publicVariable "supportMCAS";

supportMCASBusy = false;
publicVariable "supportMCASBusy";

major sideChat "Hammer standing by for further fire missions. Out.";
// Reset Victor Action
//[] execVM "extras\supportSquad\supportSquadInit.sqf";
[-1, {Support_MAINMENU set [1, ["Mortars", [2], "", -5, [["expression", "[0, player] execVM 'extras\supportSquad\arty.sqf'"]], "1", "1"]]}] call CBA_fnc_globalExecute;
