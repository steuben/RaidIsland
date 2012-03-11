
[-1, {Support_MAINMENU set [3, ["SatScan", [4], "", -5, [["expression", ""]], "1", "0"] ]}] call CBA_fnc_globalExecute;

satScanBusy = true;
bravoKlicked = false;
satScanComplete = false;
if (!visibleMap) then {openMap true};

onMapSingleClick "onMapSingleClick ''; satPos =+ _pos; bravoKlicked = true";

titleText ["Please specifiy scann area", "PLAIN DOWN"];

waitUntil {bravoKlicked};

scanArea = createMarkerLocal ["satScanArea", satPos];
scanArea setMarkerColor "ColorBlue";
scanArea setMarkerShape "RECTANGLE";
scanArea setMarkerBrush "BORDER";
scanArea setMarkerSize [200, 200];
scanArea setMarkerAlpha 0.8;

trg3 = createTrigger["EmptyDetector", satPos]; 
trg3 setTriggerText "Scan Area"; 
trg3 setTriggerArea[100,100,0,true]; 
trg3 setTriggerActivation["ANY","PRESENT",false]; 
trg3 setTriggerStatements["true", "
	
	_opforUnits = [];
	{if (side _x == east) then {_opforUnits set [count _opforUnits, _x];};} forEach thislist;
	{player reveal _x} forEach _opforUnits; 
		
	if (count _opforUnits > 0) then {
		
		titleText ['OPFOR positions updated in scanned area', 'PLAIN']; 
	} else {
		titleText ['No OPFOR presence in scanned area', 'PLAIN'];
	};
	
	_opforUnits = nil;
	satScanComplete = true;	
", ""];

waitUntil {satScanComplete};

deleteVehicle trg3;

scanArea setMarkerAlpha 0.7;
sleep 0.5;
scanArea setMarkerAlpha 0.6;
sleep 0.5;
scanArea setMarkerAlpha 0.5;
sleep 0.5;
scanArea setMarkerAlpha 0.4;
sleep 0.5;
scanArea setMarkerAlpha 0.3;
sleep 0.5;
scanArea setMarkerAlpha 0.2;
sleep 0.5;
scanArea setMarkerAlpha 0.1;
sleep 0.5;
deleteMarker scanArea;

satScanBusy = nil;

[-1, {Support_MAINMENU set [3, ["SatScan", [4], "", -5, [["expression", "execVM 'extras\surveillance\satelliteScan.sqf'"]], "1", "1"]]}] call CBA_fnc_globalExecute;



