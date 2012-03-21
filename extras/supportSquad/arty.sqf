
if (supportMCAS) then
{
	_dude =_this select 1;
	_dude sideChat "Hammer, this is KINGFISH. Requesting fire mission, stat!";
	sleep 2;
	major sideChat "Negative, KINGFISH. Battery already assigned to ongoing firemission. Coordinate with fellow teamleaders. Hammer out.";
	
	// Reset Victor Action
	supportMenu1= victor addAction [("<t color=""#ff3300"">" + ("Call in support") + "</t>"),"extras\supportSquad\supportSquadChoose.sqf", [], 300, false, true, ""];
	
};

if (!supportMCAS) then 
{
		supportMCASBusy = true;
		publicVariable "supportMCASBusy";
		
		_dude =_this select 1;
		_dude sideChat "Hammer, this is KINGFISH. Requesting fire mission, stat!";
		
		// ARTY TEAM SPAWNEN
		
		mcHammer1 setVehicleAmmo 1;
		mcHammer2 setVehicleAmmo 1;
		
		teamMCAS1 = Creategroup WEST;
		publicVariable "teamMCAS1";
		"ACE_USMC_Soldier_D" createUnit [getMarkerPos "mortarTeamSpawn", teamMCAS1, "mortarTeamGunner1=this", 1, ""];
		sleep 2;
		"ACE_USMC_Soldier_D" createUnit [getMarkerPos "mortarTeamSpawn", teamMCAS1, "mortarTeamGunner2=this", 1, ""];
		//sleep 5;		
		mortarTeamGunner1 moveInGunner mcHammer1;
		//sleep 5;
		mortarTeamGunner2 moveInGunner mcHammer2;
		
		major sideChat "Solid Copy, KINGFISH. Stand by.";
		
		sleep 4;
		
		// ARTY TEAM JOINEN
		
		waitUntil {(vehicle mortarTeamGunner1 != mortarTeamGunner1) AND (vehicle mortarTeamGunner2 != mortarTeamGunner2)};
		[mortarTeamGunner1, mortarTeamGunner2] joinSilent group _dude;
		major sideChat "KINGFISH, Hammer is ready to rock. Happy hunting, over.";
		sleep 2;
		_dude sideChat "Roger, Hammer. KINGFISH out.";
		
		supportMCAS = true;
		publicVariable "supportMCAS";
		
		supportMCASBusy = false;
		publicVariable "supportMCASBusy";
		
		// Reset Victor Action
		clearSupporMCAS= victor addAction [("<t color=""#ff3300"">" + ("Dismiss Mortar Team") + "</t>"),"extras\supportSquad\artyClear.sqf", [], 300, false, true, ""];
		
};