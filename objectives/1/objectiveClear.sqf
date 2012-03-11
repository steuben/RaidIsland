
[] execVM "loadout\reinforcement.sqf";

if (isServer) then 

{
	
	sleep 30;

	[opforTrashbin] call CBA_fnc_deleteEntity;
		
	
};