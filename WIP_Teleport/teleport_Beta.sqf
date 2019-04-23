/*
	Teleport to Commander for JIP, H&M version by michy_REV19
	v1.0 Updated 2018/10/20
	Description : This script allows players to teleport to commander's position, and it also supports respawned player. 
	Contact (Twitter): @michy_REV19
	
	Put the following syntax into object's init field
			[this, "<t size='1.2'><t color='#FF1493'>Teleport to Commander</t>", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_takeOff1_ca.paa", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_takeOff2_ca.paa", "(_this distance _target) < 5.0", "(_caller distance _target) < 5.0", {}, {}, {hint "call teleport script"}, {hint "stay near flag"}, [], 3.0, 6.0, false, false] call BIS_fnc_holdActionAdd;
*/

if !(local player) exitwith {};

private ["_allUnits", "_b", "_c"];

if (isMultiplayer) then {
	_allUnits = playableUnits;
} else {
	_allUnits = switchableUnits;
};

_cdr = _allUnits select 0;
_cdrPos
_cdrDir
_cdrName = name _cdr;


/*

_getterCdr 	= {call _getterUnits select 0};
_getterDir 	= {getDir call _getterCdr};
_getterName = {name call _getterCdr};


if ((vehicle call _getterCdr) == (call _getterCdr)) then {
	titleText ["", "BLACK IN", 1];
	//player setPos [X, Y, 0.5];
	player setPos [(getPos call _getterCdr select 0) - ((random(5)+3)*sin(_dir)), (getPos call _getterCdr select 1) - ((random(5)+3)*cos(_dir)), 0.5];
	hint format ["You moved to %1.", (call _getterName)];
} else {
	if (((vehicle call _getterCdr) emptyPositions "cargo") >= 1) then {
		titleText ["", "BLACK IN", 1];
		player moveInCargo (vehicle call _getterCdr);
		hint format ["You moved to %1.", (call _getterName)];
	} else {
		hint format ["%1 is moving on vehicle and Full of passenger.\ntry again later.", (call _getterName)];
	};
};