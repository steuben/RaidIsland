sleep 0.5; 

spawnCampBusy = true;
publicVariable "spawnCampBusy";


spawnCampPos = getPos player;

spawnCampNet="Land_CamoNet_NATO_EP1" createVehicle spawnCampPos;
spawnCampNet setDir 360;
publicVariable "spawnCampNet";
spawnCampBox="USSpecialWeapons_EP1" createVehicle spawnCampPos;
publicVariable "spawnCampBox";

gnrf_respawnInfo set [7, [spawnCampBox, 10]]; 
loadout = spawnCampBox addAction ["Save Gear","loadout\loadout.sqf"];

_marker = createMarker ["spawnCampMarker", spawnCampPos ];
publicVariable "spawnCampMarker";
"spawnCampMarker" setMarkerType "mil_flag";
"spawnCampMarker" setMarkerColor "ColorBlue";
"spawnCampMarker" setMarkerText "CAMP";


spawnCampActive = true;
publicVariable "spawnCampActive";

spawnCampBusy = false;
publicVariable "spawnCampBusy";