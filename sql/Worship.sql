-- All worship building base faith increased
UPDATE Building_YieldChanges SET YieldChange='4' WHERE BuildingType='BUILDING_CATHEDRAL' AND YieldType='YIELD_FAITH';
UPDATE Building_YieldChanges SET YieldChange='4' WHERE BuildingType='BUILDING_GURDWARA' AND YieldType='YIELD_FAITH';
UPDATE Building_YieldChanges SET YieldChange='4' WHERE BuildingType='BUILDING_MEETING_HOUSE' AND YieldType='YIELD_FAITH';
UPDATE Building_YieldChanges SET YieldChange='6' WHERE BuildingType='BUILDING_MOSQUE' AND YieldType='YIELD_FAITH';
UPDATE Building_YieldChanges SET YieldChange='4' WHERE BuildingType='BUILDING_PAGODA' AND YieldType='YIELD_FAITH';
UPDATE Building_YieldChanges SET YieldChange='6' WHERE BuildingType='BUILDING_SYNAGOGUE' AND YieldType='YIELD_FAITH';
UPDATE Building_YieldChanges SET YieldChange='4' WHERE BuildingType='BUILDING_WAT' AND YieldType='YIELD_FAITH';
UPDATE Building_YieldChanges SET YieldChange='4' WHERE BuildingType='BUILDING_STUPA' AND YieldType='YIELD_FAITH';
UPDATE Building_YieldChanges SET YieldChange='4' WHERE BuildingType='BUILDING_DAR_E_MEHR' AND YieldType='YIELD_FAITH';

-- Bonus from eras
INSERT INTO Building_YieldsPerEra
	(BuildingType ,YieldType ,YieldChange)
VALUES
	('BUILDING_GURDWARA'		, 'YIELD_FOOD'		, '1'),
	('BUILDING_MEETING_HOUSE'	, 'YIELD_PRODUCTION', '1'),
	('BUILDING_SYNAGOGUE'		, 'YIELD_FAITH'		, '2'),
	('BUILDING_WAT'				, 'YIELD_SCIENCE'	, '1'),
	('BUILDING_DAR_E_MEHR'		, 'YIELD_CULTURE'	, '1');
-- Reduce base yield
UPDATE Building_YieldChanges SET YieldChange='1' 
WHERE 
	(BuildingType='BUILDING_GURDWARA' AND YieldType='YIELD_FOOD')
	OR (BuildingType='BUILDING_MEETING_HOUSE' AND YieldType='YIELD_PRODUCTION')
	OR (BuildingType='BUILDING_WAT' AND YieldType='YIELD_SCIENCE')
	OR (BuildingType='BUILDING_DAR_E_MEHR' AND YieldType='YIELD_CULTURE');

--- Manual Buff the rest
-- Cathedral holds anything
UPDATE Building_GreatWorks SET GreatWorkSlotType='GREATWORKSLOT_PALACE' WHERE BuildingType='BUILDING_CATHEDRAL';

-- Mosque (free)
UPDATE Buildings SET Cost='0' WHERE BuildingType='BUILDING_MOSQUE';

-- Pagoda 2 housing
UPDATE Buildings SET Housing='2' WHERE BuildingType='BUILDING_PAGODA';

-- Stupa 2 Amenity
UPDATE Buildings SET Entertainment='2' WHERE BuildingType='BUILDING_STUPA';
