--This file contains most of the theming bonuses added by this mod. It can be removed for compatibility purposes.

--Broadway
DELETE FROM Building_GreatWorks WHERE BuildingType='BUILDING_BROADWAY';

INSERT INTO Building_GreatWorks 
	(BuildingType, GreatWorkSlotType, NumSlots)
VALUES	
	('BUILDING_BROADWAY', 'GREATWORKSLOT_MUSIC', '3');

--Hermitage	
UPDATE Building_GreatWorks SET ThemingUniquePerson=1 WHERE BuildingType='BUILDING_HERMITAGE';
UPDATE Building_GreatWorks SET ThemingSameObjectType=1 WHERE BuildingType='BUILDING_HERMITAGE';
UPDATE Building_GreatWorks SET ThemingYieldMultiplier='200' WHERE BuildingType='BUILDING_HERMITAGE';
UPDATE Building_GreatWorks SET ThemingTourismMultiplier='200' WHERE BuildingType='BUILDING_HERMITAGE';
--UPDATE Building_GreatWorks SET NonUniquePersonYield='1' WHERE BuildingType='BUILDING_HERMITAGE';
--UPDATE Building_GreatWorks SET NonUniquePersonTourism='1' WHERE BuildingType='BUILDING_HERMITAGE';
UPDATE Building_GreatWorks SET ThemingBonusDescription='LOC_MAGIL_WW_THEMINGBONUS_HERMITAGE' WHERE BuildingType='BUILDING_HERMITAGE';

--Sydney Opera House
UPDATE Building_GreatWorks SET NumSlots="3" WHERE BuildingType='BUILDING_SYDNEY_OPERA_HOUSE';
UPDATE Building_GreatWorks SET ThemingUniquePerson=1 WHERE BuildingType='BUILDING_SYDNEY_OPERA_HOUSE';
UPDATE Building_GreatWorks SET ThemingYieldMultiplier='50' WHERE BuildingType='BUILDING_SYDNEY_OPERA_HOUSE';
UPDATE Building_GreatWorks SET ThemingTourismMultiplier='50' WHERE BuildingType='BUILDING_SYDNEY_OPERA_HOUSE';
--UPDATE Building_GreatWorks SET NonUniquePersonYield='1' WHERE BuildingType='BUILDING_SYDNEY_OPERA_HOUSE';
--UPDATE Building_GreatWorks SET NonUniquePersonTourism='1' WHERE BuildingType='BUILDING_SYDNEY_OPERA_HOUSE';
UPDATE Building_GreatWorks SET ThemingBonusDescription='LOC_MAGIL_WW_THEMINGBONUS_MUSIC' WHERE BuildingType='BUILDING_SYDNEY_OPERA_HOUSE';