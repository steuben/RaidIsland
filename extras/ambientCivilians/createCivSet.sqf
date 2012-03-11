
if (!isServer) exitWith {};
gnrf_civSetRdy = false;
private ["_civUnit", "_civUnit2", "_civVehicle", "_waypointSet", "_vehicleClass", "_unitClass", "_civWpSet", "_civSpeed", "_spawnPos", "_roles", "_vehChance", "_hasPassenger", "_roles2", "_array"];

_roles = [];
_rnd1 = random 100;
_rnd2 = random 100;
switch true do {

	//civ is a cop
	case (_rnd1 <= 20) : 
	{
		_roles set [count _roles, "zpd"];
		_unitClass = "Policeman";
		_vehicleClass = "LadaLM";
		_hasPassenger = true;
		_vehChance = 50;
		_civSpeed = 50;
	};
	
	//civ is male
	case ((_rnd1 > 20) AND (_rnd1 <= 70) ) : 
	{	
		_unitClass = ["TK_CIV_Takistani01_EP1", "TK_CIV_Takistani02_EP1", "TK_CIV_Takistani03_EP1", "TK_CIV_Takistani04_EP1", "TK_CIV_Takistani05_EP1", "TK_CIV_Takistani06_EP1", "ACE_TK_CIV_Takistani_Doctor_EP1", "Doctor", "SchoolTeacher", "RU_Rocker1"] call BIS_fnc_selectRandom;
		_vehicleClass = ["Tractor", "TT650_TK_CIV_EP1", "Old_moto_TK_Civ_EP1", "Old_bike_TK_CIV_EP1", "S1203_TK_CIV_EP1", "Volha_1_TK_CIV_EP1", "Volha_2_TK_CIV_EP1", "Lada1", "Lada2_TK_CIV_EP1", "SkodaRed", "SkodaGreen", "car_sedan", "car_hatchback"] call BIS_fnc_selectRandom;					
		_hasPassenger = [true, false, false] call BIS_fnc_selectRandom;
		_vehChance = 33;
		_civSpeed = 8.5;
		if ((toLower _vehicleClass) in ["tractor", "old_bike_tk_civ_ep1"]) then {_hasPassenger = false};
	};
	
	//civ is female
	case (_rnd1 > 70) : 
	{	
		_roles set [count _roles, "female"];
		_unitClass = ["TK_CIV_Woman01_EP1", "TK_CIV_Woman02_EP1", "TK_CIV_Woman03_EP1", "Farmwife4", "Madam3"] call BIS_fnc_selectRandom;
		_vehicleClass = ["Volha_1_TK_CIV_EP1", "Volha_2_TK_CIV_EP1", "Lada1", "Lada2_TK_CIV_EP1", "SkodaRed", "SkodaGreen"] call BIS_fnc_selectRandom;					
		_hasPassenger = [true, false, false] call BIS_fnc_selectRandom;
		_vehChance = 20;
		_civSpeed = 7;
	};

};

_civWpSet = "DEFAULT";

switch true do {
	
	case (_rnd2 <= _vehChance) : 
	{		
		_roles set [count _roles, "driver"];
		_civWpSet = "VEHICLE";
	};

	case (_rnd2 > _vehChance) : 
	{		
		_roles set [count _roles, "onFoot"];
		_civWpSet = "DEFAULT";
	};	
};
	
//spawn pos
_pos = gnrf_globalStreets call BIS_fnc_selectRandom;
_spawnPos = [_pos select 0, _pos select 1, 0];	

//target pos
_targetPos = gnrf_globalStreets call BIS_fnc_selectRandom;

//create civilian	
_unit = _unitClass createUnit [_spawnPos, gnrf_civSet, "_civUnit = this;", 1, ""];
doStop _civUnit;

_civUnit setVariable ["targetPos", _targetPos, true];
_civUnit setVariable ["roles", _roles, true];
gnrf_movingCivs set [count gnrf_movingCivs, _civUnit];
gnrf_civUnits set [count gnrf_civUnits, _civUnit];


if ("driver" in _roles) then {

	//create vehicle 
	_civVehicle = _vehicleClass createVehicle _spawnPos;
	_civUnit moveInDriver _civVehicle;
	_civUnit setVariable ["vehicle", _civVehicle, true];
	
	if (_hasPassenger) then {
		
		//create passenger
		if (!("zpd" in _roles)) then {
		
			_unitClass = ["TK_CIV_Takistani01_EP1", "TK_CIV_Takistani02_EP1", "TK_CIV_Takistani03_EP1", "TK_CIV_Takistani04_EP1", "TK_CIV_Takistani05_EP1", "TK_CIV_Takistani06_EP1", "ACE_TK_CIV_Takistani_Doctor_EP1", "TK_CIV_Woman01_EP1", "TK_CIV_Woman02_EP1", "TK_CIV_Woman03_EP1", "Doctor", "Farmwife4", "SchoolTeacher", "Madam3", "RU_Rocker1"] call BIS_fnc_selectRandom;
	
		}; 
		_unit = _unitClass createUnit [_spawnPos, gnrf_civSet, "_civUnit2 = this;", 1, ""];
		_civUnit2 moveInCargo _civVehicle;
		doStop _civUnit2;

		_roles2 = ["passenger"];
		_civUnit2 setVariable ["roles", _roles2, true];
		_civUnit2 setVariable ["vehicle", _civVehicle, true];	
		_civUnit2 setVariable ["targetPos", _targetPos, true];
		_civUnit2 setVariable ["driver", _civUnit, true];
		gnrf_movingCivs set [count gnrf_movingCivs, _civUnit2];
		gnrf_civUnits set [count gnrf_civUnits, _civUnit2];

	};
	
};

if ("zpd" in _roles) then {
	
		_civUnit addMagazine "6Rnd_45ACP"; 
		_civUnit addMagazine "6Rnd_45ACP"; 
		_civUnit addWeapon "revolver_EP1"; 
		_civUnit selectWeapon "revolver_EP1";
		reload _civUnit; 
		_civUnit setBehaviour "SAFE";
		
		if (_hasPassenger) then {
		
			_civUnit2 addMagazine "6Rnd_45ACP";
			_civUnit2 addMagazine "6Rnd_45ACP"; 
			_civUnit2 addWeapon "revolver_EP1"; 
			_civUnit2 selectWeapon "revolver_EP1";
			reload _civUnit2; 
			_civUnit2 setBehaviour "SAFE";
		};
};
	
gnrf_civSetRdy = true;
