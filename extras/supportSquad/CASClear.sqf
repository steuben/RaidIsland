supportCASBusy = true;
publicVariable "supportCASBusy";

casRemove = true;
publicVariable "casRemove";

victor removeAction clearSupportCAS;

_dude =_this select 1;
_dude sideChat "Manatee, that would be all for now. RTB, copy.";

teamCAS2 = Creategroup WEST;
[manatee1, manatee2] joinSilent teamCAS2;

teamCAS2 = group manatee1;
manatee1 setGroupID ["MANATEE","GroupColor4"];

sleep 2;

manatee_WP1 = teamCAS2 addWaypoint [getMarkerPos "manateeSpawn", 1];
manatee_WP1  setWaypointType "MOVE"; 
manatee_WP1  setWaypointFormation "WEDGE";
manatee_WP1  setWaypointBehaviour "SAFE";
manatee_WP1  setWaypointSpeed "FULL";
manatee_WP1 setWaypointStatements ["true", "RTB=true"];

sleep 2;

manatee1 sideChat "Copy that Ghostrider. Manatee RTB, out.";

waitUntil {RTB};

manatee1 leaveVehicle manatee;
manatee2 leaveVehicle manatee;

waitUntil {(vehicle manatee1 == manatee1) AND (vehicle manatee2 == manatee2)};

sleep 10;

deleteVehicle manatee1;
deleteVehicle manatee2; 
deleteVehicle manatee; 

supportMCAS = false;
publicVariable "supportMCAS";

major sideChat "All Ghostrider elements, be advised: Close Air Support standing by.";

supportCASBusy = false;
publicVariable "supportCASBusy";

// Reset Victor Action
[] execVM "extras\supportSquad\supportSquadInit.sqf";
[-1, {AirSupport_SUBMENU set [2, ["Manatee (CAS)", [3], "", -5, [["expression", "[0, player] execVM 'extras\supportSquad\CAS.sqf'"]], "1", "1"]]}] call CBA_fnc_globalExecute;
// Script complete
_dude sideChat "Copy that, Hammer. Ghostrider out.";