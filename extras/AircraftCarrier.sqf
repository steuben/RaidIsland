
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
} foreach _parts;
publicVariable "ussChickenfucker";

carrierElvisSpawnPos = ussChickenfucker modelToWorld [0,0,18];
"elvisSpawn" setMarkerPos carrierElvisSpawnPos;


//player and unit positions
{
	_player = _x;
	for "_i" from 0 to (count (units group _player))-1 do 
	{
		_unit = (units group _player) select _i;
		_pos = USSChickenFucker modelToWorld [-2+(random 4),-2+(random 4),18];
		_unit setPosASL _pos;
	};

} forEach gnrf_players;

waitUntil {sleep 0.5; !isNil "gnrf_respawnInfo"};
gnrf_respawnInfo set [0, [ussChickenfucker, 0]]; //add respawn pos - players always spawn at the nearest spawnpos. parameters: 
publicVariable "gnrf_respawnInfo";