[] execVM "sectors\bacon\initBacon.sqf";
hint "Initiating Bacon.";

waitUntil {baconReady};

hint "Initialization complete. Clearing sector.";

sleep 1;

{_x setDamage 1} forEach opforTrashbin;