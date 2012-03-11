
//freeze time of day if parameter is set
if ((paramsArray select 3) == 1) then {

	[] spawn {
	
		while {sleep 30; true} do {
		
			skipTime - 0.0080;
		};
	};
};