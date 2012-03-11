
gnrf_initCounter = 0; //this var is increased by when certain scripts are finished, other scripts start when certain value is reached

//setDate as specified by parameter
setDate [2012, 12, 10, (paramsArray select 2), 0];

////// Server only //////
if (!isServer) exitWith {};


