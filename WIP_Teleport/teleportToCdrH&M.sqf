/*
	Teleport to Commander for JIP H&M version by michy_REV19
	Last Updated 2018/10/19 v1.1
	For object's init
		this addAction ["<t color='#0099FF'>Teleport to Commander</t>","scripts\teleportToCdrH&M.sqf"];
*/

if !(local player) exitwith {};

private ["_getterUnits", "_getterCdr", "_getterDir", "_getterName"];

if (isMultiplayer) then {
	_getterUnits = {playableUnits};
} else {
	_getterUnits = {switchableUnits};
};

_getterCdr 	= {_getterUnits select 0};
_getterDir 	= {getDir _getterCdr};
_getterName = {name _getterCdr};


if ((vehicle _getterCdr) == (_getterCdr)) then {
	titleText ["", "BLACK IN", 1];
	player setPos [(getPos _getterCdr select 0) - ((random(5)+3)*sin(_dir)), (getPos _getterCdr select 1) - ((random(5)+3)*cos(_dir)), 0.5];
	hint format ["You moved to %1.", _getterName];
} else {
	if (((vehicle _getterCdr) emptyPositions "cargo") >= 1) then {
		titleText ["", "BLACK IN", 1];
		player moveInCargo (vehicle _getterCdr);
		hint format ["You moved to %1.", _getterName];
	} else {
		hint format ["%1 is moving on vehicle and Full of passenger.\ntry again later.", _getterName];
	};
};