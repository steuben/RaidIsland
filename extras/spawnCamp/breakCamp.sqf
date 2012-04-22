spawnCampBusy = true;
publicVariable "spawnCampBusy";


_dis = [player, spawnCampBox] call BIS_fnc_distance2D;

if (_dis < 5) then
{
	hint "BREAKING CAMP...";
	sleep 4;
	deleteVehicle spawnCampNet; 
	sleep 1;
	deleteVehicle spawnCampBox;
	deleteMarker "spawnCampMarker";
	hint "CAMP DECONSTRUCTED!";

	spawnCampActive = false;
	publicVariable "spawnCampActive";
	spawnCampBusy = false;
	publicVariable "spawnCampBusy";
	
};

if (_dis > 5) then
{
	hint "YOU ARE TOO FAR AWAY";
	spawnCampActive = true;
	publicVariable "spawnCampActive";
	spawnCampBusy = false;
	publicVariable "spawnCampBusy";
};

