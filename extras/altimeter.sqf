
sleep 2;

while {((getposATL player)select 2) > 300} do
{
	hintSilent parseText format["<t size='1.15' font='Zeppelin33' color='#B4B4B4'> Altimeter<br/><t size='2' color='#2FBA22'>%1</t></t>", round (getPosATL player select 2)];
};

while {((getposATL player)select 2) > 200} do
{
	hintSilent parseText format["<t size='1.15' font='Zeppelin33' color='#B4B4B4'> Altimeter<br/><t size='2' color='#E8DE23'>%1</t></t>", round (getPosATL player select 2)];
};

while {((getposATL player)select 2) > 1} do
{
	hintSilent parseText format["<t size='1.15' font='Zeppelin33' color='#B4B4B4'> Altimeter<br/><t size='2' color='#D40D0D'>%1</t></t>", round (getPosATL player select 2)];
};

if (((getposATL player)select 2) < 1) then
{
	hintsilent "";
};



