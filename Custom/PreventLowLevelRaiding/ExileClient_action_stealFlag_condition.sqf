/**
 * ExileClient_action_stealFlag_condition
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_flagObject","_result","_buildRights","_saveTheBambis","_protectionMessage","_noMoreProtectionNow","_territory"];
_flagObject = _this;
_result = "";
try 
{
	if (isNull _flagObject) then
	{
		throw "Invalid flag object";
	};
	if ((_flagObject getvariable ["ExileFlagStolen", 0]) isEqualTo 1) then
	{
		throw "Cannot steal a flag twice!";
	};
	if ((_flagObject distance2D player) > 2) then 
	{
		throw "You are too far away!";
	};
	if (((getPosASL player) select 2) > (((getPosASL _flagObject) select 2) + 4)) then 
	{
		throw "You cannot steal flags at the top of the pole!";
	};
	_buildRights = _flagObject getVariable ["ExileTerritoryBuildRights",[]];
	if ((getPlayerUID player) in _buildRights) then
	{
		throw "You cannot steal your own flag!";
	};
	// Prevent Low Level Raiding
	_saveTheBambis = getNumber (missionConfigFile >> "CfgSaveTheBambis" >> "enabled");
	_protectionMessage = getText (missionConfigFile >> "CfgSaveTheBambis" >> "protectionMessage");
	_noMoreProtectionNow = getNumber (missionConfigFile >> "CfgSaveTheBambis" >> "stopProtectionLevel");
	_territory = _flagObject call ExileClient_util_world_getTerritoryAtPosition;
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