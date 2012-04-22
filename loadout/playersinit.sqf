

alpha = group steuben;
steuben setGroupID ["KINGFISH-ALPHA","GroupColor4"];
bravo = group bbq;
bbq setGroupID ["KINGFISH-BRAVO","GroupColor4"];


//steuben loadout
_unit = steuben;
removeAllWeapons _unit;

// PRIMARY WEAPON MAGS / 12 slots (S) (zb stanag) / 6 slots (M) (zb betaC / smaw rocket)
_unit addMagazine "ACE_20Rnd_762x51_T_HK417";
_unit addMagazine "ACE_20Rnd_762x51_T_HK417";
_unit addMagazine "ACE_20Rnd_762x51_T_HK417";
_unit addMagazine "ACE_20Rnd_762x51_T_HK417";
_unit addMagazine "ACE_20Rnd_762x51_T_HK417";
_unit addMagazine "ACE_20Rnd_762x51_T_HK417";
_unit addMagazine "ACE_20Rnd_762x51_T_HK417";
_unit addMagazine "HandGrenade_West";
_unit addMagazine "HandGrenade_West";
_unit addMagazine "HandGrenade_West";

_unit addMagazine "PipeBomb";
_unit addMagazine "PipeBomb";


// PRIMARY WEAPON
_unit addWeapon "ACE_HK417_Eotech_4x";

// MEDICAL SUPPLIES FOR IFAK
/*
_unit addMagazine "ACE_Bandage";
_unit addMagazine "ACE_Bandage";
_unit addMagazine "ACE_Epinephrine";
_unit addMagazine "ACE_Epinephrine";
_unit addMagazine "ACE_Morphine";
_unit addMagazine "ACE_Morphine";
*/

// SECONDARY WEAPON MAGS / 8 slots

_unit addMagazine "7Rnd_45ACP_1911";
_unit addMagazine "7Rnd_45ACP_1911";
_unit addMagazine "7Rnd_45ACP_1911";
_unit addMagazine "7Rnd_45ACP_1911";
_unit addMagazine "7Rnd_45ACP_1911";
_unit addMagazine "7Rnd_45ACP_1911";
_unit addMagazine "7Rnd_45ACP_1911";
_unit addMagazine "7Rnd_45ACP_1911";

// SECONDARY WEAPON
_unit addWeapon "Colt1911";

// EQUIPMENT
_unit addWeapon "ItemRadio";
_unit addWeapon "NVGoggles";
_unit addWeapon "ACE_MX2A";
_unit addWeapon "ACE_Earplugs";
_unit addWeapon "ItemGPS";
_unit addWeapon "ACE_HuntIR_monitor";

// RUCK
_unit addWeapon "ACE_PRC119";

reload steuben;

if (steuben hasWeapon "ACE_Earplugs") then {    
        [steuben] execFSM "\x\ace\addons\sys_goggles\use_earplug.fsm";    
};

//////////////////////////////////////////////////////////////////

// BBQ Loadout

_unit = bbq;
removeAllWeapons _unit;

// PRIMARY WEAPON MAGS / 12 slots (S) (zb stanag) / 6 slots (M) (zb betaC / smaw rocket)
_unit addMagazine "ACE_20Rnd_762x51_T_HK417";
_unit addMagazine "ACE_20Rnd_762x51_T_HK417";
_unit addMagazine "ACE_20Rnd_762x51_T_HK417";
_unit addMagazine "ACE_20Rnd_762x51_T_HK417";
_unit addMagazine "ACE_20Rnd_762x51_T_HK417";
_unit addMagazine "ACE_20Rnd_762x51_T_HK417";
_unit addMagazine "ACE_20Rnd_762x51_T_HK417";
_unit addMagazine "HandGrenade_West";
_unit addMagazine "HandGrenade_West";
_unit addMagazine "HandGrenade_West";
_unit addMagazine "HandGrenade_West";

_unit addMagazine "PipeBomb";


// PRIMARY WEAPON
_unit addWeapon "ACE_HK417_Eotech_4x";

// MEDICAL SUPPLIES FOR IFAK
/*
_unit addMagazine "ACE_Bandage";
_unit addMagazine "ACE_Bandage";
_unit addMagazine "ACE_Epinephrine";
_unit addMagazine "ACE_Epinephrine";
_unit addMagazine "ACE_Morphine";
_unit addMagazine "ACE_Morphine";
*/


// SECONDARY WEAPON MAGS / 8 slots
_unit addMagazine "ACE_33Rnd_9x19_G18";
_unit addMagazine "ACE_33Rnd_9x19_G18";
_unit addMagazine "ACE_33Rnd_9x19_G18";
_unit addMagazine "ACE_33Rnd_9x19_G18";
_unit addMagazine "ACE_33Rnd_9x19_G18";
_unit addMagazine "ACE_33Rnd_9x19_G18";
_unit addMagazine "ACE_33Rnd_9x19_G18";
_unit addMagazine "ACE_33Rnd_9x19_G18";

// SECONDARY WEAPON
_unit addWeapon "ACE_Glock18";

// EQUIPMENT
_unit addWeapon "ItemRadio";
_unit addWeapon "Binocular";
_unit addWeapon "NVGoggles";
_unit addWeapon "ACE_Earplugs";
_unit addWeapon "ACE_GlassesBalaklavaGray";
_unit addWeapon "ItemGPS";

// RUCK
//_unit addWeapon "ACE_Backpack_US";

reload bbq;

if (bbq hasWeapon "ACE_Earplugs") then {    
        [bbq] execFSM "\x\ace\addons\sys_goggles\use_earplug.fsm";    
};

////////////////////////////////////////////////////////////////

//CREATE TEAM STEUBEN (alpha)

if (player == steuben) then {

"steubenSpawn" setMarkerPos getpos steuben; 

"rb_marksman" createUnit [getMarkerPos "steubenSpawn", alpha, "steuben1=this", 1, ""];
"rb_ar" createUnit [getMarkerPos "steubenSpawn", alpha, "steuben2=this", 1, ""];
"rb_ranger1" createUnit [getMarkerPos "steubenSpawn", alpha, "steuben3=this", 1, ""];
"rb_engineer" createUnit [getMarkerPos "steubenSpawn", alpha, "steuben4=this", 1, ""];

waitUntil {({alive _x} count units alpha) == 5};

// LOADAOUT TEAM STEUBEN

// 	DESIGNATED MARKSMAN steuben1
_unit = steuben1;

removeAllWeapons _unit;

// PRIMARY WEAPON MAGS / 12 slots (S) (zb stanag) / 6 slots (M) (zb betaC / smaw rocket)
_unit addMagazine "ACE_20Rnd_762x51_T_M110";
_unit addMagazine "ACE_20Rnd_762x51_T_M110";
_unit addMagazine "ACE_20Rnd_762x51_T_M110";
_unit addMagazine "ACE_20Rnd_762x51_T_M110";
_unit addMagazine "ACE_20Rnd_762x51_T_M110";
_unit addMagazine "ACE_20Rnd_762x51_T_M110";
_unit addMagazine "ACE_20Rnd_762x51_T_M110";
_unit addMagazine "ACE_20Rnd_762x51_T_M110";
_unit addMagazine "ACE_20Rnd_762x51_T_M110";
_unit addMagazine "ACE_20Rnd_762x51_T_M110";
_unit addMagazine "ACE_20Rnd_762x51_T_M110";
_unit addMagazine "ACE_20Rnd_762x51_T_M110";

// PRIMARY WEAPON
_unit addWeapon "M110_NVG_EP1";

// SECONDARY WEAPON MAGS / 8 slots
//_unit addMagazine "17Rnd_9x19_glock17";
//_unit addMagazine "17Rnd_9x19_glock17";
//_unit addMagazine "17Rnd_9x19_glock17";
//_unit addMagazine "17Rnd_9x19_glock17";
//_unit addMagazine "17Rnd_9x19_glock17";
//_unit addMagazine "17Rnd_9x19_glock17";
//_unit addMagazine "17Rnd_9x19_glock17";
//_unit addMagazine "17Rnd_9x19_glock17";

// SECONDARY WEAPON
//_unit addWeapon "glock17_EP1";

// EQUIPMENT
//_unit addWeapon "Binocular";
_unit addWeapon "NVGoggles";
_unit addWeapon "ACE_Earplugs";
_unit addWeapon "ItemGPS";

// RUCK
//_unit addWeapon "ACE_Backpack_US";

// DURCHLADEN
reload steuben1;

steuben1Weapons = weapons steuben1;
steuben1Magazines = magazines steuben1;
publicVariable "steuben1Weapons";
publicVariable "steuben1Magazines";



// 	AUTOMATIC RIFLEMAN steuben2
_unit = steuben2;

removeAllWeapons _unit;

// PRIMARY WEAPON MAGS / 12 slots (S) (zb stanag) / 6 slots (M) (zb betaC / smaw rocket)
_unit addMagazine "100Rnd_762x51_M240";
_unit addMagazine "100Rnd_762x51_M240";
_unit addMagazine "100Rnd_762x51_M240";
_unit addMagazine "100Rnd_762x51_M240";
_unit addMagazine "100Rnd_762x51_M240";
_unit addMagazine "100Rnd_762x51_M240";
_unit addMagazine "100Rnd_762x51_M240";
_unit addMagazine "100Rnd_762x51_M240";
_unit addMagazine "100Rnd_762x51_M240";
_unit addMagazine "100Rnd_762x51_M240";
_unit addMagazine "100Rnd_762x51_M240";
_unit addMagazine "100Rnd_762x51_M240";

// PRIMARY WEAPON
_unit addWeapon "Mk_48_DES_EP1";

// SECONDARY WEAPON MAGS / 8 slots
//_unit addMagazine "17Rnd_9x19_glock17";
//_unit addMagazine "17Rnd_9x19_glock17";
//_unit addMagazine "17Rnd_9x19_glock17";
//_unit addMagazine "17Rnd_9x19_glock17";

// SECONDARY WEAPON
//_unit addWeapon "glock17_EP1";

// EQUIPMENT
//_unit addWeapon "Binocular";
_unit addWeapon "NVGoggles";
_unit addWeapon "ACE_Earplugs";
_unit addWeapon "ItemGPS";

// RUCK
//_unit addWeapon "ACE_Backpack_US";

// DURCHLADEN
reload steuben2;

steuben2Weapons = weapons steuben2;
steuben2Magazines = magazines steuben2;
publicVariable "steuben2Weapons";
publicVariable "steuben2Magazines";





// 	Heavy Operator steuben3
_unit = steuben3;

removeAllWeapons _unit;

// PRIMARY WEAPON MAGS / 12 slots (S) (zb stanag) / 6 slots (M) (zb betaC / smaw rocket)
_unit addMagazine "ACE_20Rnd_762x51_T_SCAR";
_unit addMagazine "ACE_20Rnd_762x51_T_SCAR";
_unit addMagazine "ACE_20Rnd_762x51_T_SCAR";
_unit addMagazine "ACE_20Rnd_762x51_T_SCAR";
_unit addMagazine "ACE_20Rnd_762x51_T_SCAR";
_unit addMagazine "ACE_20Rnd_762x51_T_SCAR";
_unit addMagazine "ACE_20Rnd_762x51_T_SCAR";
_unit addMagazine "ACE_20Rnd_762x51_T_SCAR";
_unit addMagazine "ACE_20Rnd_762x51_T_SCAR";
_unit addMagazine "ACE_20Rnd_762x51_T_SCAR";
_unit addMagazine "PipeBomb";
_unit addMagazine "PipeBomb";

// PRIMARY WEAPON
_unit addWeapon "SCAR_H_STD_EGLM_Spect";

// SECONDARY WEAPON MAGS / 8 slots
_unit addMagazine "1Rnd_HE_M203";
_unit addMagazine "1Rnd_HE_M203";
_unit addMagazine "1Rnd_HE_M203";
_unit addMagazine "1Rnd_HE_M203";
_unit addMagazine "1Rnd_HE_M203";
_unit addMagazine "1Rnd_HE_M203";
_unit addMagazine "1Rnd_HE_M203";
_unit addMagazine "1Rnd_HE_M203";

// SECONDARY WEAPON
//_unit addWeapon "glock17_EP1";

// EQUIPMENT
//_unit addWeapon "Binocular";
_unit addWeapon "NVGoggles";
_unit addWeapon "ACE_Earplugs";
_unit addWeapon "ItemGPS";

// RUCK / LAUNCHER
_unit addWeapon "ACE_M136_CSRS";


// DURCHLADEN
reload steuben3;

steuben3Weapons = weapons steuben3;
steuben3Magazines = magazines steuben3;
publicVariable "steuben3Weapons";
publicVariable "steuben3Magazines";




// 	RTO steuben4
_unit = steuben4;

removeAllWeapons _unit;

// PRIMARY WEAPON MAGS / 12 slots (S) (zb stanag) / 6 slots (M) (zb betaC / smaw rocket)
_unit addMagazine "ACE_20Rnd_762x51_T_HK417";
_unit addMagazine "ACE_20Rnd_762x51_T_HK417";
_unit addMagazine "ACE_20Rnd_762x51_T_HK417";
_unit addMagazine "ACE_20Rnd_762x51_T_HK417";
_unit addMagazine "ACE_20Rnd_762x51_T_HK417";
_unit addMagazine "ACE_20Rnd_762x51_T_HK417";
_unit addMagazine "ACE_20Rnd_762x51_T_HK417";
_unit addMagazine "ACE_20Rnd_762x51_T_HK417";
_unit addMagazine "ACE_20Rnd_762x51_T_HK417";
_unit addMagazine "ACE_20Rnd_762x51_T_HK417";
_unit addMagazine "ACE_20Rnd_762x51_T_HK417";
_unit addMagazine "ACE_20Rnd_762x51_T_HK417";

// PRIMARY WEAPON
_unit addWeapon "ACE_HK417_Eotech_4x";

// SECONDARY WEAPON MAGS / 8 slots
//_unit addMagazine "17Rnd_9x19_glock17";
//_unit addMagazine "17Rnd_9x19_glock17";
//_unit addMagazine "17Rnd_9x19_glock17";
//_unit addMagazine "17Rnd_9x19_glock17";
//_unit addMagazine "17Rnd_9x19_glock17";
//_unit addMagazine "17Rnd_9x19_glock17";
//_unit addMagazine "17Rnd_9x19_glock17";
//_unit addMagazine "17Rnd_9x19_glock17";

// SECONDARY WEAPON
//_unit addWeapon "glock17_EP1";

// EQUIPMENT
//_unit addWeapon "Binocular";
_unit addWeapon "NVGoggles";
_unit addWeapon "ACE_Earplugs";
_unit addWeapon "ItemGPS";

// RUCK
//_unit addWeapon "ACE_PRC119";

// DURCHLADEN
reload steuben4;

steuben4Weapons = weapons steuben4;
steuben4Magazines = magazines steuben4;
publicVariable "steuben4Weapons";
publicVariable "steuben4Magazines";



////////////////
publicVariable "steuben1";
publicVariable "steuben2";
publicVariable "steuben3";
publicVariable "steuben4";


{_x assignTeam "RED"} foreach [steuben1,steuben2,steuben3,steuben4];


{if (!isPlayer _x) then {doStop _x}} forEach units group player;

[0, {{_x addMPEventhandler ["MPKilled", "if (isServer) then {[_this select 0, _this select 1] spawn killDetector_compiled}"]} forEach units group steuben;}] call CBA_fnc_globalExecute;


gnrf_initCounter = gnrf_initCounter + 1;
publicVariable "gnrf_initCounter";

};

////////////////////////////////////////////////////////////////////////

//CREATE TEAM BBQ (bravo)

if (player == bbq) then {

"bbqSpawn" setMarkerPos getpos bbq; 

"rb_medic" createUnit [getMarkerPos "bbqSpawn", bravo, "bbq1=this", 1, ""];
"rb_ar" createUnit [getMarkerPos "bbqSpawn", bravo, "bbq2=this", 1, ""];
"rb_ranger1" createUnit [getMarkerPos "bbqSpawn", bravo, "bbq3=this", 1, ""];
"rb_at" createUnit [getMarkerPos "bbqSpawn", bravo, "bbq4=this", 1, ""];

waitUntil {({alive _x} count units bravo) == 5};


// LOADAOUT TEAM bbq

// 	AsstTEAMLEADER bbq1
_unit = bbq1;

removeAllWeapons _unit;

// PRIMARY WEAPON MAGS / 12 slots (S) (zb stanag) / 6 slots (M) (zb betaC / smaw rocket)
_unit addMagazine "ACE_20Rnd_762x51_T_HK417";
_unit addMagazine "ACE_20Rnd_762x51_T_HK417";
_unit addMagazine "ACE_20Rnd_762x51_T_HK417";
_unit addMagazine "ACE_20Rnd_762x51_T_HK417";
_unit addMagazine "ACE_20Rnd_762x51_T_HK417";
_unit addMagazine "ACE_20Rnd_762x51_T_HK417";
_unit addMagazine "ACE_20Rnd_762x51_T_HK417";
_unit addMagazine "ACE_20Rnd_762x51_T_HK417";
_unit addMagazine "ACE_20Rnd_762x51_T_HK417";
_unit addMagazine "ACE_20Rnd_762x51_T_HK417";
_unit addMagazine "ACE_20Rnd_762x51_T_HK417";
_unit addMagazine "ACE_20Rnd_762x51_T_HK417";

// PRIMARY WEAPON
_unit addWeapon "ACE_HK417_Eotech_4x";

// SECONDARY WEAPON MAGS / 8 slots
//_unit addMagazine "17Rnd_9x19_glock17";
//_unit addMagazine "17Rnd_9x19_glock17";
//_unit addMagazine "17Rnd_9x19_glock17";
//_unit addMagazine "17Rnd_9x19_glock17";
//_unit addMagazine "17Rnd_9x19_glock17";
//_unit addMagazine "17Rnd_9x19_glock17";
//_unit addMagazine "17Rnd_9x19_glock17";
//_unit addMagazine "17Rnd_9x19_glock17";

// SECONDARY WEAPON
_unit addWeapon "glock17_EP1";

// EQUIPMENT
_unit addWeapon "Binocular";
_unit addWeapon "NVGoggles";
_unit addWeapon "ACE_Earplugs";
_unit addWeapon "ItemGPS";

// RUCK
//_unit addWeapon "ACE_Backpack_US";


// DURCHLADEN
reload bbq1;

bbq3Weapons = weapons bbq1;
bbq3Magazines = magazines bbq1;
publicVariable "bbq1Weapons";
publicVariable "bbq1Magazines";




// 	AUTOMATIC RIFLEMAN bbq2
_unit = bbq2;

removeAllWeapons _unit;

// PRIMARY WEAPON MAGS / 12 slots (S) (zb stanag) / 6 slots (M) (zb betaC / smaw rocket)
_unit addMagazine "100Rnd_762x51_M240";
_unit addMagazine "100Rnd_762x51_M240";
_unit addMagazine "100Rnd_762x51_M240";
_unit addMagazine "100Rnd_762x51_M240";
_unit addMagazine "100Rnd_762x51_M240";
_unit addMagazine "100Rnd_762x51_M240";
_unit addMagazine "100Rnd_762x51_M240";
_unit addMagazine "100Rnd_762x51_M240";
_unit addMagazine "100Rnd_762x51_M240";
_unit addMagazine "100Rnd_762x51_M240";
_unit addMagazine "100Rnd_762x51_M240";
_unit addMagazine "100Rnd_762x51_M240";

// PRIMARY WEAPON
_unit addWeapon "Mk_48_DES_EP1";

// SECONDARY WEAPON MAGS / 8 slots
//_unit addMagazine "17Rnd_9x19_glock17";
//_unit addMagazine "17Rnd_9x19_glock17";
//_unit addMagazine "17Rnd_9x19_glock17";
//_unit addMagazine "17Rnd_9x19_glock17";

// SECONDARY WEAPON
_unit addWeapon "glock17_EP1";

// EQUIPMENT
_unit addWeapon "Binocular";
_unit addWeapon "NVGoggles";
_unit addWeapon "ACE_Earplugs";
_unit addWeapon "ItemGPS";

// RUCK
//_unit addWeapon "ACE_Backpack_US";

// DURCHLADEN
reload bbq2;

bbq2Weapons = weapons bbq2;
bbq2Magazines = magazines bbq2;
publicVariable "bbq2Weapons";
publicVariable "bbq2Magazines";



// 	RANGER bbq3
_unit = bbq3;

removeAllWeapons _unit;

// PRIMARY WEAPON MAGS / 12 slots (S) (zb stanag) / 6 slots (M) (zb betaC / smaw rocket)
_unit addMagazine "ACE_20Rnd_762x51_T_SCAR";
_unit addMagazine "ACE_20Rnd_762x51_T_SCAR";
_unit addMagazine "ACE_20Rnd_762x51_T_SCAR";
_unit addMagazine "ACE_20Rnd_762x51_T_SCAR";
_unit addMagazine "ACE_20Rnd_762x51_T_SCAR";
_unit addMagazine "ACE_20Rnd_762x51_T_SCAR";
_unit addMagazine "ACE_20Rnd_762x51_T_SCAR";
_unit addMagazine "ACE_20Rnd_762x51_T_SCAR";
_unit addMagazine "ACE_20Rnd_762x51_T_SCAR";
_unit addMagazine "ACE_20Rnd_762x51_T_SCAR";
_unit addMagazine "ACE_20Rnd_762x51_T_SCAR";
_unit addMagazine "ACE_20Rnd_762x51_T_SCAR";

// PRIMARY WEAPON
_unit addWeapon "SCAR_H_STD_EGLM_Spect";

// SECONDARY WEAPON MAGS / 8 slots
_unit addMagazine "1Rnd_HE_M203";
_unit addMagazine "1Rnd_HE_M203";
_unit addMagazine "1Rnd_HE_M203";
_unit addMagazine "1Rnd_HE_M203";
_unit addMagazine "1Rnd_HE_M203";
_unit addMagazine "1Rnd_HE_M203";
_unit addMagazine "1Rnd_HE_M203";
_unit addMagazine "1Rnd_HE_M203";

// SECONDARY WEAPON
//_unit addWeapon "glock17_EP1";

// EQUIPMENT
_unit addWeapon "Binocular";
_unit addWeapon "NVGoggles";
_unit addWeapon "ACE_Earplugs";
_unit addWeapon "ItemGPS";

// RUCK / LAUNCHER
//_unit addWeapon "SMAW";

// DURCHLADEN
reload bbq3;

bbq3Weapons = weapons bbq3;
bbq3Magazines = magazines bbq3;
publicVariable "bbq3Weapons";
publicVariable "bbq3Magazines";





// 	GRENADIER bbq4
_unit = bbq4;

removeAllWeapons _unit;

// PRIMARY WEAPON MAGS / 12 slots (S) (zb stanag) / 6 slots (M) (zb betaC / smaw rocket)
_unit addMagazine "ACE_20Rnd_762x51_T_SCAR";
_unit addMagazine "ACE_20Rnd_762x51_T_SCAR";
_unit addMagazine "ACE_20Rnd_762x51_T_SCAR";
_unit addMagazine "ACE_20Rnd_762x51_T_SCAR";
_unit addMagazine "ACE_20Rnd_762x51_T_SCAR";
_unit addMagazine "ACE_20Rnd_762x51_T_SCAR";
_unit addMagazine "ACE_20Rnd_762x51_T_SCAR";
_unit addMagazine "ACE_20Rnd_762x51_T_SCAR";
_unit addMagazine "ACE_20Rnd_762x51_T_SCAR";
_unit addMagazine "ACE_20Rnd_762x51_T_SCAR";
_unit addMagazine "ACE_20Rnd_762x51_T_SCAR";
_unit addMagazine "ACE_20Rnd_762x51_T_SCAR";

// PRIMARY WEAPON
_unit addWeapon "SCAR_H_STD_EGLM_Spect";

// SECONDARY WEAPON MAGS / 8 slots
_unit addMagazine "1Rnd_HE_M203";
_unit addMagazine "1Rnd_HE_M203";
_unit addMagazine "1Rnd_HE_M203";
_unit addMagazine "1Rnd_HE_M203";
_unit addMagazine "1Rnd_HE_M203";
_unit addMagazine "1Rnd_HE_M203";
_unit addMagazine "1Rnd_HE_M203";
_unit addMagazine "1Rnd_HE_M203";

// SECONDARY WEAPON
//_unit addWeapon "glock17_EP1";

// EQUIPMENT
_unit addWeapon "Binocular";
_unit addWeapon "NVGoggles";
_unit addWeapon "ACE_Earplugs";
_unit addWeapon "ItemGPS";

// RUCK / LAUNCHER
//_unit addWeapon "SMAW";

// DURCHLADEN
reload bbq4;

bbq4Weapons = weapons bbq4;
bbq4Magazines = magazines bbq4;
publicVariable "bbq4Weapons";
publicVariable "bbq4Magazines";

/////////////////////////////////////////////////
////////////////////////////////////////////////

publicVariable "bbq1";
publicVariable "bbq2";
publicVariable "bbq3";
publicVariable "bbq4";


{_x assignTeam "RED"} foreach [bbq1,bbq2,bbq3,bbq4];


{if (!isPlayer _x) then {doStop _x}} forEach units group player;

[0, {{_x addMPEventhandler ["MPKilled", "if (isServer) then {[_this select 0, _this select 1] spawn killDetector_compiled}"]} forEach units group bbq;}] call CBA_fnc_globalExecute;


gnrf_initCounter = gnrf_initCounter + 1;
publicVariable "gnrf_initCounter";

};

//Save loadout
player setVariable ["magazines", magazines player];
player setVariable ["weapons", weapons player];

// MOVE UNITS

{
 _spawnPos = ussChickenFucker modelToWorld [-2+(random 4),-2+(random 4),18];
 _x setPos _spawnPos;
} forEach units group player;


gnrf_respawnInfo = [];


//attach helper arrow
if ((paramsArray select 5) == 1) then 
{
	_dude = player;
	["gnrf_clientExecute", [_dude, "spawn", "grnf_helperArrow_fnc"]] call CBA_fnc_remoteEvent;
}; 

