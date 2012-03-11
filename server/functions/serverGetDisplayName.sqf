
//returns displayname of given unit, or name of given player unit
//usage: _displayName = _unit call grnf_getDisplayName_fnc;

private ["_unit", "_displayName"];

_unit = _this;
_displayName = "";


switch (true) do 
{
	
	case (isPlayer _unit) : 			   {_displayName = name _unit};

	case (isPlayer (leader group _unit)) : 

	{
		_grp = toarray str group _unit;
		_grp set [0,"DEL"];
		_grp set [1,"DEL"];
		_grp = _grp - ["DEL"];
		_grp = tostring _grp;
		
		_tmp = toArray str(_unit);
		_cnt = toString ([_tmp select 8]);
		
		_displayName = _grp + " " + _cnt;
	};
	
	default								   {_displayName = getText (configFile >> "cfgVehicles" >> typeOf _unit >> "displayName")};
};

_displayName



