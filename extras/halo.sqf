haloed = true;
hintSilent "Set HALO coordinates via Mapclick.";
onMapSingleClick "player setPos _pos; [player, 2000] exec 'ca\air2\halo\data\Scripts\HALO_init.sqs'; haloed = false;";

waitUntil{!haloed};
onMapSingleClick "";
[] execVM "extras\altimeter.sqf";


if (isServer) then
{
	
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
	
	sleep 28;

	{
				
		haloDrop = getPos player;
		publicVariable "haloDrop";
		
		_x setPos [haloDrop select 0, haloDrop select 1, 120]; [_x, 150] exec 'ca\air2\halo\data\Scripts\HALO_init.sqs';
		sleep 1.2;
		
		
		
	} forEach haloGroup;
};