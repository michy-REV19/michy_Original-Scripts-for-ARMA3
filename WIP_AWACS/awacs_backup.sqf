/*
	AWACS Script by michy
	Updated 2017/11/08 v0.9
		for plane's init field
		_nul = [this, west] execVM "scripts\awacs.sqf";

To Do
	①radar Switch
	②report target when swittching
	③damage
	④vehicle confirmSensorTarget [side, isConfirmed]
	⑤Marker?
*/

//Argument definition
private ["_awacs", "_side"];
_awacs = _this select 0;
_side = _this select 1;
private ["_awacsInit", "_radarState"];
_awacsInit = false;
_radarState = false;

//Server side function
if (isServer) then {
	//Aircraft initialization
	_awacs setVehicleReportRemoteTargets false;
	_awacs setVehicleReceiveRemoteTargets true;
	_awacs setVehicleReportOwnPosition true;
	
	//Create radar
	_awacs allowDamage false;
	_group = createGroup _side;
	_group setGroupId ["AWACS Active Radar Array"];
	_radar1 = createVehicle ["ttt_nimitz_radar", position _awacs, [], 0, ""];
	_radar2 = createVehicle ["ttt_nimitz_radar", position _awacs, [], 0, ""];
	_radar3 = createVehicle ["ttt_nimitz_radar", position _awacs, [], 0, ""];
	_radar4 = createVehicle ["ttt_nimitz_radar", position _awacs, [], 0, ""];
	_radar5 = createVehicle ["ttt_nimitz_radar", position _awacs, [], 0, ""];
	_radar6 = createVehicle ["ttt_nimitz_radar", position _awacs, [], 0, ""];
	_radarArray = [_radar1, _radar2, _radar3, _radar4, _radar5, _radar6];
	
	//radar initialization
	{
		createVehicleCrew (_x select 0);
		(_x select 0) joinAsSilent [_group, _forEachIndex];
		(_x select 0) removeWeaponGlobal "jdg_rim7Launcher";
		(_x select 0) removeMagazineGlobal "jdg_rim7Magazine8x";
		(_x select 0) removeMagazineGlobal "jdg_rim7Magazine8x";
		(_x select 0) attachTo [_awacs, (_x select 1)];
		(_x select 0) setVectorDirAndUp (_x select 2);
		(_x select 0) setVehicleReportRemoteTargets true;
		(_x select 0) setVehicleReceiveRemoteTargets false;
		(_x select 0) setVehicleReportOwnPosition true; //☆ falseにする
		(_x select 0) setVehicleRadar 1;
		(_x select 0) hideObject false; //☆ trueにする
	} forEach [
		[_radar1, [0,16,2.5], [[0,1,0],[0,0,1]]],			//Foward
		[_radar2, [0,15,4], [[0,0.5,0.5],[0,-0.5,0.5]]],	//Foward upper
		[_radar3, [0,15,1], [[0,0.5,-0.5],[0,0.5,0.5]]],	//Foward lower
		[_radar4, [0,-16,2.5], [[0,-1,0],[0,0,1]]],			//Backward
		[_radar5, [0,-15,4], [[0,-0.5,0.5],[0,0.5,0.5]]],	//Backward upper
		[_radar6, [0,-15,1], [[0,-0.5,-0.5],[0,-0.5,0.5]]]	//Backward lower
	];
	_awacs allowDamage true;
	_awacsInit = true;
	
};
