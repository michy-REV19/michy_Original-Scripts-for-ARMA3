/*
	Copy all compatible pylon magazines Script by michy_REV19
	
	Description : This script allows you to get and copy classnameof all compatible pylon magazines for aircraft.
	Author		: michy_REV19 (Twitter @michy_REV19)
	Version		: v1.0 (Updated on 2019/02/12)
	Usage		: Put the following syntax into player's init field
					[] execVM "x.sqf"
	Parameters :
*/

if (!isServer) exitwith {};

private ["_pylonsNum"];
_pylonsNum = 20;

for [
	
] do {
	
};


forEach

getCompatiblePylonMagazines

/*
allPylonMags = [];
{
	{
		allPylonMags pushBackUnique _x;
	} forEach (vehicle player getCompatiblePylonMagazines _x);
} forEach [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];
copyToClipboard allPylonMags;
*/