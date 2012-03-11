
//returns displayname of given unit, or name of given player unit
//usage: _displayName = _unit call grnf_getDisplayName_fnc;

private ["_unit", "_displayName"];

_unit = _this;
_displayName = "";


switch (true) do 
{
	
	case (isPlayer _unit) : 			   {_displayName = name _unit};

	case (isPlayer (leader group _unit)) : {
											_tmp = toArray str(_unit);
											_tmp set [0, "DEL"];
											_tmp set [1, "DEL"];
											_tmp = _tmp - ["DEL"];
											_displayName = toString _tmp;
											};
	
	default								   {_displayName = getText (configFile >> "cfgVehicles" >> typeOf _unit >> "displayName")};
};

_displayName



