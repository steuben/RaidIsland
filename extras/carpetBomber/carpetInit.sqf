
if (!isNil "echoReady") exitWith {titleText ["Echo is currently busy", "PLAIN DOWN"]};
echoCaller = _this select 0;

[-1, {AirSupport_SUBMENU set [1, ["Carpet Bombardment", [2], "", -5, [["expression", "[player] execVM 'extras\carpetBomber\carpetInit.sqf'"]], "1", "0"]]}] call CBA_fnc_globalExecute;

echoCaller = _this select 0;
publicVariable "echoCaller";
echoReady = false;
publicVariable "echoReady";
alphaKlicked = false; // klicked has to be global for some reason..
if (!visibleMap) then {openMap true};

titleText ["Please define a vector with two map klicks to set the bombardement direction.", "PLAIN DOWN"];
 
onMapSingleClick "onMapSingleClick ''; gnrf_clientBombPos1 =+ _pos; alphaKlicked = true";
waitUntil {alphaKlicked};

gnrf_clientBombPos1 set [2, 500];
_clientBombMarker1 = createMarkerLocal ["gnrf_clientBombMarkerName1",gnrf_clientBombPos1];
_clientBombMarker1 setMarkerColorLocal "ColorBlack";
_clientBombMarker1 setMarkerTypeLocal "Join";

alphaKlicked = false;
 
titleText ["Klick again", "PLAIN DOWN"];
onMapSingleClick "onMapSingleClick ''; gnrf_clientBombPos2 =+ _pos; alphaKlicked = true";
waitUntil {alphaKlicked};

gnrf_clientBombPos2 set [2, 500];
_clientBombMarker2 = createMarkerLocal ["gnrf_clientBombMarkerName2",gnrf_clientBombPos2];
_clientBombMarker2 setMarkerColorLocal "ColorBlack";
_clientBombMarker2 setMarkerTypeLocal "Join";

publicVariable "gnrf_clientBombPos1"; 
publicVariable "gnrf_clientBombPos2";

[0, {[] spawn carpetBombing}] call CBA_fnc_globalExecute;	

sleep 1;
deleteMarker "gnrf_clientBombMarkerName1";
deleteMarker "gnrf_clientBombMarkerName2";



		
