https://en.wikipedia.org/wiki/M58_MICLIC

/*
	MIne Clearing LIne Charge Script by michy_REV19
	v1.0 Updated 2018/10/14
	Description : This script adds MICLIC (like a M58 used by US Army) system to any vehicle.
	Contact (Twitter): @michy_REV19

	Put the following syntax into "init.sqf"
		[this, AmmoCount, []] execVM "scripts\detcord.sqf";
	Parameters:
		Number :		Object - PH
		Number :		Number - PH
	e.g.
		PH
*/



detConfig = [
//[[Vehicle('s')],ropeattpoint,baglaunchpoint,vectors]
  ["LSV_01_base_F",[0,-1.7,-1],[0,-1.7,0], [[0,-0.5,-0.5],[0,0.5,-0.5]]],
  ["APC_Tracked_01_base_F",[-0.5,-2.1,-0.1],[-0.5,-2.1,0.1],[[0,-0.5,0.75],[0,-0.75,-0.5]]]
];