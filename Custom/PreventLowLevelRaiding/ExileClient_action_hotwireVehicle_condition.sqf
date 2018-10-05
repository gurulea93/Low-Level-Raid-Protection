/**
 * ExileClient_action_hotwireVehicle_condition
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_vehicle","_result","_saveTheBambis","_protectionMessage","_noMoreProtectionNow","_territory"];
_vehicle = _this;
_result = "";
try 
{
	if (ExilePlayerInSafezone) then
	{
		throw "You are in a safe zone!";
	};
	if (ExileClientPlayerIsInCombat) then
	{
		throw "You are in combat!";
	};
	switch (locked _vehicle) do 
	{
		case 0:	{ throw "Vehicle is not locked!"; };
		case 1:	{ throw "Vehicle does not have a lock!"; };
	};
	if !("Exile_Item_Knife" in (magazines player)) then
	{
		throw "You need a knife!";
	};
	if ((_vehicle distance player) > 7) then 
	{
		throw "You are too far away!";
	};
	// Prevent Low Level Raiding
	_saveTheBambis = getNumber (missionConfigFile >> "CfgSaveTheBambis" >> "enabled");
	_protectionMessage = getText (missionConfigFile >> "CfgSaveTheBambis" >> "protectionMessage");
	_noMoreProtectionNow = getNumber (missionConfigFile >> "CfgSaveTheBambis" >> "stopProtectionLevel");
	_territory = _vehicle call ExileClient_util_world_getTerritoryAtPosition;
	if !(isNull _territory) then
	{
		if ((_saveTheBambis > 0) && (_territory getVariable ["ExileTerritoryLevel", 1]) < _noMoreProtectionNow) then
		{
			throw _protectionMessage;
		};
	};
}
catch 
{
	_result = _exception;
};
_result