

_atv = _this select 0;
_nook = (nearestobjects [getpos _atv, ["CH_47F_EP1"], 10] select 0); 
_nook setVariable ["empty", false, true];

deleteVehicle _atv;
