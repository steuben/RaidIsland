nook1 setVariable ["empty", false, true];
nook1 addAction ["Unload ATV","extras\atv\unloadATV.sqf", [], 300, false, true, "", "alive _target && speed _target < 30 && !(nook1 getVariable 'empty')"];

nook2 setVariable ["empty", false, true];
nook2 addAction ["Unload ATV","extras\atv\unloadATV.sqf", [], 300, false, true, "", "alive _target && speed _target < 30 && !(nook2 getVariable 'empty')"];

//turboATV actionKey

gnrf_turboAtv_keyDown = {
	
	_atv = ["ATV_US_EP1"];
	_veh = vehicle player;
		  
	if (typeOf _veh in _atv) then {
			
		_vel = velocity _veh;
		_dir = direction _veh;
		_speed = 15;
		_veh setVelocity [(_vel select 0)+(sin _dir*_speed),(_vel select 1)+(cos _dir*_speed),(_vel select 2)];
	    		
	};  
};

