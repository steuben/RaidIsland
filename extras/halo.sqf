haloed = true;
if (!visibleMap) then {openMap true};
hintSilent "Set HALO coordinates via Mapclick.";
onMapSingleClick "player setPos _pos; [player, 2000] exec 'ca\air2\halo\data\Scripts\HALO_init.sqs'; haloed = false;";

waitUntil{!haloed};
onMapSingleClick "";
openMap false;
[] execVM "extras\altimeter.sqf";
	
	if (player == steuben) then
	  {
		haloGroup = [];
		haloGroup = [steuben1, steuben2, steuben3, steuben4];
	  };
	  
	  if (player == bbq) then
	  {
		haloGroup = [];
		haloGroup = [bbq1, bbq2, bbq3, bbq4];
	  };
	
	{
		
		[_x, 2000] exec 'ca\air2\halo\data\Scripts\HALO_init.sqs';
		
		haloDrop = getPos player;
		
		_a = (haloDrop select 0) + (20 - (random 40)); 
		_b = (haloDrop select 1) + (20 - (random 40)); 
		_c = (haloDrop select 2) + (20 - (random 40));
		
		_x setPos [_a, _b, _c]; 
		
		sleep 1;	
		
	} forEach haloGroup;


	sleep 28;

	{
				
		haloDrop = getPos player;
		publicVariable "haloDrop";
		
		_a = (haloDrop select 0) + (20 - (random 40)); 
		_b = (haloDrop select 1) + (20 - (random 40)); 
		_c = 120 + (random 10);
		
		_x setPos [_a, _b, _c]; 

		sleep 1;	
		
	} forEach haloGroup;