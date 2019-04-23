/*
	TFAR Radio Extension Script by michy_REV19
	v0.9 Updated 2018/08/11
	Description: This script extends radio communication distance of TFAR very easily.
	Contact (Twitter): @michy_REV19

	Put the following syntax into "init.sqf"
		[AntennaObj, Distance, SendMulti, ReceiveMulti, Interval] execVM "scripts\TFAR_Radio_Extension_Script.sqf";
	Parameters:
		AntennaObj:		Object - Object which enabling extension
		Distance:		Number - Distance to AntennaObject for enabling extension
		SendMulti:		Number - Multiplicator of sending distance
		ReceiveMulti:	Number - Multiplicator of receiving distance
		Interval:		Number - Interval of execution (Enlarge if performance goes down)
	e.g.
		[antenna1, 10, 5, 5, 10] execVM "scripts\TFAR_Radio_Extension_Script.sqf";
*/

//Avoid execution at Server or Headless client
if (isDedicated or !hasInterface) exitWith {};

//Definition of variables
_this params ["_treObj", "_treDist", "_treSendMulti", "_treReceiveMulti", "_treInt"];
player setVariable ["tre_enabled", false];

//Switch extension
[
	{
		if (((player distance _treObj) < _treDist) && !(player getVariable "tre_enabled")) then {
			player setVariable ["tf_sendingDistanceMultiplicator", _treSendMulti];
			player setVariable ["tf_receivingDistanceMultiplicator", _treReceiveMulti];
			player setVariable ["tre_enabled", true];
		};
		if (((player distance _treObj) > _treDist) && (player getVariable "tre_enabled")) then {
			player setVariable ["tf_sendingDistanceMultiplicator", 1];
			player setVariable ["tf_receivingDistanceMultiplicator", 1];
			player setVariable ["tre_enabled", false];
		};
		if (isNull _treObj) exitWith {
			(_this select 1) call CBA_fnc_removePerFrameHandler;
		};
	},
	_treInt,
	nil
] call CBA_fnc_addPerframeHandler;