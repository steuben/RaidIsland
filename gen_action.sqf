/*	---Generic Action Script---
	Author: [EVO] Curry
	Slightly edited by: CptBBQ
	Function: Enables you to run any code directly from the addAction command
	Installation: Copy into your missions folder and call this file through addAction
	Example usage:  
		In init of something
		this addAction ["Say Hello World!","gen_action.sqf","player sideChat 'Hello World!';"];
		
		Alternative Syntax with additional arugment passed
		this addAction ["Say Hello World!","gen_action.sqf",["player sideChat format ['Hello %1', _this select 3];", "World"]];
		Multiple arguments can be passed in an array and accessed with e.g. (_this select 3) select 1
		
	Notes: Recommended only for simple code or for testing scripts/functions designed for inits and triggers
*/

//Parameter one: String or Code - Whatever commands you want to issue, remember to check the syntax ;)

private ["_target","_caller","_ID","_code","_arguments"];
_target = _this select 0;
_caller = _this select 1;
_ID = _this select 2;

if (typeName (_this select 3) == "ARRAY") then
{	
	_code = (_this select 3) select 0;	
	_arguments 	= (_this select 3) select 1;
} else 
{
	_code = _this select 3;
	_arguments = "";
};

switch (typeName _code) do {
	case "STRING": 	
	{
		nul = [_target,_caller,_ID,_arguments] spawn (compile _code);
	};
	case "CODE":	
	{
		nul = [_target,_caller,_ID,_arguments] spawn _code;
	};
	default			
	{
		diag_log text "Error in gen_action.sqf: Invalid type passed to function.";
	};
};



