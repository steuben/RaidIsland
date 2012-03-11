
Support_MAINMENU set [4, ["CoIn", [5], "", -5, [["expression", "[] execVM 'extras\CoIn\ingameCoIn.sqf';"]], "1", "0"]];

gnrf_CoIn = true;
gnrf_CoInObjArray = [];
gnrf_CoInPrevDir = 0;
if (isNil "gnrf_CoInMyObj") then {gnrf_CoInMyObj = []};
gnrf_coInInRange = true;
gnrf_coInHolder = utilityVictor;

////move action	
		
	gnrf_CoInMove_act = player addAction [("<t color=""#FEDC7D"">" + ("Reposition Target") + "</t>"),"gen_action.sqf",[{
		
		gnrf_CoInObjArray = gnrf_CoInObjArray - [cursorTarget];
		gnrf_CoInIsCursorTarget = true;
		[player, ""] spawn gnrf_CoInMove_fnc;
		
	}],3,false,false,"","(isNil 'gnrf_CoInMove') AND (!isNull cursorTarget) AND (cursorTarget in gnrf_CoInMyObj) AND (gnrf_coInInRange)"];
	
	
////delete action	
	gnrf_CoInDelete_act = player addAction [("<t color=""#FEDC7D"">" + ("Deconstruct Target") + "</t>"),"gen_action.sqf",[{
		
		_target = cursorTarget;
		gnrf_CoInObjArray = gnrf_CoInObjArray - [_target];
		gnrf_CoInMyObj = gnrf_CoInMyObj - [_target];
		if (typeOf _target == "MASH_EP1") then {gnrf_respawnInfo = gnrf_respawnInfo - [_target, 0]; publicVariable "gnrf_respawnInfo"};
		deleteVehicle cursorTarget;
				
	}],3,false,false,"","(isNil 'gnrf_CoInMove') AND (!isNull cursorTarget) AND (cursorTarget in gnrf_CoInMyObj) AND (gnrf_coInInRange)"];
	
	
////cancel action
	gnrf_cancelCoIn_act = player addAction [("<t color=""#FEDC7D"">" + ("Cancel") + "</t>"),"gen_action.sqf",[{

		deleteVehicle gnrf_CoInTarget; 
		gnrf_CoInMove = nil;
		deleteVehicle gnrf_CoInMoveH;
		gnrf_CoInMoveH = nil;
		
	}],3,false,false,"","(gnrf_CoInMove) AND (isNil 'gnrf_CoInIsCursorTarget')"];

		
////placeObjAction
	gnrf_CoInAddObj_act = player addAction [("<t color=""#FEDC7D"">" + ("Place Object") + "</t>"),"gen_action.sqf",[{

		gnrf_CoInMove = nil;
		
		_target = gnrf_CoInTarget;
		_class = _target getVariable "class";
		_preview = _target getVariable "previewClass";
		if (!isNil "_preview") then {
				
			_pos = getPosASL _target;
			_dir = getDir _target;
			_vec = vectorUp _target;
			deleteVehicle _target;
			_target = _class createVehicle _pos;
			_target setPosASL _pos;
			_target setDir _dir;
			_target setVectorUp _vec;
			_target setVariable ["class", _class];
			_target setVariable ["previewClass", _preview];
		};

		_target setVariable ["owner", player, true];
		_target setVariable ["ownerName", name player, true];
		
		if (_class isKindOf "staticWeapon") then {
		
			_mag = (getArray (configFile >> "CfgVehicles" >> _class >> "Turrets" >> "MainTurret" >> "magazines")) select 0;
			_target setVehicleAmmo 0;
			{_target addMagazine _mag} forEach [1,2,3,4];
		};
		
		if (_class == "MASH_EP1") then {
			gnrf_respawnInfo set [count gnrf_respawnInfo, [_target, 0]];
			publicVariable "gnrf_respawnInfo";	
		};
		
		if (isNil "gnrf_CoInIsCursorTarget") then {gnrf_CoInMyObj set [count gnrf_CoInMyObj, _target]};			
		gnrf_CoInObjArray set [count gnrf_CoInObjArray, _target];
		gnrf_CoInPrevDir = getDir _target;
		deleteVehicle gnrf_CoInMoveH;
		gnrf_CoInMoveH = nil;
		gnrf_CoInIsCursorTarget = nil;
				
	}],3,false,false,"","(gnrf_CoInMove) AND (!gnrf_CoInTooFar) AND (gnrf_coInInRange)"];


	
////exitCoIn action
	gnrf_exitCoIn_act = player addAction [("<t color=""#FEDC7D"">" + ("Exit Contruction Mode") + "</t>"),"gen_action.sqf",[{
				
		gnrf_CoIn = nil;
				
		player removeAction gnrf_CoInMove_act;
		player removeAction gnrf_CoInDelete_act;
		player removeAction gnrf_cancelCoIn_act;
		player removeAction gnrf_CoInAddObj_act;
		player removeAction gnrf_exitCoIn_act;
		
		player removeAction gnrf_closeOLSub_act;
		player removeAction gnrf_OLprevObj_act;
		player removeAction gnrf_StaticOL_act;
		player removeAction gnrf_fortOL_act;
		player removeAction gnrf_ammoOL_act;
		player removeAction gnrf_closeOLSub2_act;
		
		for "_i" from 0 to gnrf_OLstaticCnt do {call compile format ["player removeAction gnrf_dynStatic_act%1", _i]};
		for "_i" from 0 to gnrf_OLFortCnt do {call compile format ["player removeAction gnrf_dynFort_act%1", _i]};
		for "_i" from 0 to gnrf_OLAmmoCnt do {call compile format ["player removeAction gnrf_dynAmmo_act%1", _i]};
		
		Support_MAINMENU set [4, ["CoIn", [5], "", -5, [["expression", "[] execVM 'extras\CoIn\ingameCoIn.sqf';"]], "1", "1"]];
		
	}],3,false,false,"","isNil 'gnrf_CoInMove'"];



//////grabFunction
gnrf_CoInMove_fnc = {
	
	gnrf_CoInMove = true; 
	private ["_target", "_disMin"];
	_target = _this select 1;
	
	if  (!isNil "gnrf_CoInIsCursorTarget") then {_target = cursorTarget};
		
	gnrf_CoInZAxis = (getPos _target) select 2;
	
	gnrf_CoInMoveH = createVehicle ["HeliHEmpty", [0,0,5000], [], 0, ""];
	gnrf_CoInMoveH setPos getPos _target;
	gnrf_CoInMoveH setDir getDir _target;
	
	_x = getPos _target select 0;
	_y = getPos _target select 1;
	_z = getPos _target select 2;
	
	_target attachTo [gnrf_CoInMoveH];
	
	_fixX = (getpos _target select 0) - _x;
	_fixY = (getpos _target select 1) - _y;	
	_fixZ = (getpos _target select 2) - _z;	
	_target setPos [(_x - _fixX), (_y - _fixY), (_z - _fixZ)];	
	
	_target setDir gnrf_CoInPrevDir;
	
	waitUntil {!(isNull (findDisplay 46))};
	gnrf_CoInTarget = _target;
	gnrf_CoInKeys_EH = (findDisplay 46) displayAddEventHandler ["keyDown", "[_this, gnrf_CoInTarget] call gnrf_CoInKeys_fnc"];
	
	
	while {(!isNil "gnrf_CoInMove") AND (alive player)} do {
		
		_dis = [player, _target] call BIS_fnc_distance2D;
		
		if (_dis > 300) then {gnrf_CoInZAxis = 5000; gnrf_CoInTooFar = true;} else {gnrf_CoInZAxis = 0; gnrf_CoInTooFar = false;};
		
		_pos = screenToWorld [0.5,0.5];
		gnrf_CoInMoveH setPos [_pos select 0, _pos select 1, gnrf_CoInZAxis];
		_target setPos [(getPos gnrf_CoInMoveH) select 0, (getPos gnrf_CoInMoveH) select 1, gnrf_CoInZAxis];
				
		sleep 0.02;
	};
	
	if (!isNil "gnrf_CoInKeys_EH") then {(findDisplay 46) displayRemoveEventHandler ["KeyDown", gnrf_CoInKeys_EH]; gnrf_CoInKeys_EH = nil};
	gnrf_CoInZAxis = nil;
};

gnrf_CoInKeys_fnc = {
	
	private["_handled", "_dikCode", "_shift", "_ctrlKey", "_alt", "_pos"];
	_ehArgs = _this select 0;
	_obj = _this select 1;
	_dikCode = _ehArgs select 1;
	_shift = _ehArgs select 2;
	_ctrlKey = _ehArgs select 3;
	_alt = _ehArgs select 4;  
	_handled = false;

	if (!_shift && !_ctrlKey && !_alt) then  {
	
		if (_dikCode == 75) then {	
			detach gnrf_CoInTarget;
			gnrf_CoInMoveH setDir (getDir gnrf_CoInMoveH)-3;
			gnrf_CoInTarget setDir (getDir gnrf_CoInTarget)-3;
			gnrf_CoInMoveH setPos [(getPos gnrf_CoInTarget) select 0, (getPos gnrf_CoInTarget) select 1, -1000];
			gnrf_CoInTarget attachTo [gnrf_CoInMoveH];
	  		_handled = true;
		};
		
		if (_dikCode == 77) then {			
			detach gnrf_CoInTarget;
			gnrf_CoInMoveH setDir (getDir gnrf_CoInMoveH)+3;
	  		gnrf_CoInTarget setDir (getDir gnrf_CoInTarget)+3;
			gnrf_CoInMoveH setPos [(getPos gnrf_CoInTarget) select 0, (getPos gnrf_CoInTarget) select 1, -1000];
			gnrf_CoInTarget attachTo [gnrf_CoInMoveH];
			_handled = true;
		};
	};
	_handled;  
};

[] execVM "extras\CoIn\IGobjectLibrary.sqf";


_displayMyObjects_fnc = {

	_prevTarget = player;
	_prevTargetValid = false;
	_cnt = 0;
	while {(!isNil "gnrf_CoIn") AND (alive player)} do {
		
		_target = cursorTarget;
		if (gnrf_CoInMove) then {_target = objNull};
		_name = _target getVariable "ownerName";
		
		if ((!isNull _target) AND (_target != _prevTarget) AND (!isNil "_name")) then {
					
			_class = typeOf _target;
			_displayName = getText (configFile >> "cfgVehicles" >> _class >> "displayName");
			_owner = _target getVariable "owner";
			if (_name == name player) then {_name = "Your"} else {_name = _name + "´s"};
			titleFadeOut 1;
			sleep 1;
			titleText [str(parseText format ["<t size='1.15' color='#FEDC7D'>%1 %2</t>", _name, _displayName]), "PLAIN DOWN"]; 
			_prevTarget = _target;
			_cnt = 0;
			_prevTargetValid = true;
			
			
		} else {

			_prevTarget = _target;
			sleep 1;
			if (_prevTargetValid) then {
			
				_cnt = _cnt + 1;
			
				if (_cnt >= 3) then {

					_cnt = 0;
					_prevTargetValid = false;
					titleFadeOut 1;
					sleep 1;	
					titleText ["", "PLAIN DOWN"];
				};
			};
		};
		
		_dis = player distance gnrf_coInHolder;
		if (_dis < 300) then {gnrf_coInInRange = true} else {gnrf_coInInRange = false};

	};
	gnrf_CoIn = nil;
};

[] spawn _displayMyObjects_fnc;


