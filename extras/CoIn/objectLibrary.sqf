waitUntil {alive player};
	
	
////// open / close library
	gnrf_openOL_act = player addAction [("<t color=""#A7D6D4"">" + ("Object Library") + "</t>"),"gen_action.sqf",[{

		gnrf_openOL = true;
	
	}],2,false,false,"","isNil 'gnrf_openOL'"];
	
	
	gnrf_closeOL_act = player addAction [("<t color=""#A7D6D4"">" + ("Exit Library") + "</t>"),"gen_action.sqf",[{

		gnrf_openOL = nil;
	
	}],2,false,false,"","(isNil 'gnrf_CoIn') AND (gnrf_openOL) AND (isNil 'gnrf_OLsubMenu')"];

////// close subMenus
	gnrf_closeOLSub_act = player addAction [("<t color=""#A7D6D4"">" + ("close") + "</t>"),"gen_action.sqf",[{

		gnrf_staticOL = nil;
		gnrf_fortOL = nil;
		gnrf_ammoOL = nil;
		gnrf_miscOL = nil;
		gnrf_OLsubMenu = nil;
	
	}],1,false,false,"","(isNil 'gnrf_CoIn') AND (gnrf_OLsubMenu)"];
	
////// previous object
	gnrf_OLprevObj_act = player addAction [("<t color=""#A7D6D4"">" + ("Previous Object") + "</t>"),"gen_action.sqf",[{

		_obj = gnrf_OLprevObj createVehicle (getPos player);
		[player, _obj] spawn gnrf_CoIn_fnc;
	
	}],2,false,false,"","(isNil 'gnrf_CoIn') AND (gnrf_openOL) AND (!isNil 'gnrf_OLprevObj')"];
	
	
////// open static weapons
	gnrf_StaticOL_act = player addAction [("<t color=""#74B0B0"">" + ("Static Weapons") + "</t>"),"gen_action.sqf",[{

		gnrf_staticOL = true;
		gnrf_OLsubMenu = true;
	
	}],2,false,false,"","(gnrf_openOL) AND (isNil 'gnrf_OLsubMenu')"];
	
	
////// staticWeapons
	gnrf_OLstaticClassAr = ["MK19_TriPod", "TOW_TriPod", "M2StaticMG", "Fort_Nest_M240", "ACE_M240_Tripod", "M119", "M252", "M2HD_mini_TriPod", "Stinger_Pod", "SearchLight", "ACE_BAF_GPMG_Minitripod_D", "BAF_GMG_Tripod_D", "BAF_GPMG_Minitripod_D", "BAF_L2A1_Minitripod_D", "BAF_L2A1_Tripod_D", "2b14_82mm_TK_EP1", "ACE_Konkurs_TK", "AGS_TK_EP1", "D30_TK_EP1", "Igla_AA_pod_TK_EP1", "KORD_TK_EP1", "KORD_high_TK_EP1", "Metis_TK_EP1", "SearchLight_TK_EP1", "DSHKM_Ins", "DSHkM_Mini_TriPod", "SPG9_Ins", "ZU23_TK_EP1"];
	
	for "_i" from 0 to (count gnrf_OLstaticClassAr)-1 do {
	
		_class = gnrf_OLstaticClassAr select _i;
		_dynStaticName = getText (configFile >> "cfgVehicles" >> _class >> "displayName");
		gnrf_OLstaticCnt = _i;
		call compile format ["
		_dynStatic_act = player addAction [('<t color=''#74B0B0''>' + _dynStaticName + '</t>'),'gen_action.sqf',[{
			
			_class = gnrf_OLstaticClassAr select %1;
			_dynStaticObj = _class createVehicle (getPos player);
			[player, _dynStaticObj] spawn gnrf_CoIn_fnc;
			gnrf_OLprevObj = _class;
	
		}],1,false,true,'','(isNil ''gnrf_CoIn'') AND (gnrf_staticOL) AND (isNil ''gnrf_FortOL'') AND (isNil ''gnrf_miscOL'') AND (isNil ''gnrf_ammoOL'')'];
		", gnrf_OLstaticCnt];
		
	};
	
	
////// open fortifications 
	gnrf_fortOL_act = player addAction [("<t color=""#74B0B0"">" + ("Fortifications") + "</t>"),"gen_action.sqf",[{

		gnrf_fortOL = true;
		gnrf_OLsubMenu = true;
		
	}],2,false,false,"","(gnrf_openOL) AND (isNil 'gnrf_OLsubMenu')"];
	
	
////// fortifications
	gnrf_OLFortClassAr = ["Land_BagFenceLong", "Land_BagFenceShort", "Land_BagFenceCorner", "Land_BagFenceRound", "Land_BagFenceEnd", "Land_fort_bagfence_long", "Land_fort_bagfence_corner", "Land_fort_bagfence_round", "Land_HBarrier1", "Land_HBarrier3", "Land_HBarrier5", "Land_HBarrier_large", "Fort_EnvelopeBig_EP1", "Fort_EnvelopeSmall_EP1", "Land_fort_rampart_EP1", "Land_BarGate2", "Concrete_Wall_EP1", "Fort_Barracks_USMC", "Fort_Barricade_EP1", "Fort_RazorWire", "Hedgehog_EP1", "Hhedgehog_concrete", "Hhedgehog_concreteBig", "Land_fort_artillery_nest_EP1", "Land_Fort_Watchtower_EP1", "Land_fortified_nest_big_EP1", "Land_fortified_nest_small_EP1"];
	
	for "_i" from 0 to (count gnrf_OLFortClassAr)-1 do {
		
		_class = gnrf_OLFortClassAr select _i;
		_dynFortName = getText (configFile >> "cfgVehicles" >> _class >> "displayName");
		gnrf_OLFortCnt = _i;
		call compile format ["
		_dynFort_act = player addAction [('<t color=''#74B0B0''>' + _dynFortName + '</t>'),'gen_action.sqf',[{
			
			_class = gnrf_OLFortClassAr select %1;
			_dynFortObj = _class createVehicle (getPos player);
			[player, _dynFortObj] spawn gnrf_CoIn_fnc;
			gnrf_OLprevObj = _class;
			
		}],1,false,true,'','(isNil ''gnrf_CoIn'') AND (isNil ''gnrf_staticOL'') AND (isNil ''gnrf_miscOL'') AND (isNil ''gnrf_ammoOL'') AND (gnrf_FortOL)'];
		", gnrf_OLFortCnt];		
	};
	

////// open misc objects 
	gnrf_miscOL_act = player addAction [("<t color=""#74B0B0"">" + ("Miscellaneous") + "</t>"),"gen_action.sqf",[{

		gnrf_miscOL = true;
		gnrf_OLsubMenu = true;
		
	}],2,false,false,"","(gnrf_openOL) AND (isNil 'gnrf_OLsubMenu')"];
	
	
////// misc objects
	gnrf_OLMiscClassAr = ["Sign_sphere25cm_EP1", "76n6ClamShell_EP1", "Land_radar", "AmmoCrates_NoInteractive_Large", "AmmoCrates_NoInteractive_Medium", "AmmoCrates_NoInteractive_Small", "Camp_EP1", "CampEast_EP1", "Land_Antenna", "Land_CamoNet_NATO_EP1", "Land_CamoNet_EAST_EP1", "Land_CamoNetB_NATO_EP1", "Land_CamoNetB_EAST_EP1", "Land_CamoNetVar_NATO_EP1", "Land_CamoNetVar_EAST_EP1", "Land_GuardShed", "Land_Misc_Cargo1E_EP1", "MASH_EP1", "PowGen_Big_EP1", "FlagCarrierGermany_EP1", "FlagCarrierTakistan_EP1", "FlagCarrierUSArmy_EP1", "HeliH", "Land_Ind_IlluminantTower", "TargetPopUpTarget", "Land_IED_v1_PMC", "Land_IED_v2_PMC", "Land_IED_v3_PMC", "Land_IED_v4_PMC", "ZavoraAnim", "EvMoney", "Land_Fire_barrel_burning", "Land_Fire_burning", "FoldChair", "FoldTable", "Land_Chest_EP1", "Land_Teapot_EP1", "Land_Water_pipe_EP1", "Body", "GraveCross2_EP1", "GraveCrossHelmet_EP1", "Hanged", "Hanged_MD", "Land_Church_tomb_1", "Mass_grave", "Misc_concrete_High", "Land_Toilet", "Land_loco_742_red", "HumpsDirt", "Land_Dirthump01_EP1", "Land_ConcreteBlock", "RampConcrete", "Land_ConcreteRamp", "Cow04", "WildBoar", "Fin"];
	for "_i" from 0 to (count gnrf_OLMiscClassAr)-1 do {
		
		_class = gnrf_OLMiscClassAr select _i;
		_dynMiscName = getText (configFile >> "cfgVehicles" >> _class >> "displayName");
		gnrf_OLMiscCnt = _i;
		call compile format ["
		_dynMisc_act = player addAction [('<t color=''#74B0B0''>' + _dynMiscName + '</t>'),'gen_action.sqf',[{
			
			_class = gnrf_OLMiscClassAr select %1;
			_dynMiscObj = _class createVehicle (getPos player);
			[player, _dynMiscObj] spawn gnrf_CoIn_fnc;
			gnrf_OLprevObj = _class;
			
		}],1,false,true,'','(isNil ''gnrf_CoIn'') AND (isNil ''gnrf_staticOL'') AND (isNil ''gnrf_FortOL'') AND (isNil ''gnrf_ammoOL'') AND (gnrf_miscOL)'];
		", gnrf_OLMiscCnt];		
	};
	
	
////// open ammo  
	gnrf_ammoOL_act = player addAction [("<t color=""#74B0B0"">" + ("Ammunition") + "</t>"),"gen_action.sqf",[{

		gnrf_ammoOL = true;
		gnrf_OLsubMenu = true;
		
	}],2,false,false,"","(gnrf_openOL) AND (isNil 'gnrf_OLsubMenu')"];
	
	
////// ammo  
	gnrf_OLAmmoClassAr = ["USBasicAmmunitionBox_EP", "USBasicWeapons_EP1", "USLaunchers_EP1", "USOrdnanceBox_EP1", "USSpecialWeapons_EP1", "USSpecialWeaponsBox", "USVehicleBox", "USVehicleBox_EP1", "BAF_BasicAmmunitionBox", "BAF_BasicWeapons", "BAF_IEDBox", "BAF_Launchers", "BAF_OrdnanceBox", "BAF_VehicleBox", "TKBasicAmmunitionBox_EP1", "TKBasicWeapons_EP1", "TKLaunchers_EP1", "TKOrdnanceBox_EP1", "TKSpecialWeapons_EP1", "TKVehicleBox_EP1"];
	for "_i" from 0 to (count gnrf_OLAmmoClassAr)-1 do {
		
		_class = gnrf_OLAmmoClassAr select _i;
		_dynName = getText (configFile >> "cfgVehicles" >> _class >> "displayName");
		gnrf_OLAmmoCnt = _i;
		call compile format ["
		_dynAct = player addAction [('<t color=''#74B0B0''>' + _dynName + '</t>'),'gen_action.sqf',[{
			
			_class = gnrf_OLAmmoClassAr select %1;
			_dynObj = _class createVehicle (getPos player);
			[player, _dynObj] spawn gnrf_CoIn_fnc;
			gnrf_OLprevObj = _class;
			
		}],1,false,true,'','(isNil ''gnrf_CoIn'') AND (isNil ''gnrf_staticOL'') AND (isNil ''gnrf_FortOL'') AND (isNil ''gnrf_miscOL'') AND (gnrf_AmmoOL)'];
		", gnrf_OLAmmoCnt];		
	};
		

////// close subMenus
	gnrf_closeOLSub2_act = player addAction [("<t color=""#A7D6D4"">" + ("close") + "</t>"),"gen_action.sqf",[{

		gnrf_staticOL = nil;
		gnrf_fortOL = nil;
		gnrf_ammoOL = nil;
		gnrf_miscOL = nil;
		gnrf_OLsubMenu = nil;
	
	}],1,false,false,"","(isNil 'gnrf_CoIn') AND (gnrf_OLsubMenu)"];
	