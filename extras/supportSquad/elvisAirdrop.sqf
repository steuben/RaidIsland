elvis flyInHeight 80;

if (isServer) then
{
	sleep 2;

	{
		unassignVehicle (_x);
		(_x) action ["EJECT", vehicle _x];
		sleep 1.1;
	} forEach [steuben1,steuben2,steuben3,steuben4,steuben,bbq,bbq1,bbq2,bbq3,bbq4];
};