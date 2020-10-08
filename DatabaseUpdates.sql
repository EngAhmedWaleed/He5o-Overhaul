-- Lakes +2 Food/+1 Gold Base
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ("BETTER_LAKE_FOOD", "MODIFIER_GAME_ADJUST_PLOT_YIELD", "FOODHUEY_PLOT_IS_LAKE_REQUIREMENTS"); 
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
	("BETTER_LAKE_FOOD", "YieldType", "YIELD_FOOD"),
	("BETTER_LAKE_FOOD", "Amount", "1"); 
INSERT INTO GameModifiers (ModifierId) VALUES ("BETTER_LAKE_FOOD");

--Make battering ram upgrade to siege tower
DELETE FROM UnitUpgrades WHERE Unit='UNIT_SIEGE_TOWER';
UPDATE UnitUpgrades SET UpgradeUnit='UNIT_SIEGE_TOWER' WHERE Unit='UNIT_BATTERING_RAM';

--Make battering ram and siege tower obsolete in the technology tree
UPDATE Units SET ObsoleteTech='TECH_INDUSTRIALIZATION', ObsoleteCivic=NULL WHERE UnitType='UNIT_SIEGE_TOWER';
UPDATE Units SET ObsoleteTech='TECH_SIEGE_TACTICS' 	  , ObsoleteCivic=NULL WHERE UnitType='UNIT_BATTERING_RAM';

--Increase spawn destance buffer
UPDATE GlobalParameters SET Value=ROUND(Value*1.3) WHERE Name LIKE 'START_DISTANCE_M%' AND Name LIKE '%_CIVILIZATION';

--Later Nukes
UPDATE Resources SET PrereqTech='TECH_NUCLEAR_FISSION' WHERE ResourceType='RESOURCE_URANIUM';
UPDATE Projects  SET PrereqCivic='CIVIC_NUCLEAR_PROGRAM' WHERE ProjectType ='PROJECT_OPERATION_IVY';
UPDATE Projects  SET PrereqTech=NULL, MaxPlayerInstances=0 WHERE ProjectType ='PROJECT_BUILD_NUCLEAR_DEVICE';

--Harder Nukes
UPDATE Projects SET
	Cost=Cost*2--,
--	CostProgressionParam1=500,
--	CostProgressionModel='COST_PROGRESSION_PREVIOUS_COPIES'
WHERE ProjectType ='PROJECT_BUILD_THERMONUCLEAR_DEVICE';

--Better Emergency Rewards
UPDATE GlobalParameters SET Value=1000 WHERE Name='EMERGENCY_GOLD_PER_MEMBER_PER_ERA';

-- Steel Tech looks very full, so oil is shift one tech down "No units needs it, so np".
UPDATE Resources SET PrereqTech='TECH_COMBUSTION' WHERE ResourceType='RESOURCE_OIL';
UPDATE Improvements SET PrereqTech='TECH_COMBUSTION' WHERE ImprovementType='IMPROVEMENT_OIL_WELL';

----- DEBUGING
--INSERT INTO Building_YieldChanges (BuildingType, YieldType, YieldChange) VALUES
--('BUILDING_MONUMENT','YIELD_FOOD','1000'),
--('BUILDING_MONUMENT','YIELD_PRODUCTION','1000'),
--('BUILDING_MONUMENT','YIELD_GOLD','1000');