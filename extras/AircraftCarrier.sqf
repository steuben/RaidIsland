
_spawnpoint = [5270.46,315.985,0];

_parts = 
[
	"Land_LHD_house_1",
	"Land_LHD_house_2",
	"Land_LHD_elev_R",
	"Land_LHD_1",
	"Land_LHD_2",
	"Land_LHD_3",
	"Land_LHD_4",
	"Land_LHD_5",
	"Land_LHD_6"
];
{
	ussChickenfucker = _x createvehicle _spawnpoint;
	ussChickenfucker setdir 88;
	ussChickenfucker setpos _spawnpoint;
	publicVariable "ussChickenfucker";
} foreach _parts;

carrierElvisSpawnPos = ussChickenfucker modelToWorld [0,0,18];
"elvisSpawn" setMarkerPos carrierElvisSpawnPos;