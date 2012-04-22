/*
[-1, {AirSupport_SUBMENU set [3, ["Elvis (CAS)", [3], "", -5, [["expression", ""]], "1", "0"]]}] call CBA_fnc_globalExecute;
sleep 1;
AirSupport_SUBMENU set [3, ["Dismiss Elvis", [3], "", -5, [["expression", "[0, player] execVM 'extras\supportSquad\CASClear.sqf'"]], "1", "1"]];
*/

if (supportELVIS) then
{
		_dude =_this select 1;
		_dude sideChat "Hammer, this is Kingfish. Requesting CAS. How copy?";
		sleep 2;
		major sideChat "Negative, Kingfish. Elvis is on business. Coordinate with fellow teamleaders. Hammer out.";
		
		// Reset Victor Action
		//supportMenu1= victor addAction [("<t color=""#ff6600"">" + ("Call in support") + "</t>"),"extras\supportSquad\supportSquadChoose.sqf", [], 300, false, true, ""];
};

if (!supportELVIS) then 
{
		supportELVISBusy = true;
		publicVariable "supportELVISBusy";
		
		elvisRemove = false;
		publicVariable "elvisRemove";
		
		_dude =_this select 1;
		_dude sideChat "Hammer, this is Kingfish. Requesting Priority Air Transport. How copy?";
		
		// CAS TEAM SPAWNEN
		carrierElvisSpawnPos = ussChickenfucker modelToWorld [0,0,18];
		
			// COBRA TOW
			//elvis="CH_47F_EP1" createVehicle getMarkerPos "elvisSpawn";
			elvis="CH_47F_EP1" createVehicle carrierElvisSpawnPos;
			gnrf_respawnInfo set [4, [elvis, 10]]; //add respawn pos - players always spawn at the nearest spawnpos. parameters: 
			// APACHE
			// Elvis="AH64D_EP1" createVehicle getMarkerPos "ElvisSpawn";
			[] execVM "loadout\reinforcement.sqf";
			loadout = elvis addAction ["Save Gear","loadout\loadout.sqf"];
		
		
		[] execVM "extras\atv\initATV.sqf";
		
		elvis addaction ["Goto Airdrop Height","extras\supportSquad\elvisAirdropHeight.sqf",[],1,false,true,"",""];
		elvis addaction ["AIRDROP","extras\supportSquad\elvisAirdrop.sqf",[],1,false,true,"",""];
		
		sleep 3;

		
		teamELVIS1 = Creategroup WEST;
		"US_Soldier_Pilot_EP1" createUnit [getMarkerPos "elvisSpawn", teamELVIS1, "elvis1=this", 1, ""];
		elvis1 moveInDriver elvis;
		
		sleep 3;
		
		"US_Soldier_Pilot_EP1" createUnit [getMarkerPos "elvisSpawn", teamELVIS1, "elvis2=this", 1, ""];
		elvis2 moveInGunner elvis;
		
		"US_Soldier_Pilot_EP1" createUnit [getMarkerPos "elvisSpawn", teamELVIS1, "elvis3=this", 1, ""];
		elvis3 MoveInTurret [elvis,[0]];
		
		"US_Soldier_Pilot_EP1" createUnit [getMarkerPos "elvisSpawn", teamELVIS1, "elvis4=this", 1, ""];
		elvis4 MoveInTurret [elvis,[1]];
		
		major sideChat "Solid Copy, Kingfish. Stand by.";
		
		sleep 6;
		
		waitUntil {(vehicle elvis1 != elvis1) AND (vehicle elvis2 != elvis2) AND (vehicle elvis3 != elvis3) AND (vehicle elvis4 != elvis4)};		
		[elvis1, elvis2, elvis3, elvis4] joinSilent group _dude;
		major sideChat "Kingfish, I have patched you through. Elvis is all yours now.";
		sleep 2;
		_dude sideChat "Roger, Hammer. Kingfish out.";
		
		supportELVIS = true;
		publicVariable "supportELVIS";
		
		supportELVISBusy = false;
		publicVariable "supportELVISBusy";
		
		
		
		
		
				// clear cargo

				clearMagazineCargo elvis;
				clearWeaponCargo elvis;

				// PRIMARY WEAPONS


				elvis addWeaponCargo ["ACE_G36A1_AG36A1_D",100];
				elvis addWeaponCargo ["G36K_camo",100];
				elvis addWeaponCargo ["G36_C_SD_camo",100];
				elvis addWeaponCargo ["ACE_SCAR_H_STD_Spect",100];
				elvis addWeaponCargo ["SCAR_H_STD_EGLM_Spect",100];
				elvis addWeaponCargo ["SCAR_H_CQC_CCO_SD",100];
				elvis addWeaponCargo ["ACE_M16A4_ACG_GL_UP",100];
				elvis addWeaponCargo ["ACE_M14_ACOG",100];

				elvis addWeaponCargo ["ACE_HK416_D14_COMPM3_M320",100];

				elvis addWeaponCargo ["ACE_HK417_Eotech_4x",100];
				elvis addWeaponCargo ["ACE_HK416_D10_COMPM3_SD",100];
				elvis addWeaponCargo ["ACE_HK416_D14_ACOG_PVS14",100];


				elvis addWeaponCargo ["SCAR_H_STD_TWS_SD",100];
				elvis addWeaponCargo ["Mk_48_DES_EP1",100];

				elvis addWeaponCargo ["M32_EP1",100];

				// SNIPER RIFLES
				elvis addWeaponCargo ["ACE_HK417_leupold",100];
				elvis addWeaponCargo ["SCAR_H_LNG_Sniper_SD",100];
				elvis addWeaponCargo ["ACE_TAC50_SD",100];
				elvis addWeaponCargo ["BAF_LRR_scoped",100];
				elvis addWeaponCargo ["M110_NVG_EP1",100];
				elvis addWeaponCargo ["DMR",100];
				elvis addWeaponCargo ["ACE_M109",100];

				// PRIMARY WPN MAGAZINES
				elvis addMagazineCargo ["ACE_100Rnd_556x45_S_BetaCMag",999];
				elvis addMagazineCargo ["ACE_20Rnd_762x51_T_SCAR",400];
				elvis addMagazineCargo ["100Rnd_762x51_M240",200];
				elvis addMagazineCargo ["ACE_5Rnd_25x59_HEDP_Barrett",999];
				elvis addMagazineCargo ["ACE_20Rnd_762x51_T_HK417",999];
				elvis addMagazineCargo ["ACE_20Rnd_762x51_T_DMR",999];
				elvis addMagazineCargo ["6Rnd_HE_M203",100];
				elvis addMagazineCargo ["ACE_6Rnd_CS_M32",100];

				// SNIPER RIFLE MAGAZINES
				elvis addMagazineCargo ["ACE_20Rnd_762x51_T_M110",200];
				elvis addMagazineCargo ["ACE_5Rnd_127x99_T_TAC50",200];
				elvis addMagazineCargo ["ACE_5Rnd_86x70_T_L115A1",200];


				//GRENADES
				elvis addMagazineCargo ["ACE_1Rnd_HE_M203",200];
				elvis addMagazineCargo ["1Rnd_HE_M203",200];
				elvis addMagazineCargo ["ACE_HuntIR_M203",30];
				elvis addMagazineCargo ["HandGrenade_West",300];

				//EXPLOSIVES
				elvis addMagazineCargo ["PipeBomb",100];

				elvis addMagazineCargo ["ACE_M34",100];
				elvis addMagazineCargo ["ACE_Claymore_M",100];
				elvis addMagazineCargo ["ACE_M86PDM",100];

				//LAUNCHERS + LAUNCHER AMMO
				elvis addWeaponCargo ["SMAW",100];
				elvis addMagazineCargo ["ACE_SMAW_NE",100];
				elvis addMagazineCargo ["SMAW_HEAA",100];
				elvis addMagazineCargo ["SMAW_HEDP",100];

				elvis addWeaponCargo ["ACE_Javelin_CLU",20];
				elvis addWeaponCargo ["ACE_Javelin_Direct",40];

				// EQUIPMENT
				elvis addWeaponCargo ["ACE_HuntIR_monitor",6];
				elvis addWeaponCargo ["Laserdesignator",200];
				elvis addMagazineCargo ["Laserbatteries",30];
				elvis addWeaponCargo ["ACE_MX2A",100];
				elvis addMagazineCargo ["ACE_Battery_Rangefinder",30];
				elvis addWeaponCargo ["ACE_GlassesLHD_glasses",30];
				elvis addWeaponCargo ["ACE_Earplugs",30];
				elvis addWeaponCargo ["NVGoggles",30];
				elvis addWeaponCargo ["ACE_ParachutePack",20];

				// SECONDARY

				elvis addWeaponCargo ["ACE_Glock18",200];
				elvis addMagazineCargo ["ACE_33Rnd_9x19_G18",200];

				elvis addWeaponCargo ["Colt1911",200];
				elvis addMagazineCargo ["7Rnd_45ACP_1911",200];

				elvis addWeaponCargo ["UZI_SD_EP1",200];
				elvis addMagazineCargo ["30Rnd_9x19_UZI_SD",200];

				elvis addWeaponCargo ["revolver_EP1",200];
		
		

		
		// Check Elvis's Status, remove & reset if dead or kapott.
		
		while 
		{
			true
		} 
		
		do
		{			
			
			if (elvisRemove) exitWith { };
			
			if ((getDammage elvis >= 0.3)  OR (!alive elvis1) OR (!alive elvis2)) exitWith 
			{
					_dude sideChat "Hammer, this is Kingfish. Be advised, Elvis is down. I say again, Elvis is down! ";
										
					sleep 3;
					major sideChat "Kingfish, this is Hammer. Any chance the pilots made it out alive? Over.";
					sleep 7;
					
					deleteVehicle elvis1;
					deleteVehicle elvis2;
					deleteVehicle elvis3;
					deleteVehicle elvis4; 					
					deleteVehicle elvis; 
					
					// Reset Victor Action
					[] execVM "extras\supportSquad\supportSquadInit.sqf";
					//[-1, {AirSupport_SUBMENU set [2, ["Elvis (CAS)", [3], "", -5, [["expression", "[0, player] execVM 'extras\supportSquad\CAS.sqf'"]], "1", "1"]]}] call CBA_fnc_globalExecute;
					sleep 3;
					_dude sideChat "Pretty much zero, Hammer. Kingfish out.";
			};
			
			sleep 15;
		};
		
		
		
		
};