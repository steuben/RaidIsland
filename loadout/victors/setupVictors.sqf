
//save gear action

loadout = lav1 addAction ["Save Gear","loadout\loadout.sqf"]; 
loadout = lav2 addAction ["Save Gear","loadout\loadout.sqf"]; 
loadout = lav3 addAction ["Save Gear","loadout\loadout.sqf"]; 
loadout = lav4 addAction ["Save Gear","loadout\loadout.sqf"]; 
loadout = bird addAction ["Save Gear","loadout\loadout.sqf"]; 

// misc actions

_coInMenu_act = bird addAction [("<t color=""#4693FF"">" + ("Construction") + "</t>"),"gen_action.sqf",[{	
	
	gnrf_CoIn = true;
	[] execVM "extras\CoIn\ingameCoIn.sqf"; 
	
}],0,false,false,"","isNil 'gnrf_CoIn'"];


// Kill Detection


bird addMPEventhandler ["MPKilled", "if (isServer) then {[_this select 0, _this select 1] spawn killDetector_compiled}"];
bird2 addMPEventhandler ["MPKilled", "if (isServer) then {[_this select 0, _this select 1] spawn killDetector_compiled}"];
jackal1 addMPEventhandler ["MPKilled", "if (isServer) then {[_this select 0, _this select 1] spawn killDetector_compiled}"];
jackal2 addMPEventhandler ["MPKilled", "if (isServer) then {[_this select 0, _this select 1] spawn killDetector_compiled}"];
bird addMPEventhandler ["MPKilled", "if (isServer) then {[_this select 0, _this select 1] spawn killDetector_compiled}"];
medevacVictor addMPEventhandler ["MPKilled", "if (isServer) then {[_this select 0, _this select 1] spawn killDetector_compiled}"];


////////////////////// UTILITY HUMMVEE

// clear cargo

clearMagazineCargo bird;
clearWeaponCargo bird;

// PRIMARY WEAPONS


bird addWeaponCargo ["ACE_G36A1_AG36A1_D",100];
bird addWeaponCargo ["G36K_camo",100];
bird addWeaponCargo ["G36_C_SD_camo",100];
bird addWeaponCargo ["ACE_SCAR_H_STD_Spect",100];
bird addWeaponCargo ["SCAR_H_STD_EGLM_Spect",100];
bird addWeaponCargo ["SCAR_H_CQC_CCO_SD",100];
bird addWeaponCargo ["ACE_M16A4_ACG_GL_UP",100];
bird addWeaponCargo ["ACE_M14_ACOG",100];

bird addWeaponCargo ["ACE_HK416_D14_COMPM3_M320",100];

bird addWeaponCargo ["ACE_HK417_Eotech_4x",100];
bird addWeaponCargo ["ACE_HK416_D10_COMPM3_SD",100];
bird addWeaponCargo ["ACE_HK416_D14_ACOG_PVS14",100];


bird addWeaponCargo ["SCAR_H_STD_TWS_SD",100];
bird addWeaponCargo ["Mk_48_DES_EP1",100];

bird addWeaponCargo ["M32_EP1",100];

// SNIPER RIFLES
bird addWeaponCargo ["ACE_HK417_leupold",100];
bird addWeaponCargo ["SCAR_H_LNG_Sniper_SD",100];
bird addWeaponCargo ["ACE_TAC50_SD",100];
bird addWeaponCargo ["BAF_LRR_scoped",100];
bird addWeaponCargo ["M110_NVG_EP1",100];
bird addWeaponCargo ["DMR",100];
bird addWeaponCargo ["ACE_M109",100];

// PRIMARY WPN MAGAZINES
bird addMagazineCargo ["ACE_100Rnd_556x45_S_BetaCMag",999];
bird addMagazineCargo ["ACE_20Rnd_762x51_T_SCAR",400];
bird addMagazineCargo ["100Rnd_762x51_M240",200];
bird addMagazineCargo ["ACE_5Rnd_25x59_HEDP_Barrett",999];
bird addMagazineCargo ["ACE_20Rnd_762x51_T_HK417",999];
bird addMagazineCargo ["ACE_20Rnd_762x51_T_DMR",999];
bird addMagazineCargo ["6Rnd_HE_M203",100];
bird addMagazineCargo ["ACE_6Rnd_CS_M32",100];

// SNIPER RIFLE MAGAZINES
bird addMagazineCargo ["ACE_20Rnd_762x51_T_M110",200];
bird addMagazineCargo ["ACE_5Rnd_127x99_T_TAC50",200];
bird addMagazineCargo ["ACE_5Rnd_86x70_T_L115A1",200];


//GRENADES
bird addMagazineCargo ["ACE_1Rnd_HE_M203",200];
bird addMagazineCargo ["1Rnd_HE_M203",200];
bird addMagazineCargo ["ACE_HuntIR_M203",30];
bird addMagazineCargo ["HandGrenade_West",300];

//EXPLOSIVES
bird addMagazineCargo ["PipeBomb",100];

bird addMagazineCargo ["ACE_M34",100];
bird addMagazineCargo ["ACE_Claymore_M",100];
bird addMagazineCargo ["ACE_M86PDM",100];

//LAUNCHERS + LAUNCHER AMMO
bird addWeaponCargo ["SMAW",100];
bird addMagazineCargo ["ACE_SMAW_NE",100];
bird addMagazineCargo ["SMAW_HEAA",100];
bird addMagazineCargo ["SMAW_HEDP",100];

bird addWeaponCargo ["ACE_Javelin_CLU",20];
bird addWeaponCargo ["ACE_Javelin_Direct",40];

// EQUIPMENT
bird addWeaponCargo ["ACE_HuntIR_monitor",6];
bird addWeaponCargo ["Laserdesignator",200];
bird addMagazineCargo ["Laserbatteries",30];
bird addWeaponCargo ["ACE_MX2A",100];
bird addMagazineCargo ["ACE_Battery_Rangefinder",30];
bird addWeaponCargo ["ACE_GlassesLHD_glasses",30];
bird addWeaponCargo ["ACE_Earplugs",30];
bird addWeaponCargo ["NVGoggles",30];

// SECONDARY

bird addWeaponCargo ["ACE_Glock18",200];
bird addMagazineCargo ["ACE_33Rnd_9x19_G18",200];

bird addWeaponCargo ["Colt1911",200];
bird addMagazineCargo ["7Rnd_45ACP_1911",200];

bird addWeaponCargo ["UZI_SD_EP1",200];
bird addMagazineCargo ["30Rnd_9x19_UZI_SD",200];

bird addWeaponCargo ["revolver_EP1",200];