while {((getposATL player)select 2) > 1} do
{
hintsilent format ["Altimeter: %1", round (getPosATL player select 2)];
};
if (((getposATL player)select 2) < 1) then
{
hintsilent "";
};