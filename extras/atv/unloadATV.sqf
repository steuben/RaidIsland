


_atv1 = "HMMWV_M998A2_SOV_DES_EP1" createVehicle [0, 0, 5000]; 
_atv2 = "HMMWV_M998A2_SOV_DES_EP1" createVehicle [0, 0, 5000]; 
_veh = _this select 0; 

_atv1 attachTo [_veh,[5,-12,-1.25]]; 
_atv1 setDir 150; 
_atv1 setpos getpos _atv1;

_atv2 attachTo [_veh,[-5,-12,-1.25]]; 
_atv2 setDir 210; 
_atv2 setpos getpos _atv2;

//_veh setVariable ["empty", true, true]; 

sleep 0.5; 
detach _atv1;
detach _atv2;

_atv1 addaction ["Attach Vehicle","extras\atv\attachATV.sqf",[],1,false,true,"","
	_nook = elvis; 	
	speed _target < 3;
"];

_atv2 addaction ["Attach Vehicle","extras\atv\attachATV.sqf",[],1,false,true,"","
	_nook = elvis; 	
	speed _target < 3;
"];
	
gnrf_respawnInfo set [5, [_atv1, 10]]; //add respawn pos - players always spawn at the nearest spawnpos. parameters:
gnrf_respawnInfo set [6, [_atv2, 10]]; //add respawn pos - players always spawn at the nearest spawnpos. parameters:
	
	
/*(_nook getVariable 'empty') AND*/ 