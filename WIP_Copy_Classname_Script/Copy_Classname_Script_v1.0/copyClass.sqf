/*
Copy Weapons Script by michy
v1.0 Last Updated 2016/05/22
For Player's init field
	_nul = [] execVM "copyWpns.sqf";
*/


//////////Initialization

if (!isServer) exitWith {};
if (isMultiplayer) exitWith {};

tgt = {primaryWeapon player};
cwpn = call tgt;
wpn = cwpn;
wpns = [];
priThre = 5.9;

actSelectFlag = true;
actChangeFlag = false;

types = [
	[{primaryWeapon player}, 					"Rifle",							0.01],
	[{primaryWeaponItems player select 2},		"Rifle - Sights",					0.02],
	[{primaryWeaponItems player select 1},		"Rifle - Rail Attachments",			0.03],
	[{primaryWeaponItems player select 0},		"Rifle - Muzzle Attachments",		0.04],
	[{primaryWeaponItems player select 3},		"Rifle - Bipod",					0.05],
	[{primaryWeaponMagazine player select 0},	"Rifle - Magazine",					0.06],
	[{secondaryWeapon player},					"Launcher",							0.07],
	[{secondaryWeaponItems player select 2},	"Launcher - Sights",				0.08],
	[{secondaryWeaponItems player select 1},	"Launcher - Rail Attachments",		0.09],
//	[{secondaryWeaponItems player select 0},	"Launcher - Muzzle Attachments",	0.10],
//	[{secondaryWeaponItems player select 3},	"Launcher - Bipod",					0.11],
	[{secondaryWeaponMagazine player select 0},	"Launcher - Magazine",				0.12],
	[{handgunWeapon player},					"Handgn",							0.13],
	[{handgunItems player select 2},			"Handgn - Sights",					0.14],
	[{handgunItems player select 1},			"Handgn - Rail Attachments",		0.15],
	[{handgunItems player select 0},			"Handgn - Muzzle Attachments",		0.16],
//	[{handgunItems player select 3},			"Handgn - Bipod",					0.17],
	[{handgunMagazine player select 0},			"Handgn - Magazine",				0.18],
	[{uniform player},							"Uniform",							0.19],
	[{vest player},								"Vest",								0.20],
	[{backpack player},							"Backpack",							0.21],
	[{headgear player},							"Headgear",							0.22],
	[{goggles player},							"Goggles",							0.23],
	[{hmd player},								"NVGs",								0.24],
	[{binocular player},						"Binoculars",						0.25]
];



//////////Define function

actArsenal = {
	//Add open arsenal action
	actArsenalNum = player addAction [
		"<t color='#00ffff'>Open Aesenal</t>",
		{
			["Open",true] call BIS_fnc_arsenal;
		},
		nil, priThre, true, true, "", "actSelectFlag"
	];
};

actRemove = {
	//Add remove gear action
	actRemoveNum = player addAction [
		"<t color='#00ff00'>Remove All Gears</t>",
		{
			removeAllWeapons player;
			removeAllAssignedItems player;
			removeUniform player;
			removebackpack player;
			removeVest player;
			removeHeadGear player;
			removeGoggles player;
			hint "All of your Gears were removed. Hentai !!";
		},
		nil, (priThre - 0.01), true, false, "", "actSelectFlag"
	];
};

actBack = {
	//Add copy backpack action
	actBackNum = player addAction [
		"<t color='#00ff00'>Copy Backpack Items</t>",
		{
			copyToClipboard str backpackItems player;
			hint "Classnames of items in your backpack copied.";
		},
		nil, (priThre - 0.02), true, false, "", "actSelectFlag"
	];
};

actShow = {
	//Add show list action
	actShowNum = player addAction [
		"<t color='#ffc0cb'>Show Current List</t>",
		{
			hint format ["Current classname list include %1 classnames. List is ... %2", (count wpns), wpns];
		},
		nil, (priThre - 0.03), true, false, "", "actSelectFlag"
	];
};

actClear = {
	//Add clear list action
	actClearNum = player addAction [
		"<t color='#ffc0cb'>Clear List</t>",
		{
			wpns = [];
			hint "Your classname list were cleared.";
		},
		nil, (priThre - 0.04), true, false, "", "actSelectFlag"
	];
};

actSelect = {
	//Add select data type action
	actSelectNum = player addAction [
		"<t color='#ff8c00'>Select Data Type</t>",
		{
			actSelectFlag = false;
			actChangeFlag = true;
		},
		nil, (priThre - 0.05), true, false, "", "actSelectFlag"
	];
};

actChange = {
	//Add change data type action
	{
		actChangeNum = player addAction [
			("<t color='#ffd700'>Select : " + (_x select 1)) + "</t>",
			{
				tgt = ((_this select 3) select 0);
				cwpn = call tgt;
				wpn = cwpn;
				hint ("Current Data Type : " + ((_this select 3) select 1));
				actChangeFlag = false;
				actSelectFlag = true;
			},
			_x, (priThre - 0.06 - (_x select 2)), true, true, "", "actChangeFlag"
		];
		
	} forEach types;
};



//////////Main form

call actArsenal;
call actRemove;
call actBack;
call actShow;
call actClear;
call actSelect;
call actChange;

while {alive player} do {
	cwpn = call tgt;
	if !(cwpn == wpn) then{
		wpn = cwpn;
		wpns pushBack wpn;
		copyToClipboard str wpns;
	};
};
//////////EOF