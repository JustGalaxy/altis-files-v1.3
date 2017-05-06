#include "..\..\script_macros.hpp"
/*
    File: fn_hudUpdate.sqf
    Author: Daniel Stuart

    Description:
    Updates the HUD when it needs to.
*/
private["_ui","_food","_water","_health","_weight","_money","_cash","_drunk"];
disableSerialization;
_ui = uiNameSpace getVariable ["playerHUD",displayNull];
if(isNull _ui) then {[] call life_fnc_hudSetup;};
_food = _ui displayCtrl 23500;
_water = _ui displayCtrl 23510;
_health = _ui displayCtrl 23515;
_weight = _ui displayCtrl 23520;
_money = _ui displayCtrl 23525;
_drunk = _ui displayCtrl 23530;
_cash = TTP_cash;
//Update food
_food ctrlSetPosition [safeZoneX+safeZoneW-0.090,safeZoneY+safeZoneH-0.581];
_food ctrlSetText format["%1", life_hunger];
_food ctrlCommit 0;
//Update Water
_water ctrlSetPosition [safeZoneX+safeZoneW-0.090,safeZoneY+safeZoneH-0.528];
_water ctrlSetText format["%1", life_thirst];
_water ctrlCommit 0;
//Update Health
_health ctrlSetPosition [safeZoneX+safeZoneW-0.090,safeZoneY+safeZoneH-0.478];
_health ctrlSetText format["%1", round((1 - (damage player)) * 100)];
_health ctrlCommit 0;
