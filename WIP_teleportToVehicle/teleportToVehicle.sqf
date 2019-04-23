/*
	Teleport to Vehicle for JIP by michy_REV19
	this addAction ["<t color='#0099FF'>Teleport to Vehicle</t>","teleportToVehicle.sqf"];
	Name of vehicle: "teleportVehicle"
*/

if !(local player) exitwith {};

if (teleportVehicle emptyPositions "cargo"== 0) then {
	hint "Vehicle is full of passenger.\ntry again later."
} else {
	titleText ["","BLACK IN",3];
	player moveInCargo teleportVehicle;
	hint "You moved to teleport vehicle."
};