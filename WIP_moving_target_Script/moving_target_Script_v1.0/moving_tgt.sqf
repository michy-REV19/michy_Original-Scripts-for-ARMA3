/*
Moving Target Script by michy
Last Updated 2016/8/17 v1.0
For object's init
	 _nul = [this, 90, 10, 2, 2] execVM "scripts\moving_tgt.sqf";
array = [Target, Direction (360degrees), Distance (m), Speed (m/s), Interval(s)]
*/

//Execute on Server Only
if (!isServer) exitWith {};

//Define and Store Variable 
private ["_target", "_direction", "_distance", "_speed", "_interval"];
_target		= _this select 0;
_direction	= _this select 1;
_distance	= _this select 2;
_speed		= _this select 3;
_interval	= _this select 4;

private ["_updFreq", "_moveDist", "_updWait"];
_updFreq	= 0.01; //100 Frame Per Seconds
_moveDist	= (_speed / (1/_updFreq));
_updWait	= 0.0001;

//Infinite Loop
while {true} do {
	//Move Forward
	for [{_i = 0}, {_i < _distance}, {_i = _i + _moveDist}] do {
		_target setPos [
			(getPos _target select 0) + (_moveDist * (cos (_direction + 90)) * (-1)),
			(getPos _target select 1) + (_moveDist * (sin (_direction + 90))),
			0
		];
		sleep _updWait;
	};
	sleep _interval;
	
	//Move Reverse 
	for [{_i = 0}, {_i < _distance}, {_i = _i + _moveDist}] do {
		_target setPos [
			(getPos _target select 0) - (_moveDist * (cos (_direction + 90)) * (-1)),
			(getPos _target select 1) - (_moveDist * (sin (_direction + 90))),
			0
		];
		sleep _updWait;
	};
	sleep _interval;

};