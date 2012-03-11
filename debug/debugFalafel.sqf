[] execVM "sectors\falafel\initFalafel.sqf";
hint "Initiating Falafel.";

waitUntil {falafelReady};

hint "Initialization complete. Clearing sector.";

sleep 1;

{_x setDamage 1} forEach opforTrashbin;


