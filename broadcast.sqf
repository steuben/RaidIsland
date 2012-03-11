

switch (_this select 0) do {
	
	case "kill" : {
		killMessageInfo call fnc_killMessage;
		killMessageInfo = nil;		
		broadcast = nil;
	};
	
	case "stats" : {	
		
		if (isServer) then {	
		
			publicVariable "bbqKills";	
			publicVariable "steubenKills";
			publicVariable "alphaKills";
			publicVariable "bravoKills";
			broadcast = nil;
		};
	};
	
	case "baconTriggered" : {	
		titleText ["Enemy activity detected in Bacon sector.", "PLAIN"];
	    	broadcast = nil;	    	
	    	initBacon_spawn = [] spawn initBacon_compiled;
	};
	
	case "falafelTriggered" : {	
		titleText ["Enemy activity detected in Falafel sector.", "PLAIN"];
	    	broadcast = nil;	
	   	initFalafel_spawn = [] spawn initFalafel_compiled;
	};	
	
	case "golemTriggered" : {	
		titleText ["Enemy activity detected in Golem sector.", "PLAIN"];
	    	broadcast = nil;	
	    	initGolem_spawn = [] spawn initGolem_compiled;
	};	
	
	case "mushroomTriggered" : {	
		titleText ["Enemy activity detected in Mushroom sector.", "PLAIN"];
	    	broadcast = nil;	
	    	initMushroom_spawn = [] spawn initMushroom_compiled;
	};	
	
	case "omahaTriggered" : {	
		titleText ["Enemy activity detected in Omaha sector.", "PLAIN"];
		broadcast = nil;	
		initOmaha_spawn = [] spawn initOmaha_compiled;
	};
	
	case "pantiesTriggered" : {	
		titleText ["Enemy activity detected in Panties sector.", "PLAIN"];
	    broadcast = nil;
		initPanties_spawn = [] spawn initPanties_compiled;	
	};
	
};








