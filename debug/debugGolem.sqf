[] execVM "sectors\golem\initGolem.sqf";
hint "Initiating Golem.";

waitUntil {golemReady};

hint "Initialization complete. Clearing sector.";

sleep 1;

{_x setDamage 1} forEach opforTrashbin;

