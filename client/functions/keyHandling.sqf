
private["_handled", "_ctrl", "_dikCode", "_shift", "_ctrlKey", "_alt"];
_ctrl = _this select 0;
_dikCode = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;  
_handled = false;


scopeName "main";
switch (_dikCode) do 
{	
	case 79 : {if (!_shift && !_ctrlKey && !_alt) then  {call gnrf_turboAtv_keyDown; _handled = true; breakTo "main"}};
	
	case 70 : {
	
		if (_shift && _ctrlKey && !_alt && !debugModeOn && (paramsArray select 0) != 1) then  
		{
			titleText ["Debug mode enabled", "PLAIN"];
			debugModeOn = true; 
			if (isNil "gnrf_debugCalledOnce") then 
			{
				[] execVM "debug\debugMode.sqf"; 
				gnrf_debugCalledOnce = true;
			};
			_handled = true;
			breakTo "main";
		};
		
		if (_shift && _ctrlKey && !_alt && debugModeOn && (paramsArray select 0) != 1) then  
		{
			titleText ["Debug mode disabled", "PLAIN"];
			debugModeOn = false; 
			_handled = true; 
			breakTo "main";
		};	
	
		if (!_shift && !_ctrlKey && !_alt && !assmanStart) then  {_ok = createDialog "uiAssmanStart"; assmanStart = true; _handled = true; breakTo "main"};
		if (!_shift && !_ctrlKey && !_alt && assmanStart) then  {closeDialog 0; assmanStart = false; _handled = true; breakTo "main"};
	};
};

_handled;  