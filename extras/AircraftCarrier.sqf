
//create carrier
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

//define elvis spawnpos
carrierElvisSpawnPos = ussChickenfucker modelToWorld [12,170,18.5];
gnrf_elvisH = "heliHempty" createVehicle carrierElvisSpawnPos;
"elvisSpawn" setMarkerPos carrierElvisSpawnPos;

//define player / team spawn via function
gnrf_playerPos_fnc =
{
	_pos = USSChickenFucker modelToWorld [-10+(random 6),95+(random 10),18.5];
	_pos
};
publicVariable "gnrf_playerPos_fnc";

//move player / team to spawnpos
{
	_player = _x;
	for "_i" from 0 to (count (units group _player))-1 do 
	{
		_unit = (units group _player) select _i;
		_pos = call gnrf_playerPos_fnc;
		_unit setPosASL _pos;
	};

} forEach gnrf_players;

//set respawn info
waitUntil {sleep 0.5; !isNil "gnrf_respawnInfo"};
gnrf_respawnInfo set [0, [ussChickenfucker, 0]]; //add respawn pos - players always spawn at the nearest spawnpos. parameters: 
publicVariable "gnrf_respawnInfo";
