
//Save loadout
player setVariable ["magazines", magazines player];
player setVariable ["weapons", weapons player];

copyToClipboard format ["%1 ### %2", magazines player, weapons player];

hintSilent "Loadout saved";


