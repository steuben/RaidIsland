
	opforTrashbin = [];
	publicVariable "opforTrashbin";
	
	// GROUP: MG/AT TEAM
	insGroup1a = createGroup EAST;

	"TK_INS_Soldier_TL_EP1" createUnit [[6579.44,1466.41,312.272], insGroup1a, "insGroup1a_1=this; opforTrashbin set [count opforTrashbin, this];", 1, "Major"];
	"TK_INS_Soldier_MG_EP1" createUnit [[6579.44,1466.41,312.272], insGroup1a, "insGroup1a_2=this; opforTrashbin set [count opforTrashbin, this];", 1, "Corporal"];
	"TK_INS_Soldier_MG_EP1" createUnit [[6579.44,1466.41,312.272], insGroup1a, "insGroup1a_3=this; opforTrashbin set [count opforTrashbin, this];", 0.7, "Private"];
	"TK_INS_Soldier_Sniper_EP1" createUnit [[6579.44,1466.41,312.272], insGroup1a, "insGroup1a_4=this; opforTrashbin set [count opforTrashbin, this];", 0.7, "Private"];
	"TK_INS_Soldier_AT_EP1" createUnit [[6579.44,1466.41,312.272], insGroup1a, "insGroup1a_5=this; opforTrashbin set [count opforTrashbin, this];", 1, "Private"];
	"TK_INS_Soldier_AT_EP1" createUnit [[6579.44,1466.41,312.272], insGroup1a, "insGroup1a_6=this; opforTrashbin set [count opforTrashbin, this];", 0.7, "Private"];

	
		// BEEF UP AT-SOLDIERS
	_unit = insGroup1a_5;
	removeAllWeapons _unit;

		// PRIMARY WEAPON MAGS / 12 slots (S) (zb stanag) / 6 slots (M) (zb betaC / smaw rocket)
	_unit addMagazine "ACE_75Rnd_545x39_T_RPK";
	_unit addMagazine "ACE_75Rnd_545x39_T_RPK";
	_unit addMagazine "ACE_75Rnd_545x39_T_RPK";
	_unit addMagazine "ACE_75Rnd_545x39_T_RPK";
	_unit addMagazine "ACE_75Rnd_545x39_T_RPK";
	_unit addMagazine "ACE_OG7_PGO7";
	_unit addMagazine "ACE_OG7_PGO7";
	_unit addMagazine "ACE_TBG7V_PGO7";

		// PRIMARY WEAPON
	_unit addWeapon "AK_74";

		// EQUIPMENT
	_unit addWeapon "Binocular";

		// RUCK / LAUNCHER
	_unit addWeapon "ACE_RPG7V_PGO7";


	_unit = insGroup1a_6;
	removeAllWeapons _unit;

		// PRIMARY WEAPON MAGS / 12 slots (S) (zb stanag) / 6 slots (M) (zb betaC / smaw rocket)
	_unit addMagazine "ACE_75Rnd_545x39_T_RPK";
	_unit addMagazine "ACE_75Rnd_545x39_T_RPK";
	_unit addMagazine "ACE_75Rnd_545x39_T_RPK";
	_unit addMagazine "ACE_75Rnd_545x39_T_RPK";
	_unit addMagazine "ACE_75Rnd_545x39_T_RPK";
	_unit addMagazine "ACE_OG7_PGO7";
	_unit addMagazine "ACE_OG7_PGO7";
	_unit addMagazine "ACE_TBG7V_PGO7";

		// PRIMARY WEAPON
	_unit addWeapon "ACE_RPK";

		// EQUIPMENT
	_unit addWeapon "Binocular";

		// RUCK / LAUNCHER
	_unit addWeapon "ACE_RPG7V_PGO7";

	_wp = insGroup1a addWaypoint [[6621.23,1459.99,313.186], 2];
	_wp setWaypointType "MOVE";
	_wp setWaypointFormation "LINE";
	_wp setWaypointBehaviour "COMBAT";
	_wp setWaypointSpeed "FULL";
	_wp setWaypointStatements ["true", ""];
	_wp setWaypointTimeout [0, 0, 0];

	
// GROUP: MG/AT TEAM
	insGroup1b = createGroup EAST;

	"TK_INS_Soldier_TL_EP1" createUnit [[6158.91,1719.04,347.018], insGroup1b, "insGroup1b_1=this; opforTrashbin set [count opforTrashbin, this];", 1, "Major"];
	"TK_INS_Soldier_MG_EP1" createUnit [[6158.91,1719.04,347.018], insGroup1b, "insGroup1b_2=this; opforTrashbin set [count opforTrashbin, this];", 1, "Corporal"];
	"TK_INS_Soldier_MG_EP1" createUnit [[6158.91,1719.04,347.018], insGroup1b, "insGroup1b_3=this; opforTrashbin set [count opforTrashbin, this];", 0.7, "Private"];
	"TK_INS_Soldier_Sniper_EP1" createUnit [[6158.91,1719.04,347.018], insGroup1b, "insGroup1b_4=this; opforTrashbin set [count opforTrashbin, this];", 0.7, "Private"];
	"TK_INS_Soldier_AT_EP1" createUnit [[6158.91,1719.04,347.018], insGroup1b, "insGroup1b_5=this; opforTrashbin set [count opforTrashbin, this];", 1, "Private"];
	"TK_INS_Soldier_AT_EP1" createUnit [[6158.91,1719.04,347.018], insGroup1b, "insGroup1b_6=this; opforTrashbin set [count opforTrashbin, this];", 0.7, "Private"];

	
		// BEEF UP AT-SOLDIERS
	_unit = insGroup1b_5;
	removeAllWeapons _unit;

		// PRIMARY WEAPON MAGS / 12 slots (S) (zb stanag) / 6 slots (M) (zb betaC / smaw rocket)
	_unit addMagazine "ACE_75Rnd_545x39_T_RPK";
	_unit addMagazine "ACE_75Rnd_545x39_T_RPK";
	_unit addMagazine "ACE_75Rnd_545x39_T_RPK";
	_unit addMagazine "ACE_75Rnd_545x39_T_RPK";
	_unit addMagazine "ACE_75Rnd_545x39_T_RPK";
	_unit addMagazine "ACE_OG7_PGO7";
	_unit addMagazine "ACE_OG7_PGO7";
	_unit addMagazine "ACE_TBG7V_PGO7";

		// PRIMARY WEAPON
	_unit addWeapon "AK_74";

		// EQUIPMENT
	_unit addWeapon "Binocular";

		// RUCK / LAUNCHER
	_unit addWeapon "ACE_RPG7V_PGO7";


	_unit = insGroup1b_6;
	removeAllWeapons _unit;

		// PRIMARY WEAPON MAGS / 12 slots (S) (zb stanag) / 6 slots (M) (zb betaC / smaw rocket)
	_unit addMagazine "ACE_75Rnd_545x39_T_RPK";
	_unit addMagazine "ACE_75Rnd_545x39_T_RPK";
	_unit addMagazine "ACE_75Rnd_545x39_T_RPK";
	_unit addMagazine "ACE_75Rnd_545x39_T_RPK";
	_unit addMagazine "ACE_75Rnd_545x39_T_RPK";
	_unit addMagazine "ACE_TBG7V_PGO7";
	_unit addMagazine "ACE_TBG7V_PGO7";
	_unit addMagazine "ACE_TBG7V_PGO7";

		// PRIMARY WEAPON
	_unit addWeapon "ACE_RPK";

		// EQUIPMENT
	_unit addWeapon "Binocular";

		// RUCK / LAUNCHER
	_unit addWeapon "ACE_RPG7V_PGO7";

	_wp = insGroup1b addWaypoint [[6644.3,1460.15,310.955], 2];
	_wp setWaypointType "MOVE";
	_wp setWaypointFormation "LINE";
	_wp setWaypointBehaviour "COMBAT";
	_wp setWaypointSpeed "FULL";
	_wp setWaypointStatements ["true", ""];
	_wp setWaypointTimeout [0, 0, 0];
	
	
	
	
	
	// GROUP: PATROL 1
	
	insGroup1c = createGroup EAST;

	"TK_INS_Soldier_TL_EP1" createUnit [[6017.84,1445.23,315.408], insGroup1c, "insGroup1c_1=this; opforTrashbin set [count opforTrashbin, this];", 1, "Major"];
	"TK_INS_Soldier_AR_EP1" createUnit [[6017.84,1445.23,315.408], insGroup1c, "insGroup1c_2=this; opforTrashbin set [count opforTrashbin, this];", 1, "Corporal"];
	"TK_INS_Soldier_AR_EP1" createUnit [[6017.84,1445.23,315.408], insGroup1c, "insGroup1c_3=this; opforTrashbin set [count opforTrashbin, this];", 0.7, "Private"];
	"TK_INS_Bonesetter_EP1" createUnit [[6017.84,1445.23,315.408], insGroup1c, "insGroup1c_4=this; opforTrashbin set [count opforTrashbin, this];", 0.7, "Private"];
	"TK_INS_Soldier_3_EP1" createUnit [[6017.84,1445.23,315.408], insGroup1c, "insGroup1c_5=this; opforTrashbin set [count opforTrashbin, this];", 1, "Private"];
	"ACE_TK_INS_Soldier_AKM_EP1" createUnit [[6017.84,1445.23,315.408], insGroup1c, "insGroup1c_6=this; opforTrashbin set [count opforTrashbin, this];", 0.7, "Private"];
	
	_wp = insGroup1c addWaypoint [[6106.76,1490.52,329.22], 2];
	_wp setWaypointType "MOVE";
	_wp setWaypointFormation "STAG COLUMN";
	_wp setWaypointBehaviour "SAFE";
	_wp setWaypointSpeed "LIMITED";
	_wp setWaypointStatements ["true", ""];
	_wp setWaypointTimeout [0, 0, 0];
	
	_wp = insGroup1c addWaypoint [[6211.84,1511.55,322.123], 2];
	_wp setWaypointType "MOVE";
	_wp setWaypointFormation "STAG COLUMN";
	_wp setWaypointBehaviour "SAFE";
	_wp setWaypointSpeed "LIMITED";
	_wp setWaypointStatements ["true", ""];
	_wp setWaypointTimeout [0, 0, 0];
	
	_wp = insGroup1c addWaypoint [[6304.8,1496.99,317.421], 2];
	_wp setWaypointType "MOVE";
	_wp setWaypointFormation "STAG COLUMN";
	_wp setWaypointBehaviour "SAFE";
	_wp setWaypointSpeed "LIMITED";
	_wp setWaypointStatements ["true", ""];
	_wp setWaypointTimeout [0, 0, 0];
	
	_wp = insGroup1c addWaypoint [[6384.83,1478.39,316.84], 2];
	_wp setWaypointType "MOVE";
	_wp setWaypointFormation "STAG COLUMN";
	_wp setWaypointBehaviour "SAFE";
	_wp setWaypointSpeed "LIMITED";
	_wp setWaypointStatements ["true", ""];
	_wp setWaypointTimeout [0, 0, 0];
		
	_wp = insGroup1c addWaypoint [[6478.6,1475.15,316.722], 2];
	_wp setWaypointType "MOVE";
	_wp setWaypointFormation "STAG COLUMN";
	_wp setWaypointBehaviour "SAFE";
	_wp setWaypointSpeed "LIMITED";
	_wp setWaypointStatements ["true", ""];
	_wp setWaypointTimeout [0, 0, 0];
				
	_wp = insGroup1c addWaypoint [[6334.71,1740.42,336.104], 2];
	_wp setWaypointType "MOVE";
	_wp setWaypointFormation "STAG COLUMN";
	_wp setWaypointBehaviour "SAFE";
	_wp setWaypointSpeed "LIMITED";
	_wp setWaypointStatements ["true", ""];
	_wp setWaypointTimeout [0, 0, 0];
		
	_wp = insGroup1c addWaypoint [[6091.4,1602.94,330.966], 2];
	_wp setWaypointType "MOVE";
	_wp setWaypointFormation "STAG COLUMN";
	_wp setWaypointBehaviour "SAFE";
	_wp setWaypointSpeed "LIMITED";
	_wp setWaypointStatements ["true", ""];
	_wp setWaypointTimeout [0, 0, 0];
		
	_wp = insGroup1c addWaypoint [[6282.17,1437.14,325.765], 2];
	_wp setWaypointType "CYCLE";
	_wp setWaypointFormation "STAG COLUMN";
	_wp setWaypointBehaviour "SAFE";
	_wp setWaypointSpeed "LIMITED";
	_wp setWaypointStatements ["true", ""];
	_wp setWaypointTimeout [0, 0, 0];
	
	
	
	
	// GROUP: PATROL 2
	
	insGroup1d = createGroup EAST;

	"TK_INS_Soldier_4_EP1" createUnit [[6101.8,1531.59,327.977], insGroup1d, "insGroup1d_1=this; opforTrashbin set [count opforTrashbin, this];", 1, "Major"];
	"TK_INS_Soldier_MG_EP1" createUnit [[6101.8,1531.59,327.977], insGroup1d, "insGroup1d_2=this; opforTrashbin set [count opforTrashbin, this];", 1, "Corporal"];
	"TK_INS_Soldier_AT_EP1" createUnit [[6101.8,1531.59,327.977], insGroup1d, "insGroup1d_3=this; opforTrashbin set [count opforTrashbin, this];", 1, "Private"];
	"TK_INS_Soldier_AT_EP1" createUnit [[6101.8,1531.59,327.977], insGroup1d, "insGroup1d_4=this; opforTrashbin set [count opforTrashbin, this];", 1, "Private"];
	
		// BEEF UP AT-SOLDIERS
	_unit = insGroup1d_3;
	removeAllWeapons _unit;

		// PRIMARY WEAPON MAGS / 12 slots (S) (zb stanag) / 6 slots (M) (zb betaC / smaw rocket)
	_unit addMagazine "ACE_75Rnd_545x39_T_RPK";
	_unit addMagazine "ACE_75Rnd_545x39_T_RPK";
	_unit addMagazine "ACE_75Rnd_545x39_T_RPK";
	_unit addMagazine "ACE_75Rnd_545x39_T_RPK";
	_unit addMagazine "ACE_75Rnd_545x39_T_RPK";
	_unit addMagazine "ACE_TBG7V_PGO7";
	_unit addMagazine "ACE_TBG7V_PGO7";
	_unit addMagazine "ACE_TBG7V_PGO7";

		// PRIMARY WEAPON
	_unit addWeapon "AK_74";

		// EQUIPMENT
	_unit addWeapon "Binocular";

		// RUCK / LAUNCHER
	_unit addWeapon "ACE_RPG7V_PGO7";


	_unit = insGroup1d_4;
	removeAllWeapons _unit;

		// PRIMARY WEAPON MAGS / 12 slots (S) (zb stanag) / 6 slots (M) (zb betaC / smaw rocket)
	_unit addMagazine "ACE_75Rnd_545x39_T_RPK";
	_unit addMagazine "ACE_75Rnd_545x39_T_RPK";
	_unit addMagazine "ACE_75Rnd_545x39_T_RPK";
	_unit addMagazine "ACE_75Rnd_545x39_T_RPK";
	_unit addMagazine "ACE_75Rnd_545x39_T_RPK";
	_unit addMagazine "ACE_OG7_PGO7";
	_unit addMagazine "ACE_OG7_PGO7";
	_unit addMagazine "ACE_TBG7V_PGO7";

		// PRIMARY WEAPON
	_unit addWeapon "ACE_RPK";

		// EQUIPMENT
	_unit addWeapon "Binocular";

		// RUCK / LAUNCHER
	_unit addWeapon "ACE_RPG7V_PGO7";
	
	
	_wp = insGroup1d addWaypoint [[6206.61,1415.79,334.237], 2];
	_wp setWaypointType "MOVE";
	_wp setWaypointFormation "STAG COLUMN";
	_wp setWaypointBehaviour "SAFE";
	_wp setWaypointSpeed "LIMITED";
	_wp setWaypointStatements ["true", ""];
	_wp setWaypointTimeout [0, 0, 0];
	
	_wp = insGroup1d addWaypoint [[6274.97,1361.98,337.891], 2];
	_wp setWaypointType "MOVE";
	_wp setWaypointFormation "STAG COLUMN";
	_wp setWaypointBehaviour "SAFE";
	_wp setWaypointSpeed "LIMITED";
	_wp setWaypointStatements ["true", ""];
	_wp setWaypointTimeout [0, 0, 0];
	
	_wp = insGroup1d addWaypoint [[6427.18,1371.1,332.711], 2];
	_wp setWaypointType "MOVE";
	_wp setWaypointFormation "STAG COLUMN";
	_wp setWaypointBehaviour "SAFE";
	_wp setWaypointSpeed "LIMITED";
	_wp setWaypointStatements ["true", ""];
	_wp setWaypointTimeout [0, 0, 0];
	
	_wp = insGroup1d addWaypoint [[6621.31,1672.02,318.031], 2];
	_wp setWaypointType "MOVE";
	_wp setWaypointFormation "STAG COLUMN";
	_wp setWaypointBehaviour "SAFE";
	_wp setWaypointSpeed "LIMITED";
	_wp setWaypointStatements ["true", ""];
	_wp setWaypointTimeout [0, 0, 0];
	
	_wp = insGroup1d addWaypoint [[6274.06,1742.23,343.524], 2];
	_wp setWaypointType "MOVE";
	_wp setWaypointFormation "STAG COLUMN";
	_wp setWaypointBehaviour "SAFE";
	_wp setWaypointSpeed "LIMITED";
	_wp setWaypointStatements ["true", ""];
	_wp setWaypointTimeout [0, 0, 0];
	
	_wp = insGroup1d addWaypoint [[6056.23,1604.54,331.503], 2];
	_wp setWaypointType "CYCLE";
	_wp setWaypointFormation "STAG COLUMN";
	_wp setWaypointBehaviour "SAFE";
	_wp setWaypointSpeed "LIMITED";
	_wp setWaypointStatements ["true", ""];
	_wp setWaypointTimeout [0, 0, 0];
	
	
	// GROUP: PATROL 3
	
	insGroup1e = createGroup EAST;

	"TK_INS_Soldier_4_EP1" createUnit [[6501,2073.61,350.307], insGroup1e, "insGroup1e_1=this; opforTrashbin set [count opforTrashbin, this];", 1, "Major"];
	"TK_INS_Soldier_MG_EP1" createUnit [[6501,2073.61,350.307], insGroup1e, "insGroup1e_2=this; opforTrashbin set [count opforTrashbin, this];", 1, "Corporal"];
	"TK_INS_Soldier_AT_EP1" createUnit [[6501,2073.61,350.307], insGroup1e, "insGroup1e_3=this; opforTrashbin set [count opforTrashbin, this];", 1, "Private"];
	"TK_INS_Soldier_AT_EP1" createUnit [[6501,2073.61,350.307], insGroup1e, "insGroup1e_4=this; opforTrashbin set [count opforTrashbin, this];", 1, "Private"];
	"TK_INS_Soldier_AT_EP1" createUnit [[6501,2073.61,350.307], insGroup1e, "insGroup1e_5=this; opforTrashbin set [count opforTrashbin, this];", 1, "Private"];
	
		// BEEF UP AT-SOLDIERS
	_unit = insGroup1e_3;
	removeAllWeapons _unit;

		// PRIMARY WEAPON MAGS / 12 slots (S) (zb stanag) / 6 slots (M) (zb betaC / smaw rocket)
	_unit addMagazine "ACE_75Rnd_545x39_T_RPK";
	_unit addMagazine "ACE_75Rnd_545x39_T_RPK";
	_unit addMagazine "ACE_75Rnd_545x39_T_RPK";
	_unit addMagazine "ACE_75Rnd_545x39_T_RPK";
	_unit addMagazine "ACE_75Rnd_545x39_T_RPK";
	_unit addMagazine "ACE_TBG7V_PGO7";
	_unit addMagazine "ACE_TBG7V_PGO7";
	_unit addMagazine "ACE_TBG7V_PGO7";

		// PRIMARY WEAPON
	_unit addWeapon "AK_74";

		// EQUIPMENT
	_unit addWeapon "Binocular";

		// RUCK / LAUNCHER
	_unit addWeapon "ACE_RPG7V_PGO7";


	_unit = insGroup1e_4;
	removeAllWeapons _unit;

		// PRIMARY WEAPON MAGS / 12 slots (S) (zb stanag) / 6 slots (M) (zb betaC / smaw rocket)
	_unit addMagazine "ACE_75Rnd_545x39_T_RPK";
	_unit addMagazine "ACE_75Rnd_545x39_T_RPK";
	_unit addMagazine "ACE_75Rnd_545x39_T_RPK";
	_unit addMagazine "ACE_75Rnd_545x39_T_RPK";
	_unit addMagazine "ACE_75Rnd_545x39_T_RPK";
	_unit addMagazine "ACE_OG7_PGO7";
	_unit addMagazine "ACE_OG7_PGO7";
	_unit addMagazine "ACE_TBG7V_PGO7";

		// PRIMARY WEAPON
	_unit addWeapon "ACE_RPK";

		// EQUIPMENT
	_unit addWeapon "Binocular";

		// RUCK / LAUNCHER
	_unit addWeapon "ACE_RPG7V_PGO7";
	
	_unit = insGroup1e_5;
	removeAllWeapons _unit;

		// PRIMARY WEAPON MAGS / 12 slots (S) (zb stanag) / 6 slots (M) (zb betaC / smaw rocket)
	_unit addMagazine "ACE_75Rnd_545x39_T_RPK";
	_unit addMagazine "ACE_75Rnd_545x39_T_RPK";
	_unit addMagazine "ACE_75Rnd_545x39_T_RPK";
	_unit addMagazine "ACE_75Rnd_545x39_T_RPK";
	_unit addMagazine "ACE_75Rnd_545x39_T_RPK";
	_unit addMagazine "ACE_OG7_PGO7";
	_unit addMagazine "ACE_OG7_PGO7";
	_unit addMagazine "ACE_TBG7V_PGO7";

		// PRIMARY WEAPON
	_unit addWeapon "ACE_RPK";

		// EQUIPMENT
	_unit addWeapon "Binocular";

		// RUCK / LAUNCHER
	_unit addWeapon "ACE_RPG7V_PGO7";
	
	
	_wp = insGroup1e addWaypoint [[6363.16,1663.01,324.528], 2];
	_wp setWaypointType "MOVE";
	_wp setWaypointFormation "STAG COLUMN";
	_wp setWaypointBehaviour "SAFE";
	_wp setWaypointSpeed "LIMITED";
	_wp setWaypointStatements ["true", ""];
	_wp setWaypointTimeout [0, 0, 0];
	
	_wp = insGroup1e addWaypoint [[6571.87,1536.26,306.765], 2];
	_wp setWaypointType "MOVE";
	_wp setWaypointFormation "STAG COLUMN";
	_wp setWaypointBehaviour "SAFE";
	_wp setWaypointSpeed "LIMITED";
	_wp setWaypointStatements ["true", ""];
	_wp setWaypointTimeout [0, 0, 0];
	
	_wp = insGroup1e addWaypoint [[6743.22,1400.4,285.833], 2];
	_wp setWaypointType "MOVE";
	_wp setWaypointFormation "STAG COLUMN";
	_wp setWaypointBehaviour "SAFE";
	_wp setWaypointSpeed "LIMITED";
	_wp setWaypointStatements ["true", ""];
	_wp setWaypointTimeout [0, 0, 0];
	
	_wp = insGroup1e addWaypoint [[6793.34,1604.65,308.743], 2];
	_wp setWaypointType "MOVE";
	_wp setWaypointFormation "STAG COLUMN";
	_wp setWaypointBehaviour "SAFE";
	_wp setWaypointSpeed "LIMITED";
	_wp setWaypointStatements ["true", ""];
	_wp setWaypointTimeout [0, 0, 0];

	_wp = insGroup1e addWaypoint [[6278.39,1533.53,319.603], 2];
	_wp setWaypointType "CYCLE";
	_wp setWaypointFormation "STAG COLUMN";
	_wp setWaypointBehaviour "SAFE";
	_wp setWaypointSpeed "LIMITED";
	_wp setWaypointStatements ["true", ""];
	_wp setWaypointTimeout [0, 0, 0];	
	
	
	// GROUP: PATROL 4
	
	insGroup1f = createGroup EAST;

	"TK_INS_Soldier_4_EP1" createUnit [[6101.8,1531.59,327.977], insGroup1f, "insGroup1f_1=this; opforTrashbin set [count opforTrashbin, this];", 1, "Major"];
	"TK_INS_Soldier_MG_EP1" createUnit [[6101.8,1531.59,327.977], insGroup1f, "insGroup1f_2=this; opforTrashbin set [count opforTrashbin, this];", 1, "Corporal"];
	"TK_INS_Soldier_AT_EP1" createUnit [[6101.8,1531.59,327.977], insGroup1f, "insGroup1f_3=this; opforTrashbin set [count opforTrashbin, this];", 1, "Private"];
	"TK_INS_Soldier_AT_EP1" createUnit [[6101.8,1531.59,327.977], insGroup1f, "insGroup1f_4=this; opforTrashbin set [count opforTrashbin, this];", 1, "Private"];
	
		// BEEF UP AT-SOLDIERS
	_unit = insGroup1f_3;
	removeAllWeapons _unit;

		// PRIMARY WEAPON MAGS / 12 slots (S) (zb stanag) / 6 slots (M) (zb betaC / smaw rocket)
	_unit addMagazine "ACE_75Rnd_545x39_T_RPK";
	_unit addMagazine "ACE_75Rnd_545x39_T_RPK";
	_unit addMagazine "ACE_75Rnd_545x39_T_RPK";
	_unit addMagazine "ACE_75Rnd_545x39_T_RPK";
	_unit addMagazine "ACE_75Rnd_545x39_T_RPK";
	_unit addMagazine "ACE_TBG7V_PGO7";
	_unit addMagazine "ACE_TBG7V_PGO7";
	_unit addMagazine "ACE_TBG7V_PGO7";

		// PRIMARY WEAPON
	_unit addWeapon "AK_74";

		// EQUIPMENT
	_unit addWeapon "Binocular";

		// RUCK / LAUNCHER
	_unit addWeapon "ACE_RPG7V_PGO7";


	_unit = insGroup1f_4;
	removeAllWeapons _unit;

		// PRIMARY WEAPON MAGS / 12 slots (S) (zb stanag) / 6 slots (M) (zb betaC / smaw rocket)
	_unit addMagazine "ACE_75Rnd_545x39_T_RPK";
	_unit addMagazine "ACE_75Rnd_545x39_T_RPK";
	_unit addMagazine "ACE_75Rnd_545x39_T_RPK";
	_unit addMagazine "ACE_75Rnd_545x39_T_RPK";
	_unit addMagazine "ACE_75Rnd_545x39_T_RPK";
	_unit addMagazine "ACE_OG7_PGO7";
	_unit addMagazine "ACE_OG7_PGO7";
	_unit addMagazine "ACE_TBG7V_PGO7";

		// PRIMARY WEAPON
	_unit addWeapon "ACE_RPK";

		// EQUIPMENT
	_unit addWeapon "Binocular";

		// RUCK / LAUNCHER
	_unit addWeapon "ACE_RPG7V_PGO7";
	
	
	_wp = insGroup1f addWaypoint [[6206.61,1415.79,334.237], 2];
	_wp setWaypointType "MOVE";
	_wp setWaypointFormation "STAG COLUMN";
	_wp setWaypointBehaviour "SAFE";
	_wp setWaypointSpeed "LIMITED";
	_wp setWaypointStatements ["true", ""];
	_wp setWaypointTimeout [0, 0, 0];
	
	_wp = insGroup1f addWaypoint [[6274.97,1361.98,337.891], 2];
	_wp setWaypointType "MOVE";
	_wp setWaypointFormation "STAG COLUMN";
	_wp setWaypointBehaviour "SAFE";
	_wp setWaypointSpeed "LIMITED";
	_wp setWaypointStatements ["true", ""];
	_wp setWaypointTimeout [0, 0, 0];
	
	_wp = insGroup1f addWaypoint [[6427.18,1371.1,332.711], 2];
	_wp setWaypointType "MOVE";
	_wp setWaypointFormation "STAG COLUMN";
	_wp setWaypointBehaviour "SAFE";
	_wp setWaypointSpeed "LIMITED";
	_wp setWaypointStatements ["true", ""];
	_wp setWaypointTimeout [0, 0, 0];
	
	_wp = insGroup1f addWaypoint [[6621.31,1672.02,318.031], 2];
	_wp setWaypointType "MOVE";
	_wp setWaypointFormation "STAG COLUMN";
	_wp setWaypointBehaviour "SAFE";
	_wp setWaypointSpeed "LIMITED";
	_wp setWaypointStatements ["true", ""];
	_wp setWaypointTimeout [0, 0, 0];
	
	_wp = insGroup1f addWaypoint [[6274.06,1742.23,343.524], 2];
	_wp setWaypointType "MOVE";
	_wp setWaypointFormation "STAG COLUMN";
	_wp setWaypointBehaviour "SAFE";
	_wp setWaypointSpeed "LIMITED";
	_wp setWaypointStatements ["true", ""];
	_wp setWaypointTimeout [0, 0, 0];
	
	_wp = insGroup1f addWaypoint [[6056.23,1604.54,331.503], 2];
	_wp setWaypointType "CYCLE";
	_wp setWaypointFormation "STAG COLUMN";
	_wp setWaypointBehaviour "SAFE";
	_wp setWaypointSpeed "LIMITED";
	_wp setWaypointStatements ["true", ""];
	_wp setWaypointTimeout [0, 0, 0];


	{_x addMPEventhandler ["MPKilled", "if (isServer) then {_this select 0 removeAllEventHandlers 'MPkilled'; [_this select 0, _this select 1] spawn killDetector_compiled}"];} forEach opforTrashbin;
	
	objective1Ready = true;
	publicVariable "objective1Ready";
	
