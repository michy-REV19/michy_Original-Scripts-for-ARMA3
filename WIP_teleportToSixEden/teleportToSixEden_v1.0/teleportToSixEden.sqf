/*
Teleport to Commander for JIP Eden version by Stealer, trico , michy
Last Updated 2016/3/23 v1.0
For object's init
	this addAction ["<t color='#0099FF'>Teleport to Commander</t>","scripts\teleportToSixEden.sqf"];
For commander's init
	grp1 = group this;
*/

if !(local player) exitwith {};

private ["_grp","_leader","_name","_dir"];

_grp = grp1;
_leader = leader _grp;
_name = name _leader;
_dir = getDir _leader;

if ((vehicle _leader) == (_leader)) then
{
	titleText ["","BLACK IN",1];
	player setPos [(getPos _leader select 0) - ((random(5)+3)*sin(_dir)), (getPos _leader select 1) - ((random(5)+3)*cos(_dir)), 0.5];
	hint format ["You moved to %1.",_name];
} else {
	if ((vehicle _leader) emptyPositions "cargo"== 0) then
	{
		hint format ["%1 is moving on vehicle and Full of passenger.\ntry again later.",_name];
	} else {
		titleText ["","BLACK IN",1];
		player moveInCargo vehicle _leader;
		hint format ["You moved to %1.",_name];
	};
};