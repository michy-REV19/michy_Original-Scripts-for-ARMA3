// Reinforcement_Group_Teleporting_Script by michy
// v1.0 Last Updated 2016/3/10
/* Place this file at [MissionRootDirectory\scripts].
for trigger On.Act
	_rf = [groupname,markername] execVM "scripts\rfGroupTeleport.sqf";
for grop leader initialization
	groupname = group this;
*/


if (!isServer) exitWith {};

private ["_group","_leader","_marker","_leaderPos","_wp"];

_group = _this select 0;
_leader = leader _group;
_marker = _this select 1;
_leaderPos = getPos _leader;
_wp = currentWaypoint _group;

{
	if((vehicle _x != _x) && (driver vehicle _x != _x)) exitWith {};
	vehicle _x setPos
	[
		(getMarkerPos _marker select 0) + ((getPos vehicle _x select 0) - (_leaderPos select 0)),
		(getMarkerPos _marker select 1) + ((getPos vehicle _x select 1) - (_leaderPos select 1)),
		0.5
	];
} forEach (units _group);

_group setCurrentWaypoint [_group, _wp +1];