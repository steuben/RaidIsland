
private ["_unit", "_targetPos", "_building", "_rnd", "_dis", "_cnt", "_tick"]; 


_building = gnrf_allBuildings call BIS_fnc_selectRandom;
_targetPos = _building call BIS_fnc_selectRandom;
_unitClass = ["TK_CIV_Takistani01_EP1", "TK_CIV_Takistani02_EP1", "TK_CIV_Takistani03_EP1", "TK_CIV_Takistani04_EP1", "TK_CIV_Takistani05_EP1", "TK_CIV_Takistani06_EP1", "ACE_TK_CIV_Takistani_Doctor_EP1", "Doctor", "SchoolTeacher", "RU_Rocker1", "TK_CIV_Woman01_EP1", "TK_CIV_Woman02_EP1", "TK_CIV_Woman03_EP1", "Farmwife4", "Madam3"] call BIS_fnc_selectRandom;
_civUnit = _unitClass createUnit [_targetPos, gnrf_civBuilding_grp, "gnrf_currentCivUnit = this;", 1, ""];	
_unit = gnrf_currentCivUnit;
gnrf_currentCivUnit = nil;
gnrf_civUnits set [count gnrf_civUnits, _unit];
_unit setPos _targetPos; 
_unit allowFleeing 0;
_unit setVariable ["roles", ["housed"], true];

while {alive _unit} do 
{	
	_targetPos = _building call BIS_fnc_selectRandom;
	_unit doMove _targetPos; 
	_unit forceSpeed 1;
	
	waitUntil 
	{
		_distance = _unit distance _targetPos;
		_tick = _distance / 5;
		sleep _tick;
		_distance < 1;
	}; 
	
	doStop _unit;
	_unit forceSpeed 0;
	_rnd = random 40;
	sleep _rnd;
};