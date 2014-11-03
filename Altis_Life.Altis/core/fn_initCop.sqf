#include <macro.h>
/*
	File: fn_initCop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Cop Initialization file.
*/
private["_end"];
player addRating 9999999;
waitUntil {!(isNull (findDisplay 46))};
_end = false;
if(life_blacklisted) exitWith
{
	["Blacklisted",false,true] call BIS_fnc_endMission;
	sleep 30;
};

if(!(str(player) in ["cop_1","cop_2","cop_3","cop_4"])) then {
	if((__GETC__(life_coplevel) == 0) && (__GETC__(life_adminlevel) == 0)) then {
		["NotWhitelisted",false,true] call BIS_fnc_endMission;
		sleep 35;
	};
};


player setVariable["rank",(__GETC__(life_coplevel)),true];
[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.

//Skins und Backpacks f�r Cops
[] spawn
{
while {true} do
    {
        waitUntil {uniform player == "U_Rangemaster"};
        player setObjectTextureGlobal [0,"skins\human\cop\rekrut.jpg"];
        waitUntil {uniform player != "U_Rangemaster"};
    };
};
[] spawn
{
while {true} do
    {
        waitUntil {uniform player == "U_B_CombatUniform_mcam_vest"};
        player setObjectTextureGlobal [0,"skins\human\cop\polizei_uniform.jpg"];
        waitUntil {uniform player != "U_B_CombatUniform_mcam_vest"};
    };
};
[] spawn
{
while {true} do
    {
        waitUntil {uniform player == "U_B_CombatUniform_mcam"};
        player setObjectTextureGlobal [0,"skins\human\cop\sek.jpg"];
        waitUntil {uniform player != "U_B_CombatUniform_mcam"};
    };
};
[] spawn
{
while {true} do
    {
        waitUntil {uniform player == "U_B_SpecopsUniform_sgg"};
        player setObjectTextureGlobal [0,"skins\human\cop\polizei2.jpg"];
        waitUntil {uniform player != "U_B_SpecopsUniform_sgg"};
	};
};
[] spawn
{
while {true} do
    {
        waitUntil {uniform player == "U_B_CombatUniform_mcam_worn"};
        player setObjectTextureGlobal [0,"skins\human\cop\gsg9.paa"];
        waitUntil {uniform player != "U_B_CombatUniform_mcam_worn"};
	};
};
//End CLothes

//Introcam
[] spawn life_fnc_IntroCam;