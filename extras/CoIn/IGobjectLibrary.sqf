waitUntil {alive player};
	
////// close subMenus
	gnrf_closeOLSub_act = player addAction [("<t color=""#A7D6D4"">" + ("close") + "</t>"),"gen_action.sqf",[{

		gnrf_staticOL = nil;
		gnrf_fortOL = nil;
		gnrf_ammoOL = nil;
		gnrf_OLsubMenu = nil;
	
	}],1,false,false,"","(isNil 'gnrf_CoInMove') AND (gnrf_OLsubMenu) AND (gnrf_coInInRange)"];
	
////// previous object
	gnrf_OLprevObj_act = player addAction [("<t color=""#A7D6D4"">" + ("Previous Object") + "</t>"),"gen_action.sqf",[{
		
		_class = gnrf_OLprevObj;
		_preview = getText (configFile >> "CfgVehicles" >> _class >> "ghostpreview");
		_pos = screenToWorld [0.5,0.5];
		
		if ((_preview == "Land_HBarrier_largePreview") AND (_class != "Land_HBarrier_large")) then {_preview = ""};
			
		if (_preview != "") then {
		
			_obj = _preview createVehicle _pos;		
			_obj setVariable ["class", _class];	
			_obj setVariable ["previewClass", _preview];
			[player, _obj] spawn gnrf_CoInMove_fnc;
			
		} else {
		
			_obj = _class createVehicle _pos;
			_obj setVariable ["class", _class];	
			[player, _obj] spawn gnrf_CoInMove_fnc;
		};
	
	}],2,false,false,"","(isNil 'gnrf_CoInMove') AND (!isNil 'gnrf_OLprevObj') AND (gnrf_coInInRange)"];
	
	
////// open static weapons
	gnrf_StaticOL_act = player addAction [("<t color=""#74B0B0"">" + ("Static Weapons") + "</t>"),"gen_action.sqf",[{

		gnrf_staticOL = true;
		gnrf_OLsubMenu = true;
	
	}],2,false,false,"","(isNil 'gnrf_OLsubMenu') AND (gnrf_coInInRange)"];
	
	
////// staticWeapons
	gnrf_OLstaticClassAr = ["MK19_TriPod", "TOW_TriPod", "M2StaticMG", "Fort_Nest_M240", "ACE_M240_Tripod", "M119", "M252", "M2HD_mini_TriPod", "Stinger_Pod", "ACE_BAF_GPMG_Minitripod_D", "BAF_GMG_Tripod_D", "BAF_GPMG_Minitripod_D", "BAF_L2A1_Minitripod_D", "BAF_L2A1_Tripod_D", "SearchLight"];
	
	for "_i" from 0 to (count gnrf_OLstaticClassAr)-1 do {
	
		_class = gnrf_OLstaticClassAr select _i;
		_dynStaticName = getText (configFile >> "cfgVehicles" >> _class >> "displayName");
		gnrf_OLstaticCnt = _i;
		
		call compile format ["
		gnrf_dynStatic_act%1 = player addAction [('<t color=''#74B0B0''>' + _dynStaticName + '</t>'),'gen_action.sqf',[{
		
			_class = gnrf_OLstaticClassAr select %1;
			_preview = getText (configFile >> 'CfgVehicles' >> _class >> 'ghostpreview');
			_pos = screenToWorld [0.5,0.5];
		
			if (_preview != '') then {

				_dynObj = _preview createVehicle _pos;		
				gnrf_OLprevObj = _class;
				_dynObj setVariable ['class', _class];
				_dynObj setVariable ['previewClass', _preview];
				[player, _dynObj] spawn gnrf_CoInMove_fnc;
			
			} else {
						
				_dynObj = _class createVehicle _pos;
				gnrf_OLprevObj = _class;
				_dynObj setVariable ['class', _class];
				[player, _dynObj] spawn gnrf_CoInMove_fnc;
			};
	
		}],1,false,true,'','(isNil ''gnrf_CoInMove'') AND (gnrf_staticOL) AND (isNil ''gnrf_FortOL'') AND (isNil ''gnrf_ammoOL'') AND (gnrf_coInInRange)'];
		", gnrf_OLstaticCnt];
		
	};
	
	
////// open fortifications 
	gnrf_fortOL_act = player addAction [("<t color=""#74B0B0"">" + ("Fortifications") + "</t>"),"gen_action.sqf",[{

		gnrf_fortOL = true;
		gnrf_OLsubMenu = true;
		
	}],2,false,false,"","(isNil 'gnrf_OLsubMenu') AND (gnrf_coInInRange)"];
	
	
////// fortifications
	gnrf_OLFortClassAr = ["Land_fort_bagfence_long", "Land_fort_bagfence_corner", "Land_fort_bagfence_round", "Land_HBarrier1", "Land_HBarrier3", "Land_HBarrier5", "MASH_EP1", "Fort_EnvelopeSmall_EP1", "Fort_RazorWire", "Hedgehog_EP1"];

	for "_i" from 0 to (count gnrf_OLFortClassAr)-1 do {
		
		_class = gnrf_OLFortClassAr select _i;
		_dynFortName = getText (configFile >> "cfgVehicles" >> _class >> "displayName");
		gnrf_OLFortCnt = _i;
		
		call compile format ["
		gnrf_dynFort_act%1 = player addAction [('<t color=''#74B0B0''>' + _dynFortName + '</t>'),'gen_action.sqf',[{
			
			_class = gnrf_OLFortClassAr select %1;
			_preview = getText (configFile >> 'CfgVehicles' >> _class >> 'ghostpreview');
			_pos = screenToWorld [0.5,0.5];
			
			if ((_preview == 'Land_HBarrier_largePreview') AND (_class != 'Land_HBarrier_large')) then {_preview = ''};
			
			if (_preview != '') then {

				_dynObj = _preview createVehicle _pos;		
				gnrf_OLprevObj = _class;
				_dynObj setVariable ['class', _class];	
				_dynObj setVariable ['previewClass', _preview];
				[player, _dynObj] spawn gnrf_CoInMove_fnc;
			
			} else {
			
				_dynObj = _class createVehicle _pos;
				gnrf_OLprevObj = _class;
				_dynObj setVariable ['class', _class];
				[player, _dynObj] spawn gnrf_CoInMove_fnc;
			};
			
		}],1,false,true,'','(isNil ''gnrf_CoInMove'') AND (isNil ''gnrf_staticOL'') AND (isNil ''gnrf_ammoOL'') AND (gnrf_FortOL) AND (gnrf_coInInRange)'];
		", gnrf_OLFortCnt];		
	};
	

////// open ammo  
	gnrf_ammoOL_act = player addAction [("<t color=""#74B0B0"">" + ("Ammunition") + "</t>"),"gen_action.sqf",[{

		gnrf_ammoOL = true;
		gnrf_OLsubMenu = true;
		
	}],2,false,false,"","(isNil 'gnrf_OLsubMenu') AND (gnrf_coInInRange)"];
	
	
////// ammo  
	gnrf_OLAmmoClassAr = ["USBasicAmmunitionBox_EP1", "USBasicWeapons_EP1", "USLaunchers_EP1", "USOrdnanceBox_EP1", "USSpecialWeapons_EP1", "BAF_BasicAmmunitionBox", "BAF_BasicWeapons", "BAF_IEDBox", "BAF_Launchers", "BAF_OrdnanceBox"];
	for "_i" from 0 to (count gnrf_OLAmmoClassAr)-1 do {
		
		_class = gnrf_OLAmmoClassAr select _i;
		_dynName = getText (configFile >> "cfgVehicles" >> _class >> "displayName");
		gnrf_OLAmmoCnt = _i;
		call compile format ["
		gnrf_dynAmmo_act%1 = player addAction [('<t color=''#74B0B0''>' + _dynName + '</t>'),'gen_action.sqf',[{
			
			_class = gnrf_OLAmmoClassAr select %1;
			_dynObj = _class createVehicle (getPos player);
			gnrf_OLprevObj = _class;
			_dynObj setVariable ['class', _class];
			[player, _dynObj] spawn gnrf_CoInMove_fnc;
			
		}],1,false,true,'','(isNil ''gnrf_CoInMove'') AND (isNil ''gnrf_staticOL'') AND (isNil ''gnrf_FortOL'') AND (gnrf_AmmoOL) AND (gnrf_coInInRange)'];
		", gnrf_OLAmmoCnt];		
	};
		

////// close subMenus
	gnrf_closeOLSub2_act = player addAction [("<t color=""#A7D6D4"">" + ("close") + "</t>"),"gen_action.sqf",[{

		gnrf_staticOL = nil;
		gnrf_fortOL = nil;
		gnrf_ammoOL = nil;
		gnrf_OLsubMenu = nil;
	
	}],1,false,false,"","(isNil 'gnrf_CoInMove') AND (gnrf_OLsubMenu) AND (gnrf_coInInRange)"];
	