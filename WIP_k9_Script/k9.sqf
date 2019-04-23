/*
	"K9 War Dogs Script" by michy
	v0.9 Last updated 2017/11/30
	
	
	Commanding
		Operating Dog
			Come (Follow me)
				Go ahead (Move to there)
				Side (Move to my Side)
				Follow him (Follow him)
				Free (Stop Follow)
			Stay (stop)
				Sit
			Change Speed
				Walk
				Run
				Hurry up (Sprint)
			Take toy
		
		Throw Toy
			toy1
			toy2
			toy3
			toy4
			toy5




*/



/*
	
		Come (Follow me)
			Go ahead (Move to there)
			Side (Move to my Side)
			Follow him (Follow him)
			Free (Stop Follow)
		Stay (stop)
			Sit
		Change Speed
			Walk
			Run
			Hurry up (Sprint)
		Take toy

	Throw Toy
		toy1
		toy2
		toy3
		toy4
		toy5
	
*/

/*
"RightHand"	

ball1 attachTo [player, [-0.05,-0.05,0.05], "RightHand"]

	dog2 = createAgent ["Alsatian_Black_F", getPos player, [], 0, "CAN_COLLIDE"];
	dog1 setVariable ["dogCommand", false];
		
		_dog1ActOn = player addAction [
		"Command Dog 1",
		{dog1 setVariable ["dogCommand", true];},
		nil, 5.5, false, true, "",
		"cond",
		0, false, "not (dog1 getVariable "dogFollow")"
	];

Animation
DirectChat



/*Original*/
//////////////////////////////////////////////////////////////////////////////////////////

// Dog follower
BURK_dogFollowing = false;

// Spawn dog
BURK_dog = createAgent ["Fin_random_F", getPos player, [], 5, "CAN_COLLIDE"];

// Following player
BURK_dogFollowPlayer = {
	BURK_dog setVariable ["BIS_fnc_animalBehaviour_disable", true];
	
	BURK_dogFollowing = true;
	
	0 = [] spawn {
		while {BURK_dogFollowing} do 
		{
			if (alive BURK_dog) then 
			{
				BURK_dog moveTo getPos player;				
				
				sleep 0.5;
			};
		};
	};
};

// Stop following
BURK_dogStopFollowing = {
	BURK_dog setVariable ["BIS_fnc_animalBehaviour_disable", false];
	BURK_dogFollowing = false;

	BURK_dog playMove "Dog_Idle_Stop";	
};

player addAction ["Dog: Start following player", {[] call BURK_dogFollowPlayer;}];
player addAction ["Dog: Stop following", {[] call BURK_dogStopFollowing;}];
player addAction ["Dog: Default behaviour", {BURK_dog playMove "Dog_Idle_Stop";}];
player addAction ["Dog: Stop", {BURK_dog playMove "Dog_Stop";}];
player addAction ["Dog: Sit", {BURK_dog playMove "Dog_Sit";}];
player addAction ["Dog: Walk", {BURK_dog playMove "Dog_Walk";}];
player addAction ["Dog: Run", {BURK_dog playMove "Dog_Run";}];
player addAction ["Dog: Sprint", {BURK_dog playMove "Dog_Sprint";}];


/*Stable*/
//////////////////////////////////////////////////////////////////////////////////////////

if (name player == "michy") then {
	dog1 = createAgent ["Alsatian_Sandblack_F", getPos player, [], 0, "CAN_COLLIDE"];
	dog1 allowDamage false;
	dog1 setVariable ["BIS_fnc_animalBehaviour_disable", false];
	
	fn_startFollow = {
		dog1 setVariable ["BIS_fnc_animalBehaviour_disable", true];
		dog1 setVariable ["dogFollow", true];
		[] spawn {
			while {dog1 getVariable "dogFollow"} do {
				dog1 moveTo (getPos player);
				sleep 0.5;
			};
		};
	};
	
	fn_startFollowMan = {
		dog1 setVariable ["BIS_fnc_animalBehaviour_disable", true];
		dog1 setVariable ["dogFollowMan", true];
		[] spawn {
			_followMan = cursorObject;
			while {dog1 getVariable "dogFollowMan"} do {
				dog1 moveTo (getPos _followMan);
				sleep 0.5;
			};
		};
	};
	
	fn_moveToThere = {
		dog1 setVariable ["BIS_fnc_animalBehaviour_disable", true];
		dog1 setVariable ["dogMoveToThere", true];
		[] spawn {
			_movePos = screenToWorld [0.5,0.5];
			while {dog1 getVariable "dogMoveToThere"} do {
				dog1 moveTo _movePos;
				sleep 0.5;
			};
		};
	};
	
	fn_stopFollow = {
		dog1 setVariable ["BIS_fnc_animalBehaviour_disable", false];
		dog1 setVariable ["dogFollow", false];
		dog1 setVariable ["dogFollowMan", false];
		dog1 setVariable ["dogMoveToThere", false];
		dog1 playMove "Dog_Idle_Stop";
	};
	
	fn_addAct = {
		_unit = _this select 0;
		_dog1Act01 = _unit addAction ["Dog: Start Following", {[dog1] call fn_startFollow;}];
		_dog1Act02 = _unit addAction ["Dog: Start Following Man", {[dog1] call fn_startFollowMan;}];
		_dog1Act03 = _unit addAction ["Dog: Move to There", {[dog1] call fn_moveToThere;}];
		_dog1Act04 = _unit addAction ["Dog: Stop Following", {[dog1] call fn_stopFollow;}];
		_dog1Act05 = _unit addAction ["Dog: Default behaviour", {dog1 playMove "Dog_Idle_Stop";}];
		_dog1Act06 = _unit addAction ["Dog: Stop", {dog1 playMove "Dog_Stop";}];
		_dog1Act07 = _unit addAction ["Dog: Sit", {dog1 playMove "Dog_Sit";}];
		_dog1Act08 = _unit addAction ["Dog: Walk", {dog1 playMove "Dog_Walk";}];
		_dog1Act09 = _unit addAction ["Dog: Run", {dog1 playMove "Dog_Run";}];
		_dog1Act10 = _unit addAction ["Dog: Sprint", {dog1 playMove "Dog_Sprint";}];
	};
	
	[player] call fn_addAct;
	
	player addMPEventHandler ["MPRespawn", {(_this select 0) call fn_addAct;}];
};





/*NEW*/
//////////////////////////////////////////////////////////////////////////////////////////

/*
	_dogs = [
		[1,	"Fin_sand_F Balie",		"Conny"],
		[2, "Fin_blackwhite_F",		"Snoopy"],
		[3, "Fin_ocherwhite_F",		"Alex"],
		[4, "Fin_tricolour_F",		"Ieyasu"],
		[5, "Alsatian_Sand_F",		"Ela"],
		[6, "Alsatian_Black_F",		"Bond"],
		[7, "Alsatian_Sandblack_F", "Max"]
	];
*/

if (name player == "michy") then {
	_dogs = [
		[1, "Alsatian_Sandblack_F", "Max"],
		[2, "Alsatian_Black_F",		"Bond"],
		[3, "Alsatian_Sand_F",		"Ela"]
	];
	_toys = [
		["Baseball","Land_Baseball_01_F",	[[-0.04,-0.07,0.05], [[0,1,0],[0,0,1]]],  [[0,0.9,0.65], [[0,1,0],[0,0,1]]], [0,25,20]],
		["Frisbee",	"Skeet_Clay_F",			[[-0.03,-0.05,0], [[0,1,0],[-1,0,0]]],    [[0,0.9,0.65], [0,1,0],[0,0,1]]],	 [0,30,20]],
		["Football","Land_Football_01_F",	[[-0.1,-0.08,0.05], [[0,1,0],[0,0,1]]],   [[0,0.9,0.6], [[0,1,0],[0,0,1]]],  [0,20,15]],
		["HE Shell","rhs_mortar_M821_inv",	[[-0.03,0.08,0.06], [[0,0,-1],[0,1,0]]],  [[0,0.9,0.6], [[0,1,0],[1,0,0]]],  [0,20,10]],
		["Ammobox",	"Land_Ammobox_rounds_F",[[-0.03,-0.04,-0.05], [[1,0,0],[0,0,1]]], [[0,0.85,0.5], [[0,1,0],[0,0,1]]], [0,15,10]]
	];
		dogHandler = player;
	
	{
		_dog = createAgent [(_x select 1), (getPos dogHandler), [], 5, "CAN_COLLIDE"];
		_dog setName (_x select 2):
		_dog allowDamage false;
		_dog setVariable ["BIS_fnc_animalBehaviour_disable", false];
		(_dogs select _forEachIndex) set [0, _dog];
	} forEach _dogs;
	
	dog1 = (_dogs select 0) select 0;
	dog2 = (_dogs select 1) select 0;
	dog3 = (_dogs select 2) select 0;
	dog4 = (_dogs select 3) select 0;
	dog5 = (_dogs select 4) select 0;

	
	
};