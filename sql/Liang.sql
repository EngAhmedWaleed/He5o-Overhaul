--==============================================================
--******				G O V E R N O R S				  ******
--==============================================================

--============================================
--******			Liang				******
--============================================

-- GOVERNOR_PROMOTION_ARCHITECT LEFT
-- GOVERNOR_PROMOTION_INFRASTRUCTURE RIGHT
DELETE FROM GovernorPromotionPrereqs WHERE GovernorPromotionType='GOVERNOR_PROMOTION_INFRASTRUCTURE' OR PrereqGovernorPromotion='GOVERNOR_PROMOTION_INFRASTRUCTURE';
INSERT INTO GovernorPromotionPrereqs
	(GovernorPromotionType, PrereqGovernorPromotion)
VALUES
	('GOVERNOR_PROMOTION_INFRASTRUCTURE', 'GOVERNOR_PROMOTION_BUILDER_GUILDMASTER');
UPDATE GovernorPromotions SET Level=1, Column=2 WHERE GovernorPromotionType='GOVERNOR_PROMOTION_INFRASTRUCTURE';

-- Move promoter from Amany
UPDATE GovernorPromotionSets SET GovernorType='GOVERNOR_THE_BUILDER' WHERE GovernorPromotion='GOVERNOR_PROMOTION_AMBASSADOR_PROMOTER';
UPDATE GovernorPromotions SET Level=1, Column=0 WHERE GovernorPromotionType='GOVERNOR_PROMOTION_AMBASSADOR_PROMOTER';
DELETE FROM GovernorPromotionPrereqs WHERE GovernorPromotionType='GOVERNOR_PROMOTION_AMBASSADOR_PROMOTER' OR PrereqGovernorPromotion='GOVERNOR_PROMOTION_AMBASSADOR_PROMOTER';
INSERT INTO GovernorPromotionPrereqs
	(GovernorPromotionType, PrereqGovernorPromotion)
VALUES
	('GOVERNOR_PROMOTION_AMBASSADOR_PROMOTER', 'GOVERNOR_PROMOTION_BUILDER_GUILDMASTER');

-- +1 food on every resource
INSERT INTO Modifiers
	(ModifierId, ModifierType, SubjectRequirementSetId)
VALUES
	('GOVERNOR_PROMOTION_AGRICULTURE_FOOD', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'GOVERNOR_PROMOTION_AGRICULTURE_FOOD_REQUIREMENTS');
INSERT INTO ModifierArguments
	(ModifierId , Name , Value)
VALUES
	('GOVERNOR_PROMOTION_AGRICULTURE_FOOD' , 'YieldType' , 'YIELD_FOOD');
INSERT INTO ModifierArguments
	(ModifierId , Name , Value)
VALUES
	('GOVERNOR_PROMOTION_AGRICULTURE_FOOD' , 'Amount' , '1');
INSERT INTO RequirementSets
	(RequirementSetId , RequirementSetType)
VALUES
	('GOVERNOR_PROMOTION_AGRICULTURE_FOOD_REQUIREMENTS' , 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements
	(RequirementSetId , RequirementId)
VALUES
	('GOVERNOR_PROMOTION_AGRICULTURE_FOOD_REQUIREMENTS' , 'REQUIRES_PLOT_HAS_VISIBLE_RESOURCE');
INSERT INTO Types
	(Type, Kind)
VALUES
	('GOVERNOR_PROMOTION_AGRICULTURE', 'KIND_GOVERNOR_PROMOTION');
INSERT INTO GovernorPromotionSets
	(GovernorType, GovernorPromotion)
VALUES
	('GOVERNOR_THE_BUILDER', 'GOVERNOR_PROMOTION_AGRICULTURE');
INSERT INTO GovernorPromotions
	(GovernorPromotionType, Name, Description, Level, Column)
VALUES
	('GOVERNOR_PROMOTION_AGRICULTURE', 'LOC_GOVERNOR_PROMOTION_AGRICULTURE_NAME', 'LOC_GOVERNOR_PROMOTION_AGRICULTURE_DESCRIPTION', 1, 2);
INSERT INTO GovernorPromotionModifiers
	(GovernorPromotionType, ModifierId)
VALUES
	('GOVERNOR_PROMOTION_AGRICULTURE', 'GOVERNOR_PROMOTION_AGRICULTURE_FOOD');
INSERT INTO GovernorPromotionPrereqs
	(GovernorPromotionType, PrereqGovernorPromotion)
VALUES
	('GOVERNOR_PROMOTION_AGRICULTURE', 'GOVERNOR_PROMOTION_INFRASTRUCTURE');
UPDATE GovernorPromotions SET Level=2, Column=2 WHERE GovernorPromotionType='GOVERNOR_PROMOTION_AGRICULTURE';

-- Better parks
UPDATE Improvement_YieldChanges SET YieldChange=3 WHERE ImprovementType='IMPROVEMENT_CITY_PARK' AND YieldType='YIELD_CULTURE';
INSERT INTO Improvement_YieldChanges
	(ImprovementType, YieldType, YieldChange)
VALUES
	('IMPROVEMENT_CITY_PARK', 'YIELD_SCIENCE', 3);
INSERT INTO Improvement_YieldChanges
	(ImprovementType, YieldType, YieldChange)
VALUES
	('IMPROVEMENT_CITY_PARK', 'YIELD_GOLD', 3);
UPDATE Modifiers SET SubjectRequirementSetId=NULL WHERE ModifierId='CITY_PARK_WATER_AMENITY';
INSERT INTO Modifiers
	(ModifierId, ModifierType)
VALUES
	('CITY_PARK_HOUSING_BBG', 'MODIFIER_SINGLE_CITY_ADJUST_IMPROVEMENT_HOUSING');
INSERT INTO ModifierArguments
	(ModifierId , Name , Value)
VALUES
	('CITY_PARK_HOUSING_BBG' , 'Amount' , '1');
INSERT INTO ImprovementModifiers
	(ImprovementType, ModifierID)
VALUES
	('IMPROVEMENT_CITY_PARK', 'CITY_PARK_HOUSING_BBG');
DELETE FROM ImprovementModifiers WHERE ModifierID='CITY_PARK_GOVERNOR_CULTURE';
DELETE FROM Improvement_ValidTerrains WHERE ImprovementType='IMPROVEMENT_CITY_PARK' AND TerrainType='TERRAIN_DESERT_HILLS';
DELETE FROM Improvement_ValidTerrains WHERE ImprovementType='IMPROVEMENT_CITY_PARK' AND TerrainType='TERRAIN_GRASS_HILLS';
DELETE FROM Improvement_ValidTerrains WHERE ImprovementType='IMPROVEMENT_CITY_PARK' AND TerrainType='TERRAIN_PLAINS_HILLS';
DELETE FROM Improvement_ValidTerrains WHERE ImprovementType='IMPROVEMENT_CITY_PARK' AND TerrainType='TERRAIN_SNOW_HILLS';
DELETE FROM Improvement_ValidTerrains WHERE ImprovementType='IMPROVEMENT_CITY_PARK' AND TerrainType='TERRAIN_TUNDRA_HILLS';
UPDATE Improvements SET OnePerCity=1 WHERE ImprovementType='IMPROVEMENT_CITY_PARK';

-- Move parks
DELETE FROM GovernorPromotionPrereqs WHERE GovernorPromotionType='GOVERNOR_PROMOTION_PARKS_RECREATION' OR PrereqGovernorPromotion='GOVERNOR_PROMOTION_PARKS_RECREATION';
INSERT INTO GovernorPromotionPrereqs
	( GovernorPromotionType, PrereqGovernorPromotion )
VALUES
	( 'GOVERNOR_PROMOTION_PARKS_RECREATION', 'GOVERNOR_PROMOTION_AMBASSADOR_PROMOTER' );
UPDATE GovernorPromotions SET Level=2, Column=0 WHERE GovernorPromotionType='GOVERNOR_PROMOTION_PARKS_RECREATION';

-- +1 prod for each tile
INSERT INTO Modifiers
	(ModifierId, ModifierType)
VALUES
	('ZONING_COMMISH_PRODUCTION_MODIFIER', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD');

INSERT INTO ModifierArguments
	(ModifierId , Name , Value)
VALUES
	('ZONING_COMMISH_PRODUCTION_MODIFIER', 'YieldType', 'YIELD_PRODUCTION'),
	('ZONING_COMMISH_PRODUCTION_MODIFIER', 'Amount', '1');

INSERT INTO Types
	(Type, Kind)
VALUES
	('GOVERNOR_PROMOTION_ZONING_COMMISH_PRODUCTION', 'KIND_GOVERNOR_PROMOTION');

INSERT INTO GovernorPromotionSets
	(GovernorType, GovernorPromotion)
VALUES
	('GOVERNOR_THE_BUILDER', 'GOVERNOR_PROMOTION_ZONING_COMMISH_PRODUCTION');

INSERT INTO GovernorPromotions
	(GovernorPromotionType, Name, Description, Level, Column, BaseAbility)
VALUES
	('GOVERNOR_PROMOTION_ZONING_COMMISH_PRODUCTION', 'GOVERNOR_PROMOTION_ZONING_COMMISH_PRODUCTION_NAME', 'GOVERNOR_PROMOTION_ZONING_COMMISH_PRODUCTION_DESCRIPTION', 3, 1, 0);

INSERT INTO GovernorPromotionModifiers
	(GovernorPromotionType, ModifierId)
VALUES
	('GOVERNOR_PROMOTION_ZONING_COMMISH_PRODUCTION', 'ZONING_COMMISH_PRODUCTION_MODIFIER');

INSERT INTO GovernorPromotionPrereqs
	(GovernorPromotionType, PrereqGovernorPromotion)
VALUES
	( 'GOVERNOR_PROMOTION_ZONING_COMMISH_PRODUCTION', 'GOVERNOR_PROMOTION_PARKS_RECREATION' ),
	( 'GOVERNOR_PROMOTION_ZONING_COMMISH_PRODUCTION', 'GOVERNOR_PROMOTION_AGRICULTURE' );

-- Delete GOVERNOR_PROMOTION_AQUACULTURE
DELETE FROM GovernorPromotionPrereqs WHERE GovernorPromotionType='GOVERNOR_PROMOTION_AQUACULTURE' OR PrereqGovernorPromotion='GOVERNOR_PROMOTION_AQUACULTURE';
DELETE FROM GovernorPromotions WHERE GovernorPromotionType='GOVERNOR_PROMOTION_AQUACULTURE';
DELETE FROM GovernorPromotionSets WHERE GovernorPromotion='GOVERNOR_PROMOTION_AQUACULTURE';
DELETE FROM GovernorPromotionModifiers WHERE GovernorPromotionType='GOVERNOR_PROMOTION_AQUACULTURE';

-- Delete GOVERNOR_PROMOTION_ARCHITECT
DELETE FROM GovernorPromotionPrereqs WHERE GovernorPromotionType='GOVERNOR_PROMOTION_ARCHITECT' OR PrereqGovernorPromotion='GOVERNOR_PROMOTION_ARCHITECT';
DELETE FROM GovernorPromotions WHERE GovernorPromotionType='GOVERNOR_PROMOTION_ARCHITECT';
DELETE FROM GovernorPromotionSets WHERE GovernorPromotion='GOVERNOR_PROMOTION_ARCHITECT';
DELETE FROM GovernorPromotionModifiers WHERE GovernorPromotionType='GOVERNOR_PROMOTION_ARCHITECT';

-- Delete GOVERNOR_PROMOTION_ZONING_COMMISSIONER
DELETE FROM GovernorPromotionPrereqs WHERE GovernorPromotionType='GOVERNOR_PROMOTION_ZONING_COMMISSIONER' OR PrereqGovernorPromotion='GOVERNOR_PROMOTION_ZONING_COMMISSIONER';
DELETE FROM GovernorPromotions WHERE GovernorPromotionType='GOVERNOR_PROMOTION_ZONING_COMMISSIONER';
DELETE FROM GovernorPromotionSets WHERE GovernorPromotion='GOVERNOR_PROMOTION_ZONING_COMMISSIONER';
DELETE FROM GovernorPromotionModifiers WHERE GovernorPromotionType='GOVERNOR_PROMOTION_ZONING_COMMISSIONER';

-- Add fishery to tech tree
UPDATE Improvements SET TraitType=NULL WHERE ImprovementType='IMPROVEMENT_FISHERY';
DELETE FROM ImprovementModifiers WHERE ImprovementType='IMPROVEMENT_FISHERY';
DELETE FROM Modifiers WHERE ModifierId='AQUACULTURE_CAN_BUILD_FISHERY';
DELETE FROM ModifierArguments WHERE ModifierId='AQUACULTURE_CAN_BUILD_FISHERY';
UPDATE Improvements SET PrereqTech='TECH_CARTOGRAPHY' WHERE ImprovementType='IMPROVEMENT_FISHERY';

-- Buff to 100%
-- SELECT * FROM GovernorPromotionModifiers WHERE GovernorPromotionType LIKE '%GOVERNOR_PROMOTION_INFRASTRUCTURE%';
-- SELECT * FROM ModifierArguments WHERE ModifierId LIKE '%INFRASTRUCTURE_FASTER_%';
UPDATE ModifierArguments SET Value='100' 
WHERE ModifierId LIKE '%INFRASTRUCTURE_FASTER_%' AND Name='Amount';