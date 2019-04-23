//Branch Divided Gear Script by michy
//Updated 2016/3/17 v1.0
/* for init.sqf
_BDGear = [] call compile preprocessFileLineNumbers "scripts\BDGear.sqf";
waitUntil{scriptDone _BDGear};
*/

private ["_tgtunits"];

//Singleplayer
if (!isMultiplayer)
	then
	{
		_tgtunits = switchableUnits;
	};

//Multiplayer Server
if (isDedicated)
	then
	{
		_tgtunits = (playableUnits - allPlayers);
	};

//Multiplayer Player
if (isMultiplayer && !isDedicated)
	then
	{
		if (player != player)
			then
			{
				waitUntil {player == player};
			};
		waitUntil {local player};
		_tgtunits = [player,null];
	};

{
private ["_unit","_class"];
_unit = _x;
_class = typeOf vehicle _unit;

removeallweapons _unit;
removeAllAssignedItems _unit;
removebackpack _unit;
removeVest _unit;
removeUniform _unit;
removeHeadGear _unit;
removeGoggles _unit;

_unit addWeapon "ItemMap";
_unit addWeapon "ItemCompass";
_unit addWeapon "ItemWatch";

switch(_class) do{
	//Team Leader
	case "rhsusf_army_ocp_teamleader":
	{
		_unit addWeapon "ItemGPS";
		_unit addWeapon "tf_anprc152";
		_unit addWeapon "ACE_Vector";
		_unit addWeapon "rhs_weap_m4_grip2";
		_unit forceAddUniform "rhs_uniform_cu_ocp";
		for "_i" from 1 to 1 do {_unit addItemToUniform "ACE_microDAGR";};
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_packingBandage";};
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_elasticBandage";};
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_quikclot";};
		for "_i" from 1 to 1 do {_unit addItemToUniform "ACE_tourniquet";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_epinephrine";};
		for "_i" from 1 to 1 do {_unit addItemToUniform "ACE_EarPlugs";};
		_unit addVest "rhsusf_iotv_ocp_Teamleader";
		for "_i" from 1 to 7 do {_unit addItemToVest "30Rnd_556x45_Stanag_Tracer_Red";};
		for "_i" from 1 to 2 do {_unit addItemToVest "MiniGrenade";};
		for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
		for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellGreen";};
		_unit addBackpack "rhsusf_assault_eagleaiii_ocp";
		for "_i" from 1 to 5 do {_unit addItemToBackpack "30Rnd_556x45_Stanag_Tracer_Red";};
	};
	
	//Autorifleman
	case "rhsusf_army_ocp_autorifleman":
	{
		_unit addWeapon "tf_anprc152";
		_unit addWeapon "Binocular";
		_unit addWeapon "rhs_weap_m249_pip";
		_unit forceAddUniform "rhs_uniform_cu_ocp";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_packingBandage";};
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_elasticBandage";};
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_quikclot";};
		for "_i" from 1 to 1 do {_unit addItemToUniform "ACE_tourniquet";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_epinephrine";};
		for "_i" from 1 to 1 do {_unit addItemToUniform "ACE_EarPlugs";};
		_unit addVest "rhsusf_iotv_ocp_Teamleader";
		for "_i" from 1 to 2 do {_unit addItemToVest "MiniGrenade";};
		for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
		for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellGreen";};
		_unit addBackpack "rhsusf_assault_eagleaiii_ocp";
		for "_i" from 1 to 4 do {_unit addItemToBackpack "rhsusf_100Rnd_556x45_soft_pouch";};
	};
	
	//Grenadier
	case "rhsusf_army_ocp_grenadier":
	{
		_unit addWeapon "tf_anprc152";
		_unit addWeapon "Binocular";
		_unit addWeapon "rhs_weap_m4_m320";
		_unit forceAddUniform "rhs_uniform_cu_ocp";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_packingBandage";};
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_elasticBandage";};
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_quikclot";};
		for "_i" from 1 to 1 do {_unit addItemToUniform "ACE_tourniquet";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_epinephrine";};
		for "_i" from 1 to 1 do {_unit addItemToUniform "ACE_EarPlugs";};
		_unit addVest "rhsusf_iotv_ocp_Teamleader";
		for "_i" from 1 to 7 do {_unit addItemToVest "30Rnd_556x45_Stanag_Tracer_Red";};
		for "_i" from 1 to 2 do {_unit addItemToVest "MiniGrenade";};
		for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
		for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellGreen";};
		_unit addBackpack "rhsusf_assault_eagleaiii_ocp";
		for "_i" from 1 to 5 do {_unit addItemToBackpack "30Rnd_556x45_Stanag_Tracer_Red";};
		for "_i" from 1 to 10 do {_unit addItemToBackpack "rhs_mag_M433_HEDP";};
	};
	
	//Rifleman
	case "rhsusf_army_ocp_rifleman":
	{
		_unit addWeapon "tf_anprc152";
		_unit addWeapon "Binocular";
		_unit addWeapon "rhs_weap_m4_grip2";
		_unit forceAddUniform "rhs_uniform_cu_ocp";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_packingBandage";};
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_elasticBandage";};
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_quikclot";};
		for "_i" from 1 to 1 do {_unit addItemToUniform "ACE_tourniquet";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_epinephrine";};
		for "_i" from 1 to 1 do {_unit addItemToUniform "ACE_EarPlugs";};
		_unit addVest "rhsusf_iotv_ocp_Rifleman";
		for "_i" from 1 to 7 do {_unit addItemToVest "30Rnd_556x45_Stanag_Tracer_Red";};
		for "_i" from 1 to 2 do {_unit addItemToVest "MiniGrenade";};
		for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
		for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellGreen";};
		_unit addBackpack "rhsusf_assault_eagleaiii_ocp";
		for "_i" from 1 to 5 do {_unit addItemToBackpack "30Rnd_556x45_Stanag_Tracer_Red";};
	};
	
	//Other
	default
	{
		_unit addWeapon "tf_anprc152";
		_unit addWeapon "Binocular";
		_unit forceAddUniform "rhs_uniform_cu_ocp";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_packingBandage";};
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_elasticBandage";};
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_quikclot";};
		for "_i" from 1 to 1 do {_unit addItemToUniform "ACE_tourniquet";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_epinephrine";};
		for "_i" from 1 to 1 do {_unit addItemToUniform "ACE_EarPlugs";};
		_unit addVest "rhsusf_iotv_ocp_Teamleader";
		_unit addBackpack "rhsusf_iotv_ocp_Rifleman";
	};
};
_unit selectWeapon (primaryWeapon _unit);
doStop _unit;
} forEach _tgtunits;