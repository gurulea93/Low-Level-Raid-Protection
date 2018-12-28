# Prevent Low Level Raiding for ExileMod (Exile 1.0.4)

by [FPS]kuplion

## Install Instructions..

Copy the contents of CfgExileCustomCode.hpp to the "CfgExileCustomCode" of your mission file config.cpp.

Copy the "Custom" folder to the root of your mission file (if you change this location, don't forget to update your file paths in the "CfgExileCustomCode" section.)

Copy the contents of CfgSaveTheBambis.hpp to the top of your mission file config.cpp, just above "class CfgClans".

Open exile.ini an add 

//////////////for x32

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Territory Protection Expire Count
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
[loadTerritoryDays]
SQL1_1 = SELECT DATEDIFF(NOW(),`created_at`) from territory where `id` = ?
Number of Inputs = 1
SQL1_INPUTS = 1
OUTPUT = 1

/////////////////for x64

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Territory Protection Expire Count
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
[loadTerritoryDays]
SQL1_1 = SELECT DATEDIFF(NOW(),`created_at`) from territory where `id` = ?

SQL1_INPUTS = 1
OUTPUT = 1
