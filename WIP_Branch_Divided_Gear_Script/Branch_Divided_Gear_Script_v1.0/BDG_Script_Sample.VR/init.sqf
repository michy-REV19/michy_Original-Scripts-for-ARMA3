if (!isDedicated) then {waitUntil {!isNull player && isPlayer player};};
enableRadio false;

_BDGear = [] call compile preprocessFileLineNumbers "scripts\BDGear.sqf";
waitUntil{scriptDone _BDGear};