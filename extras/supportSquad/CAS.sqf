
[-1, {AirSupport_SUBMENU set [2, ["Manatee (CAS)", [3], "", -5, [["expression", ""]], "1", "0"]]}] call CBA_fnc_globalExecute;
sleep 1;
AirSupport_SUBMENU set [2, ["Dismiss Manatee", [3], "", -5, [["expression", "[0, player] execVM 'extras\supportSquad\CASClear.sqf'"]], "1", "1"]];


victor removeAction supportMenuArty;
victor removeAction supportMenuSupply;
victor removeAction supportMenuCAS;

if (supportCAS) then
{
		_dude =_this select 1;
		_dude sideChat "Hammer, this is Ghostrider. Requesting CAS. How copy?";
		sleep 2;
		major sideChat "Negative, Ghostrider. Manatee is on business. Coordinate with fellow teamleaders. Hammer out.";
		
		// Reset Victor Action
		supportMenu1= victor addAction [("<t color=""#ff6600"">" + ("Call in support") + "</t>"),"extras\supportSquad\supportSquadChoose.sqf", [], 300, false, true, ""];
};

if (!supportCAS) then 
{
		supportCASBusy = true;
		publicVariable "supportCASBusy";
		
		casRemove = false;
		publicVariable "casRemove";
		
		_dude =_this select 1;
		_dude sideChat "Hammer, this is Ghostrider. Requesting CAS. How copy?";
		
		// CAS TEAM SPAWNEN
		
			// COBRA TOW
			manatee="ACE_AH1W_TOW_TOW_D" createVehicle getMarkerPos "manateeSpawn";
			
			// APACHE
			// manatee="AH64D_EP1" createVehicle getMarkerPos "manateeSpawn";
			
					
		teamCAS1 = Creategroup WEST;
		"US_Soldier_Pilot_EP1" createUnit [getMarkerPos "manateeSpawn", teamCAS1, "manatee1=this", 1, ""];
		manatee1 moveInDriver manatee;
		
		sleep 3;
		
		"US_Soldier_Pilot_EP1" createUnit [getMarkerPos "manateeSpawn", teamCAS1, "manatee2=this", 1, ""];
		manatee2 moveInGunner manatee;
		
		major sideChat "Solid Copy, Ghostrider. Stand by.";
		
		sleep 6;
		
		waitUntil {(vehicle manatee1 != manatee1) AND (vehicle manatee2 != manatee2)};		
		[manatee1, manatee2] joinSilent group _dude;
		major sideChat "Ghostrider, I have patched you through. MANATEE is all yours now.";
		sleep 2;
		_dude sideChat "Roger, Hammer. Ghostrider out.";
		
		clearSupportCAS= victor addAction [("<t color=""#ff6600"">" + ("Dismiss MANATEE") + "</t>"),"extras\supportSquad\CASClear.sqf", [], 300, false, true, ""]; 
		
		supportCAS = true;
		publicVariable "supportCAS";
		
		supportCASBusy = false;
		publicVariable "supportCASBusy";
		
		
		
		// Ride Of Teh Valkyries
		
		while 
		{
			true
		} 
		
		do
		{			
			
			if (casRemove) exitWith { };
			
			if ((velocity manatee select 2) > 7) exitWith 
			{

			sleep 17;
					[manatee, "valkyrie"] call CBA_fnc_globalSay3d;
					
			};
			
			sleep 3;
		};
		
		
		// Check Manatee's Status, remove & reset if dead or kapott.
		
		while 
		{
			true
		} 
		
		do
		{			
			
			if (casRemove) exitWith { };
			
			if ((getDammage manatee >= 0.3)  OR (!alive manatee1) OR (!alive manatee2)) exitWith 
			{
					_dude sideChat "Hammer, this is Ghostrider. Be advised, Manatee is down. I say again, Manatee is down! ";
					victor removeAction clearSupportCAS;
					
					sleep 3;
					major sideChat "Ghostrider, this is Hammer actual. Any chance the pilots made it out alive? Over.";
					sleep 7;
					
					deleteVehicle manatee1;
					deleteVehicle manatee2; 
					deleteVehicle manatee; 
					
					// Reset Victor Action
					[] execVM "extras\supportSquad\supportSquadInit.sqf";
					[-1, {AirSupport_SUBMENU set [2, ["Manatee (CAS)", [3], "", -5, [["expression", "[0, player] execVM 'extras\supportSquad\CAS.sqf'"]], "1", "1"]]}] call CBA_fnc_globalExecute;
					sleep 3;
					_dude sideChat "Pretty much zero, Hammer. Ghostrider out.";
			};
			
			sleep 35;
		};
		
		
		
		
};