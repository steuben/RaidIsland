
sleep 0.5;
_lzElvis="HeliHEmpty" createVehicle getPos player;
_lzElvisSmoke="SmokeShellPurple" createVehicle getPos player;

_irstrobe = "ACE_IRStrobe_Object" createVehicle  getPos  _lzElvis;
_irstrobe attachTo[_lzElvis,[0,0,0],""];
["ace_sys_irstrobe_aradd", [_irstrobe]] call CBA_fnc_globalEvent;