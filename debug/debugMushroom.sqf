[] execVM "sectors\mushroom\initMushroom.sqf";
hint "Initiating Mushroom.";

waitUntil {mushroomReady};

hint "Initialization complete. Clearing sector.";

sleep 1;

{_x setDamage 1} forEach opforTrashbin;

