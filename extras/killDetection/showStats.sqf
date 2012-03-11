
_stats = player getVariable ["stats", [[],[],[],[]]];
_opforInf = _stats select 0;
_opforVeh = _stats select 1;
_blufor   = _stats select 2;
_civs 	  = _stats select 3;

_teamStats = player getVariable ["teamStats", [[],[],[],[]]];
_teamOpforInf = _teamStats select 0;
_teamOpforVeh = _teamStats select 1;
_teamBlufor   = _teamStats select 2;
_teamCivs 	  = _teamStats select 3;

_opforInfTyp = [];
_opforInfCnt = [];
_opforInfStr = "";

_teamOpforInfTyp = [];
_teamOpforInfCnt = [];
_teamOpforInfStr = "";

_opforVehTyp = [];
_opforVehCnt = [];
_opforVehStr = "";

_teamOpforVehTyp = [];
_teamOpforVehCnt = [];
_teamOpforVehStr = "";

_bluforTyp = [];
_bluforCnt = [];
_bluforStr = "";

_teamBluforTyp = [];
_teamBluforCnt = [];
_teamBluforStr = "";

_civsTyp = [];
_civsCnt = [];
_civsStr = "";

_teamCivsTyp = [];
_teamCivsCnt = [];
_teamCivsStr = "";


//////arrange array for opforInf

//store each displayName once to _opforInfTyp
{_element = _x; if ({_x == _element} count _opforInfTyp == 0) then { _opforInfTyp set [count _opforInfTyp, _x];};} forEach _opforInf;

//store quantity of each displayName in _opforInfCnt 
{_element = _x; _tmpCnt = ({_x == _element} count _opforInf); _opforInfCnt set [count _opforInfCnt, _tmpCnt];} forEach _opforInfTyp;

//////arrange array for teamOpforInf

//store each displayName once to _teamOpforInfTyp
{_element = _x; if ({_x == _element} count _teamOpforInfTyp == 0) then { _teamOpforInfTyp set [count _teamOpforInfTyp, _x];};} forEach _teamOpforInf;

//store quantity of each displayName in _teamOpforInfCnt 
{_element = _x; _tmpCnt = ({_x == _element} count _teamOpforInf); _teamOpforInfCnt set [count _teamOpforInfCnt, _tmpCnt];} forEach _teamOpforInfTyp;


//////arrange array for opforVeh

//store each displayName once to _opforVehTyp
{_element = _x; if ({_x == _element} count _opforVehTyp == 0) then { _opforVehTyp set [count _opforVehTyp, _x];};} forEach _opforVeh;

//store quantity of each displayName in _opforVehCnt 
{_element = _x; _tmpCnt = ({_x == _element} count _opforVeh); _opforVehCnt set [count _opforVehCnt, _tmpCnt];} forEach _opforVehTyp;

//////arrange array for teamOpforVeh

//store each displayName once to _teamOpforVehTyp
{_element = _x; if ({_x == _element} count _teamOpforVehTyp == 0) then { _teamOpforVehTyp set [count _teamOpforVehTyp, _x];};} forEach _teamOpforVeh;

//store quantity of each displayName in _teamOpforVehCnt 
{_element = _x; _tmpCnt = ({_x == _element} count _teamOpforVeh); _teamOpforVehCnt set [count _teamOpforVehCnt, _tmpCnt];} forEach _teamOpforVehTyp;

//////arrange array for blufor

//store each displayName once to _bluforTyp
{_element = _x; if ({_x == _element} count _bluforTyp == 0) then { _bluforTyp set [count _bluforTyp, _x];};} forEach _blufor;

//store quantity of each displayName in _bluforCnt 
{_element = _x; _tmpCnt = ({_x == _element} count _blufor); _bluforCnt set [count _bluforCnt, _tmpCnt];} forEach _bluforTyp;

//////arrange array for teamBlufor

//store each displayName once to _teamBluforTyp
{_element = _x; if ({_x == _element} count _teamBluforTyp == 0) then { _teamBluforTyp set [count _teamBluforTyp, _x];};} forEach _teamBlufor;

//store quantity of each displayName in _teamBluforCnt 
{_element = _x; _tmpCnt = ({_x == _element} count _teamBlufor); _teamBluforCnt set [count _teamBluforCnt, _tmpCnt];} forEach _teamBluforTyp;

//////arrange array for civs

//store each displayName once to _civsTyp
{_element = _x; if ({_x == _element} count _civsTyp == 0) then { _civsTyp set [count _civsTyp, _x];};} forEach _civs;

//store quantity of each displayName in _civsCnt 
{_element = _x; _tmpCnt = ({_x == _element} count _civs); _civsCnt set [count _civsCnt, _tmpCnt];} forEach _civsTyp;

//////arrange array for teamCivs

//store each displayName once to _teamCivsTyp
{_element = _x; if ({_x == _element} count _teamCivsTyp == 0) then { _teamCivsTyp set [count _teamCivsTyp, _x];};} forEach _teamCivs;

//store quantity of each displayName in _teamCivsCnt 
{_element = _x; _tmpCnt = ({_x == _element} count _teamCivs); _teamCivsCnt set [count _teamCivsCnt, _tmpCnt];} forEach _teamCivsTyp;


//////totals
_opforTotal = (count _opforInf) + (count _opforVeh);
_bluforTotal   = count _blufor;
_civsTotal 	  = count _civs;

_teamOpforTotal = (count _teamOpforInf) + (count _teamOpforVeh);
_teamBluforTotal   = count _teamBlufor;
_teamCivsTotal 	  = count _teamCivs;


//arrange opforInf strings
for "_x" from 0 to ((count _opforInfTyp)-1) do { 	
	
	if (_opforInfCnt select _x == 1) then {

		_opforInfStr = _opforInfStr + (_opforInfTyp select _x) + "<br/>";		

	} else {
	
		_opforInfStr = _opforInfStr + str(_opforInfCnt select _x)+ " x " + (_opforInfTyp select _x) + "<br/>";
	};	
};

if (_opforInfStr == "") then {
	
	_opforInfStr = "none";
};

//arrange teamOpforInf strings
for "_x" from 0 to ((count _teamOpforInfTyp)-1) do { 	
	
	if (_teamOpforInfCnt select _x == 1) then {

		_teamOpforInfStr = _teamOpforInfStr + (_teamOpforInfTyp select _x) + "<br/>";		

	} else {
	
		_teamOpforInfStr = _teamOpforInfStr + str(_teamOpforInfCnt select _x)+ " x " + (_teamOpforInfTyp select _x) + "<br/>";
	};	
};

if (_teamOpforInfStr == "") then {
	
	_teamOpforInfStr = "none";
};

//arrange opforVeh strings
for "_x" from 0 to ((count _opforVehTyp)-1) do { 	
	
	if (_opforVehCnt select _x == 1) then {

		_opforVehStr = _opforVehStr + (_opforVehTyp select _x) + "<br/>";		

	} else {
	
		_opforVehStr = _opforVehStr + str(_opforVehCnt select _x)+ " x " + (_opforVehTyp select _x) + "<br/>";
	};	
};

if (_opforVehStr == "") then {
	
	_opforVehStr = "<br/>";
	
} else {

	_opforVehStr = "---------------------------------<br/>" + _opforVehStr;
 };

//arrange teamOpforVeh strings
for "_x" from 0 to ((count _teamOpforVehTyp)-1) do { 	
	
	if (_teamOpforVehCnt select _x == 1) then {

		_teamOpforVehStr = _teamOpforVehStr + (_teamOpforVehTyp select _x) + "<br/>";		

	} else {
	
		_teamOpforVehStr = _teamOpforVehStr + str(_teamOpforVehCnt select _x)+ " x " + (_teamOpforVehTyp select _x) + "<br/>";
	};	
};

if (_teamOpforVehStr == "") then {
	
	_teamOpforVehStr = "";
	
} else {

	_teamOpforVehStr = "---------------------------------<br/>" + _teamOpforVehStr + "<br/>";
 };

//arrange blufor strings
for "_x" from 0 to ((count _bluforTyp)-1) do { 	
	
	if (_bluforCnt select _x == 1) then {

		_bluforStr = _bluforStr + (_bluforTyp select _x) + "<br/>";		

	} else {
	
		_bluforStr = _bluforStr + str(_bluforCnt select _x)+ " x " + (_bluforTyp select _x) + "<br/>";
	};	
};

if (_bluforStr == "") then {
	
	_bluforStr = "none<br/>";
};

//arrange teamBlufor strings
for "_x" from 0 to ((count _teamBluforTyp)-1) do { 	
	
	if (_teamBluforCnt select _x == 1) then {

		_teamBluforStr = _teamBluforStr + (_teamBluforTyp select _x) + "<br/>";		

	} else {
	
		_teamBluforStr = _teamBluforStr + str(_teamBluforCnt select _x)+ " x " + (_teamBluforTyp select _x) + "<br/>";
	};	
};

if (_teamBluforStr == "") then {
	
	_teamBluforStr = "none<br/>";
};

//arrange civs strings
for "_x" from 0 to ((count _civsTyp)-1) do { 	
	
	if (_civsCnt select _x == 1) then {

		_civsStr = _civsStr + (_civsTyp select _x) + "<br/>";		

	} else {
	
		_civsStr = _civsStr + str(_civsCnt select _x)+ " x " + (_civsTyp select _x) + "<br/>";
	};	
};

if (_civsStr == "") then {
	
	_civsStr = "none<br/>";
};

//arrange teamCivs strings
for "_x" from 0 to ((count _teamCivsTyp)-1) do { 	
	
	if (_teamCivsCnt select _x == 1) then {

		_teamCivsStr = _teamCivsStr + (_teamCivsTyp select _x) + "<br/>";		

	} else {
	
		_teamCivsStr = _teamCivsStr + str(_teamCivsCnt select _x)+ " x " + (_teamCivsTyp select _x) + "<br/>";
	};	
};

if (_teamCivsStr == "") then {
	
	_teamCivsStr = "none<br/>";
};

//show stats as a hint

_grp = toarray str group player;
_grp set [0,"DEL"];
_grp set [1,"DEL"];
_grp = _grp - ["DEL"];
_grp = tostring _grp;

hintSilent parseText format["

<t size='1.15' font='Zeppelin33'><t size='1.4' color='#81B1E1'>%1's kills:</t><br/>%2<br/>
%3
<t color='#81B1E1'>Total:</t> %4<br/>
<t size='1.15' font='Zeppelin33'><t color='#81B1E1'>Friendly Fire:</t><br/>
%5
<t color='#81B1E1'>Total:</t> %6<br/>
<t size='1.15' font='Zeppelin33'><t color='#81B1E1'>Collateral Damage:</t><br/>
%7
<t color='#81B1E1'>Total:</t> %8<br/>
<br/>
<t size='1.15' font='Zeppelin33'><t size='1.4' color='#81B1E1'>Team %9 kills:</t><br/>%10<br/>
%11
<t color='#81B1E1'>Total:</t> %12<br/>
<t size='1.15' font='Zeppelin33'><t color='#81B1E1'>Friendly Fire:</t><br/>
%13
<t color='#81B1E1'>Total:</t> %14<br/>
<t size='1.15' font='Zeppelin33'><t color='#81B1E1'>Collateral Damage:</t><br/>
%15
<t color='#81B1E1'>Total:</t> %16<br/>
",name player, _opforInfStr, _opforVehStr, _opforTotal, _bluforStr, _bluforTotal, _civsStr, _civsTotal, _grp, _teamopforInfStr, _teamopforVehStr, _teamopforTotal, _teambluforStr, _teambluforTotal, _teamcivsStr, _teamcivsTotal];







