


_atv = "HMMWV_M998A2_SOV_DES_EP1" createVehicle [0, 0, 5000]; 
_veh = _this select 0; 

_atv attachTo [_veh,[0,-12,-1.25]]; 
_atv setDir 180; 
_atv setpos getpos _atv;
_veh setVariable ["empty", true, true]; 

sleep 0.5; 
detach _atv;

_atv addaction ["Attach Vehicle","extras\atv\attachATV.sqf",[],1,false,true,"","
	_nook = (nearestobjects [getpos _target,['CH_47F_EP1'],10] select 0); 	
	(_nook getVariable 'empty') AND speed _target < 3;
"];
	
	
