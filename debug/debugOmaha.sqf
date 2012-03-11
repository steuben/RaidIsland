[] execVM "sectors\omaha\initOmaha.sqf";
hint "Initiating Omaha.";

waitUntil {omahaReady};

hint "Initialization complete. Clearing sector.";

sleep 1;

{_x setDamage 1} forEach opforTrashbin;
