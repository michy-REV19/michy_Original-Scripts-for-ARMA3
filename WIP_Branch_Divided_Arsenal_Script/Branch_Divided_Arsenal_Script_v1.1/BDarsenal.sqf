//Branch Divided Arsenal Script by michy
//v1.1 Last Updated 2016/3/10

if (isDedicated) exitwith {};
_box = _this select 0;
_unit = player;
_class = typeOf vehicle _unit;


//Whitelist
_genWeapons = [
"rhsusf_weap_m9"
];
_slWeapons = [
"rhs_weap_m4a1_carryhandle",
"rhs_weap_m4a1_carryhandle_grip2",
"rhs_weap_m4a1_carryhandle_pmag",
"rhs_weap_m4a1_carryhandle_grip",
"rhs_weap_m4a1",
"rhs_weap_m4a1_grip2",
"rhs_weap_m4a1_grip"
];
_arWeapons = [
"rhs_weap_m249_pip_L",
"rhs_weap_m249_pip_S_vfg"
];
_grWeapons = [
"rhs_weap_m4a1_carryhandle_m203",
"rhs_weap_m4a1_carryhandle_m203S",
"rhs_weap_m4a1_m203",
"rhs_weap_m4a1_m203s",
"rhs_weap_m4a1_m320"
];
_rmWeapons = [
"rhs_weap_m4a1_carryhandle",
"rhs_weap_m4a1_carryhandle_grip2",
"rhs_weap_m4a1_carryhandle_pmag",
"rhs_weap_m4a1_carryhandle_grip",
"rhs_weap_m4a1",
"rhs_weap_m4a1_grip2",
"rhs_weap_m4a1_grip",
"rhs_weap_M136",
"rhs_weap_M136_hedp",
"rhs_weap_M136_hp"
];

_Mags = [
//Magazine
"rhsusf_mag_15Rnd_9x19_JHP",
"rhsusf_mag_15Rnd_9x19_FMJ",
"rhs_mag_30Rnd_556x45_Mk318_Stanag",
"rhs_mag_30Rnd_556x45_M855A1_Stanag",
"rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",
"rhs_200rnd_556x45_M_SAW",
"rhsusf_100Rnd_556x45_soft_pouch",
//Grenade
"rhs_mag_m67",
"rhs_mag_m18_purple",
"rhs_mag_m18_green",
"rhs_mag_m18_red",
"rhs_mag_m18_yellow",
"rhs_mag_mk84",
"rhs_mag_an_m8hc",
"rhs_mag_an_m14_th3",
//40mm Grenade
"rhs_mag_M433_HEDP",
"rhs_mag_M4009",
"rhs_mag_m576",
"rhs_mag_M585_white",
"rhs_mag_M661_green",
"rhs_mag_M662_red",
"rhs_mag_M713_red",
"rhs_mag_M714_white",
"rhs_mag_M715_green",
"rhs_mag_M716_yellow",
//Explosive
"DemoCharge_Remote_Mag",
"SatchelCharge_Remote_Mag"
];

_genItems = [
//Default Item
"Binocular",
"ItemMap",
"tf_anprc152",
"ItemCompass",
"ItemWatch",
//Weapon acc
"rhsusf_acc_anpeq15",
"rhsusf_acc_anpeq15A",
"rhsusf_acc_EOTECH",
"rhsusf_acc_HAMR",
"rhsusf_acc_ELCAN",
"rhsusf_acc_ACOG",
"rhsusf_acc_ACOG2",
"rhsusf_acc_ACOG3",
"rhsusf_acc_compm4",
"RH_SFM952V",
"RH_SFM952V_tan",
//ACE Item
"ACE_M26_Clacker",
"ACE_IR_Strobe_Item",
"ACE_Banana",
"ACE_wirecutter",
"ACE_CableTie",
"ACE_Clacker",
"ACE_DefusalKit",
"ACE_EarPlugs",
"ACE_MapTools",
//ACE Medical
"ACE_epinephrine",
"ACE_morphine",
"ACE_elasticBandage",
"ACE_fieldDressing",
"ACE_packingBandage",
"ACE_quikclot",
"ACE_tourniquet",
"ACE_SpareBarrel"
];
_tlItems = [
"ACE_Vector",
"ACE_microDAGR"
];
_medItems = [
"ACE_atropine",
"ACE_bloodIV",
"ACE_bloodIV_250",
"ACE_bloodIV_500",
"ACE_plasmaIV",
"ACE_plasmaIV_250",
"ACE_plasmaIV_500",
"ACE_salineIV",
"ACE_salineIV_250",
"ACE_salineIV_500",
"ACE_surgicalKit",
"ACE_personalAidKit"
];
_genClothes = [
//Uniform
"rhs_uniform_cu_ocp",
//Headgear
"rhsusf_ach_helmet_ocp",
"rhsusf_ach_helmet_ESS_ocp",
"rhsusf_ach_helmet_headset_ocp",
"rhsusf_ach_helmet_headset_ess_ocp",
"rhs_Booniehat_ocp",
"rhsusf_patrolcap_ocp",
//Goggles
"rhs_googles_black",
"rhs_googles_clear",
"TRYK_US_ESS_Glasses",
"TRYK_US_ESS_Glasses_TAN"
];
_slClothes = [
"rhsusf_iotv_ocp_Squadleader"
];
_tlClothes = [
"rhsusf_iotv_ocp_Teamleader"
];
_arClothes = [
"rhsusf_iotv_ocp_SAW"
];
_grClothes = [
"rhsusf_iotv_ocp_Grenadier"
];
_rmClothes = [
"rhsusf_iotv_ocp_Rifleman"
];
_medClothes = [
"rhsusf_iotv_ocp_Medic"
];
_pilotClothes = [
"rhsusf_iotv_ocp",
"rhsusf_hgu56p"
];
_crewClothes = [
"rhsusf_iotv_ocp",
"rhsusf_cvc_green_helmet",
"rhsusf_cvc_green_ess"
];

_genBackpacks = [
"rhsusf_assault_eagleaiii_ocp"
];
_slBackpacks = [
"tf_rt1523g",
"rhsusf_assault_eagleaiii_ocp"
];
_medBackpacks = [
"TRYK_B_Medbag"
];

//select branch with classname
switch (_class) do{
	//Squad Leader
	case "rhsusf_army_ocp_squadleader":
	{
		[_box,(_genWeapons + _slWeapons),false] call BIS_fnc_addVirtualWeaponCargo;
		[_box,_Mags,false] call BIS_fnc_addVirtualMagazineCargo;
		[_box,(_genItems + _tlItems + _genClothes +_slClothes),false] call BIS_fnc_addVirtualItemCargo;
		[_box,_slBackpacks,false] call BIS_fnc_addVirtualBackpackCargo;
	};
	
	//Team Leader
	case "rhsusf_army_ocp_teamleader":
	{
		[_box,(_genWeapons + _rmWeapons),false] call BIS_fnc_addVirtualWeaponCargo;
		[_box,_Mags,false] call BIS_fnc_addVirtualMagazineCargo;
		[_box,(_genItems + _tlItems + _genClothes +_tlClothes),false] call BIS_fnc_addVirtualItemCargo;
		[_box,_genBackpacks,false] call BIS_fnc_addVirtualBackpackCargo;
	};

	//Autorifleman
	case "rhsusf_army_ocp_autorifleman":
	{
		[_box,(_genWeapons + _arWeapons),false] call BIS_fnc_addVirtualWeaponCargo;
		[_box,_Mags,false] call BIS_fnc_addVirtualMagazineCargo;
		[_box,(_genItems + _genClothes +_arClothes),false] call BIS_fnc_addVirtualItemCargo;
		[_box,_genBackpacks,false] call BIS_fnc_addVirtualBackpackCargo;
	};

	//Grenadier
	case "rhsusf_army_ocp_grenadier":
	{
		[_box,(_genWeapons + _grWeapons),false] call BIS_fnc_addVirtualWeaponCargo;
		[_box,_Mags,false] call BIS_fnc_addVirtualMagazineCargo;
		[_box,(_genItems + _genClothes +_grClothes),false] call BIS_fnc_addVirtualItemCargo;
		[_box,_genBackpacks,false] call BIS_fnc_addVirtualBackpackCargo;
	};
	
	//Rifleman
	case "rhsusf_army_ocp_rifleman":
	{
		[_box,(_genWeapons + _rmWeapons),false] call BIS_fnc_addVirtualWeaponCargo;
		[_box,_Mags,false] call BIS_fnc_addVirtualMagazineCargo;
		[_box,(_genItems + _genClothes +_rmClothes),false] call BIS_fnc_addVirtualItemCargo;
		[_box,_genBackpacks,false] call BIS_fnc_addVirtualBackpackCargo;
	};
	
	//Medic
	case "rhsusf_army_ocp_medic":
	{
		[_box,(_genWeapons + _slWeapons),false] call BIS_fnc_addVirtualWeaponCargo;
		[_box,_Mags,false] call BIS_fnc_addVirtualMagazineCargo;
		[_box,(_genItems + _medItems + _genClothes +_medClothes),false] call BIS_fnc_addVirtualItemCargo;
		[_box,_medBackpacks,false] call BIS_fnc_addVirtualBackpackCargo;
	};
	
	//Pilot
	case "rhsusf_army_ocp_helipilot";
	case "rhsusf_army_ocp_helicrew":
	{
		[_box,_genWeapons,false] call BIS_fnc_addVirtualWeaponCargo;
		[_box,_Mags,false] call BIS_fnc_addVirtualMagazineCargo;
		[_box,(_genItems + _genClothes + _pilotClothes),false] call BIS_fnc_addVirtualItemCargo;
	};
	
	//Vehicle Crew
	case "rhsusf_army_ocp_crewman":
	{
		[_box,_genWeapons,false] call BIS_fnc_addVirtualWeaponCargo;
		[_box,_Mags,false] call BIS_fnc_addVirtualMagazineCargo;
		[_box,(_genItems + _genClothes + _crewClothes),false] call BIS_fnc_addVirtualItemCargo;

	};

	//Other Units
	default
	{
		[_box,_genWeapons,false] call BIS_fnc_addVirtualWeaponCargo;
		[_box,_Mags,false] call BIS_fnc_addVirtualMagazineCargo;
		[_box,(_genItems + _genClothes),false] call BIS_fnc_addVirtualItemCargo;
		[_box,_genBackpacks,false] call BIS_fnc_addVirtualBackpackCargo;
	};
};