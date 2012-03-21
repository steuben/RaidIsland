supportELVISBusy = true;
publicVariable "supportELVISBusy";

elvisRemove = true;
publicVariable "elvisRemove";

victor removeAction clearSupportELVIS;

_dude =_this select 1;
_dude sideChat "ELVIS, that would be all for now. RTB, copy.";

teamELVIS2 = Creategroup WEST;
[ELVIS1, ELVIS2, ELVIS3, ELVIS4] joinSilent teamELVIS2;

teamELVIS2 = group ELVIS1;
ELVIS1 setGroupID ["ELVIS","GroupColor4"];

sleep 2;

ELVIS_WP1 = teamELVIS2 addWaypoint [getMarkerPos "ELVISSpawn", 1];
ELVIS_WP1  setWaypointType "MOVE"; 
ELVIS_WP1  setWaypointFormation "WEDGE";
ELVIS_WP1  setWaypointBehaviour "SAFE";
ELVIS_WP1  setWaypointSpeed "FULL";
ELVIS_WP1 setWaypointStatements ["true", "elvisRTB=true"];

sleep 2;

ELVIS1 sideChat "Copy that KINGFISH. ELVIS RTB, out.";

waitUntil {elvisRTB};

ELVIS1 leaveVehicle ELVIS;
ELVIS2 leaveVehicle ELVIS;
sleep 2;
ELVIS3 leaveVehicle ELVIS;
ELVIS4 leaveVehicle ELVIS;

waitUntil {(vehicle ELVIS1 == ELVIS1) AND (vehicle ELVIS2 == ELVIS2)};

sleep 10;

deleteVehicle ELVIS1;
deleteVehicle ELVIS2;
deleteVehicle ELVIS3;
deleteVehicle ELVIS4;  
deleteVehicle ELVIS; 

elvisRTB = false;
publicVariable "elvisRTB";
supportELVIS = false;
publicVariable "supportELVIS";

major sideChat "All KINGFISH elements, be advised: Air Transport standing by.";

supportELVISBusy = false;
publicVariable "supportELVISBusy";

// Reset Victor Action
//[] execVM "extras\supportSquad\supportSquadInit.sqf";
//[-1, {AirSupport_SUBMENU set [2, ["ELVIS (ELVIS)", [3], "", -5, [["expression", "[0, player] execVM 'extras\supportSquad\ELVIS.sqf'"]], "1", "1"]]}] call CBA_fnc_globalExecute;
// Script complete
_dude sideChat "Copy that, Hammer. KINGFISH out.";