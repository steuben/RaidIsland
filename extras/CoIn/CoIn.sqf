
if ((paramsArray select 4) != 1) exitWith {}; 

player allowDamage false;

gnrf_CoInObjArray = [];
gnrf_CoInMyObj = [];
gnrf_CoInPrevDir = 0;

////testObjects
/*
	gnrf_CoInTest_act = player addAction [("<t color=""#FEDC7D"">" + ("Create Test Object") + "</t>"),"gen_action.sqf",[{
	
		gnrf_CoInTest = true;
		[] execVM "debug\testObjects.sqf";
				
	}],3,false,true,"","(isNil 'gnrf_CoIn') AND (isNil 'gnrf_CoInTest')"];
*/

////grab action	
	_grabber = player;
	
	gnrf_CoIn_act = _grabber addAction [("<t color=""#FEDC7D"">" + ("Grab Target") + "</t>"),"gen_action.sqf",[{
		
		gnrf_CoInObjArray = gnrf_CoInObjArray - [cursorTarget];
		gnrf_CoInIsCursorTarget = true;
		[player, ""] spawn gnrf_CoIn_fnc;
		
	}],3,false,false,"","(isNil 'gnrf_CoIn') AND (!isNull cursorTarget)"];
	
	
////delete action	
	gnrf_CoInDelete_act = _grabber addAction [("<t color=""#FEDC7D"">" + ("Delete Target") + "</t>"),"gen_action.sqf",[{
		
		_target = cursorTarget;
		gnrf_CoInObjArray = gnrf_CoInObjArray - [_target];
		gnrf_CoInMyObj = gnrf_CoInMyObj - [_target];
		deleteVehicle cursorTarget;
				
	}],3,false,false,"","(isNil 'gnrf_CoIn') AND (!isNull cursorTarget) AND (cursorTarget in gnrf_CoInMyObj) "];
	
	
////dropAction
	gnrf_unCoIn_act = _grabber addAction [("<t color=""#FEDC7D"">" + ("Drop") + "</t>"),"gen_action.sqf",[{

		gnrf_CoIn = nil;
		
		if (isNil "gnrf_CoInIsCursorTarget") then {gnrf_CoInMyObj set [count gnrf_CoInMyObj, gnrf_CoInTarget]};	
		
		deleteVehicle gnrf_CoInMoveH;
		gnrf_CoInMoveH = nil;
		gnrf_CoInIsCursorTarget = nil;
		gnrf_CoInPrevDir = getDir gnrf_CoInTarget;

	}],3,false,false,"","gnrf_CoIn"];
	
	
////cancel action
	gnrf_cancelCoIn_act = _grabber addAction [("<t color=""#FEDC7D"">" + ("Cancel") + "</t>"),"gen_action.sqf",[{

		deleteVehicle gnrf_CoInTarget; 
		gnrf_CoIn = nil;
		deleteVehicle gnrf_CoInMoveH;
		gnrf_CoInMoveH = nil;
		
	}],3,false,false,"","(gnrf_CoIn) AND (isNil 'gnrf_CoInIsCursorTarget')"];

		
////addObjAction
	gnrf_CoInAddObj_act = _grabber addAction [("<t color=""#FEDC7D"">" + ("Add Object to Composition") + "</t>"),"gen_action.sqf",[{

		gnrf_CoIn = nil;
		
		if (isNil "gnrf_CoInIsCursorTarget") then {gnrf_CoInMyObj set [count gnrf_CoInMyObj, gnrf_CoInTarget]};	
		
		gnrf_CoInObjArray set [count gnrf_CoInObjArray, gnrf_CoInTarget];
		gnrf_CoInPrevDir = getDir gnrf_CoInTarget;
		deleteVehicle gnrf_CoInMoveH;
		gnrf_CoInMoveH = nil;
		gnrf_CoInIsCursorTarget = nil;
				
	}],3,false,false,"","gnrf_CoIn"];


////finishAction
	gnrf_CoInFinish_act = _grabber addAction [("<t color=""#FEDC7D"">" + ("Finish Object") + "</t>"),"gen_action.sqf",[{
		
		gnrf_CoInObjPosArray = [];
		gnrf_CoInObjDirArray = [];
		gnrf_CoInObjClassArray = [];
		gnrf_CoInObjVectorUp = [];
		{gnrf_CoInObjPosArray set [count gnrf_CoInObjPosArray, getPosASL _x]} forEach gnrf_CoInObjArray;
		{gnrf_CoInObjDirArray set [count gnrf_CoInObjDirArray, getDir _x]} forEach gnrf_CoInObjArray;
		{gnrf_CoInObjVectorUp set [count gnrf_CoInObjVectorUp, vectorUp _x]} forEach gnrf_CoInObjArray; 
		{_type = typeOf _x; if (_type != "") then {gnrf_CoInObjClassArray set [count gnrf_CoInObjClassArray, _type]}} forEach gnrf_CoInObjArray;
		gnrf_CoInObjCnt = count gnrf_CoInObjClassArray;
		{deleteVehicle _x} forEach gnrf_CoInObjArray;
		
//  save composition to clipboard
		
		_string1 = str(parsetext format ["		
		_classArray = %1;
		", gnrf_CoInObjClassArray]);
		
		_string2 = str(parsetext format ["
		_posArray = %1;
		", gnrf_CoInObjPosArray]);
		
		_string3 = str(parsetext format ["
		_dirArray = %1;
		", gnrf_CoInObjDirArray]);
		
		_string4 = str(parsetext format ["
		_vectorArray = %1;
				
		for '_i' from 0 to %2 do {			
			
			_class = _classArray select _i; 			
			_pos = _posArray select _i;		
			_dir = _dirArray select _i;
			_vector = _vectorArray select _i;
			
			_obj = _class createVehicle _pos;
			_obj setDir _dir;
			_obj setPosASL _pos;
			_obj setVectorUp _vector;
		};
		", gnrf_CoInObjVectorUp, (gnrf_CoInObjCnt - 1)]);
		
		copyToClipboard (format["%1", _string1] + format["%1", _string2] + format["%1", _string3] + format["%1", _string4]);
		
//	preview composition
		
		_classArray = gnrf_CoInObjClassArray;
		_posArray = gnrf_CoInObjPosArray;
		_dirArray = gnrf_CoInObjDirArray;
		_vectorArray = gnrf_CoInObjVectorUp;
		
		for "_i" from 0 to (gnrf_CoInObjCnt)-1 do {
			
			_class = _classArray select _i;
			_pos = _posArray select _i; 			
			_dir = _dirArray select _i;
			_vector = _vectorArray select _i;
			
			_obj = _class createVehicle _pos;
			_obj setDir _dir;
			_obj setPosASL _pos;
			_obj setVectorUp _vector;
		};
		
		gnrf_CoInObjPosArray = nil;
		gnrf_CoInObjDirArray = nil;
		gnrf_CoInObjClassArray = nil;
		gnrf_CoInObjVectorUp = nil;
		gnrf_CoInObjArray = [];

		
	}],3,false,false,"","(isNil 'gnrf_CoIn') AND (count gnrf_CoInObjArray > 0)"];


//////grabFunction
gnrf_CoIn_fnc = {
	
	gnrf_CoIn = true; 
	private ["_grabber", "_target", "_disMin"];
	_grabber = _this select 0; 
	_target = _this select 1;
	_targetDir = gnrf_CoInPrevDir;
	
	if  (!isNil "gnrf_CoInIsCursorTarget") then {_target = cursorTarget} else {_target setDir _targetDir};
		
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
			
	waitUntil {!(isNull (findDisplay 46))};
	gnrf_CoInTarget = _target;
	gnrf_CoInKeys_EH = (findDisplay 46) displayAddEventHandler ["keyDown", "[_this, gnrf_CoInTarget] call gnrf_CoInKeys_fnc"];
	
	
	while {(!isNil "gnrf_CoIn") AND (alive _grabber)} do {

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
		
		if (_dikCode == 72) then {	
			if (gnrf_CoInZAxis < 10) then {gnrf_CoInZAxis = gnrf_CoInZAxis + 0.1};
	  		_handled = true;
		};
		
		if (_dikCode == 80) then {	
			if (gnrf_CoInZAxis >= -50) then {gnrf_CoInZAxis = gnrf_CoInZAxis - 0.1};
	  		_handled = true;
		};
	};
	_handled;  
};

[] execVM "extras\CoIn\objectLibrary.sqf";


_displayMyObjects_fnc = {

	_prevTarget = objNull;
	_cnt = 0;
	while {true} do {
		
		_target = cursorTarget;
		if (gnrf_CoIn) then {_target = objNull};
		
		if ((!isNull _target) AND (_target != _prevTarget) AND (_target in gnrf_CoInMyObj)) then {
					
			_class = typeOf _target;
			_displayName = getText (configFile >> "cfgVehicles" >> _class >> "displayName");
			titleText [str(parseText format ["<t size='1.15' color='#FEDC7D'>%1</t>", _displayName]), "PLAIN DOWN"]; 
			sleep 1;
			_prevTarget = _target;
			
		};

		if ((isNull _target) OR (!(_target in gnrf_CoInMyObj))) then {
			
			_prevTarget = _target;
			sleep 1;			
			
			_cnt = _cnt + 1;
			
			if (_cnt >= 5) then {

				_cnt = 0;			
				titleFadeOut 1;
				sleep 1;	
				titleText ["", "PLAIN DOWN"];
			};
		};

	};
};

[] spawn _displayMyObjects_fnc;


