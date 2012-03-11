	

gnrf_mapTool_fnc = {
	
	gnrf_rulerMode = true;

	gnrf_rulerKlicked = false;	
	titleText ["Click on map to strart measuring", "PLAIN DOWN"];
	onMapSingleClick "onMapSingleClick''; gnrf_rulerPos1 = _pos; gnrf_rulerKlicked = true";
	waitUntil {gnrf_rulerKlicked};
	gnrf_rulerKlicked = false;	

	_measuringMarker1 = createMarkerLocal ["gnrf__measuringMarkerName1",gnrf_rulerPos1];
	_measuringMarker1 setMarkerColorLocal "ColorBlack";
	_measuringMarker1 setMarkerTypeLocal "mil_box";
	
	titleText ["Click again", "PLAIN DOWN"];
	onMapSingleClick "onMapSingleClick''; gnrf_rulerPos2 = _pos; gnrf_rulerKlicked = true";
	waitUntil {gnrf_rulerKlicked};
	
	_dir = [gnrf_rulerPos1, gnrf_rulerPos2] call BIS_fnc_dirTo;
	_dis = (gnrf_rulerPos1 distance gnrf_rulerPos2)/2;
	_centerPos = [(gnrf_rulerPos1 select 0)+(sin _dir)*_dis, (gnrf_rulerPos1 select 1)+(cos _dir)*_dis];
	
	deleteMarker _measuringMarker1;
	_measuringMarker2 = createMarkerLocal ["gnrf__measuringMarkerName2", _centerPos];
	_measuringMarker2 setMarkerColorLocal "ColorBlack";	
	_measuringMarker2 setMarkerShape "RECTANGLE";
	_measuringMarker2 setMarkerSize [10, _dis];
	_measuringMarker2 setMarkerBrush "SOLID";
	_measuringMarker2 setMarkerDir _dir;

	_dis = _dis*2;
	hintSilent parseText format ["a = %1 <br/>b = %2 <br/>distance a to b = %3m <br/>relative direction a to b = %4 degrees", gnrf_rulerPos1, gnrf_rulerPos2, _dis, _dir];
	copyToClipboard str(parseText format ["a = %1 <br/>b = %2 <br/>distance a to b = %3m <br/>relative direction a to b = %4 degrees", gnrf_rulerPos1, gnrf_rulerPos2, _dis, _dir]);
	gnrf_rulerMode = nil;
	
	sleep 3;
	deleteMarker _measuringMarker2;
};

_trg = createTrigger["EmptyDetector", [0,0]]; 
_trg setTriggerText "Map Tool"; 
_trg setTriggerArea[5,5,0,false]; 
_trg setTriggerActivation["INDIA","PRESENT",true]; 
_trg setTriggerStatements["this AND (isNil 'gnrf_rulerMode')", "[] spawn gnrf_mapTool_fnc", ""];