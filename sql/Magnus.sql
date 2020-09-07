--==============================================================
--******				G O V E R N O R S				  ******
--==============================================================

--============================================
--******			Magnus				******
--============================================

-- Magnus' Surplus Logistics gives +2 production in addition to the food
INSERT INTO Modifiers
	(ModifierId , ModifierType)
VALUES
	('SURPLUS_LOGISTICS_TRADE_ROUTE_PROD' , 'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_TO_OTHERS');
INSERT INTO ModifierArguments
	(ModifierId , Name , Value)
VALUES
	('SURPLUS_LOGISTICS_TRADE_ROUTE_PROD', 'Amount', '2'),
	('SURPLUS_LOGISTICS_TRADE_ROUTE_PROD', 'Domestic', '1'),
	('SURPLUS_LOGISTICS_TRADE_ROUTE_PROD', 'YieldType', 'YIELD_PRODUCTION');
INSERT INTO GovernorPromotionModifiers
	(GovernorPromotionType, ModifierId)
VALUES
	('GOVERNOR_PROMOTION_RESOURCE_MANAGER_SURPLUS_LOGISTICS', 'SURPLUS_LOGISTICS_TRADE_ROUTE_PROD');


-- My approch to update Magnus 
-- To Debug
-- SELECT GovernorPromotionSets.*, GovernorPromotionPrereqs.PrereqGovernorPromotion
-- FROM GovernorPromotionSets
-- LEFT JOIN GovernorPromotionPrereqs ON GovernorPromotionSets.GovernorPromotion=GovernorPromotionPrereqs.GovernorPromotionType
-- ORDER BY GovernorType,PrereqGovernorPromotion;

-- Delete GOVERNOR_PROMOTION_ZONING_COMMISSIONER
DELETE FROM GovernorPromotionPrereqs WHERE GovernorPromotionType='GOVERNOR_PROMOTION_RESOURCE_MANAGER_GROUNDBREAKER' OR PrereqGovernorPromotion='GOVERNOR_PROMOTION_RESOURCE_MANAGER_GROUNDBREAKER';
DELETE FROM GovernorPromotions WHERE GovernorPromotionType='GOVERNOR_PROMOTION_RESOURCE_MANAGER_GROUNDBREAKER';
DELETE FROM GovernorPromotionSets WHERE GovernorPromotion='GOVERNOR_PROMOTION_RESOURCE_MANAGER_GROUNDBREAKER';
DELETE FROM GovernorPromotionModifiers WHERE GovernorPromotionType='GOVERNOR_PROMOTION_RESOURCE_MANAGER_GROUNDBREAKER';

-- Change base
DELETE FROM GovernorPromotionPrereqs WHERE GovernorPromotionType='GOVERNOR_PROMOTION_RESOURCE_MANAGER_BLACK_MARKETEER' OR PrereqGovernorPromotion='GOVERNOR_PROMOTION_RESOURCE_MANAGER_BLACK_MARKETEER';
UPDATE GovernorPromotions SET Level=0,Column=1,BaseAbility=1 WHERE GovernorPromotionType='GOVERNOR_PROMOTION_RESOURCE_MANAGER_BLACK_MARKETEER';

--- LEFT UP: +20% to settlers, and do not consume
-- remove industerial bonus
DELETE FROM GovernorPromotionModifiers WHERE ModifierId='EXPEDITION_FASTER_INDUSTRIAL_DISTRICT_BUILDING_CONSTRUCTION';
-- +20% to settlers
INSERT INTO Modifiers
	(ModifierId, ModifierType)
VALUES
	('EPSTWEAK_MAGNUS_SETTLER_PRODUCTION', 'MODIFIER_PLAYER_UNITS_ADJUST_UNIT_PRODUCTION');

INSERT INTO ModifierArguments
	(ModifierId , Name , Value)
VALUES
	('EPSTWEAK_MAGNUS_SETTLER_PRODUCTION', 'UnitType', 'UNIT_SETTLER'),
	('EPSTWEAK_MAGNUS_SETTLER_PRODUCTION', 'Amount', '20');

INSERT INTO GovernorPromotionModifiers
	(GovernorPromotionType, ModifierId)
VALUES
	('GOVERNOR_PROMOTION_RESOURCE_MANAGER_EXPEDITION', 'EPSTWEAK_MAGNUS_SETTLER_PRODUCTION');

-- LEFT DOWN: +20% Production toward wonders 
INSERT INTO Modifiers
	(ModifierId, ModifierType)
VALUES
	('SM_PRODUCTION_WONDER_CONSTRUCTION', 'MODIFIER_SINGLE_CITY_ADJUST_WONDER_PRODUCTION');

INSERT INTO ModifierArguments
	(ModifierId , Name , Value)
VALUES
	('SM_PRODUCTION_WONDER_CONSTRUCTION', 'Amount', '20');

INSERT INTO Types
	(Type, Kind)
VALUES
	('GOVERNOR_PROMOTION_GRAND_ARCHITECT', 'KIND_GOVERNOR_PROMOTION');

INSERT INTO GovernorPromotionSets
	(GovernorType, GovernorPromotion)
VALUES
	('GOVERNOR_THE_RESOURCE_MANAGER', 'GOVERNOR_PROMOTION_GRAND_ARCHITECT');

INSERT INTO GovernorPromotions
	(GovernorPromotionType, Name, Description, Level, Column, BaseAbility)
VALUES
	('GOVERNOR_PROMOTION_GRAND_ARCHITECT', 'GOVERNOR_PROMOTION_GRAND_ARCHITECT_NAME', 'GOVERNOR_PROMOTION_GRAND_ARCHITECT_DESCRIPTION', 3, 2, 0);

INSERT INTO GovernorPromotionModifiers
	(GovernorPromotionType, ModifierId)
VALUES
	('GOVERNOR_PROMOTION_GRAND_ARCHITECT', 'SM_PRODUCTION_WONDER_CONSTRUCTION');

-- Start clean
DELETE FROM GovernorPromotionPrereqs WHERE GovernorPromotionType='GOVERNOR_PROMOTION_RESOURCE_MANAGER_BLACK_MARKETEER' OR PrereqGovernorPromotion='GOVERNOR_PROMOTION_RESOURCE_MANAGER_BLACK_MARKETEER';

INSERT INTO GovernorPromotionPrereqs
	(GovernorPromotionType, PrereqGovernorPromotion)
VALUES
	( 'GOVERNOR_PROMOTION_RESOURCE_MANAGER_EXPEDITION', 'GOVERNOR_PROMOTION_RESOURCE_MANAGER_BLACK_MARKETEER' ),
	( 'GOVERNOR_PROMOTION_RESOURCE_MANAGER_SURPLUS_LOGISTICS', 'GOVERNOR_PROMOTION_RESOURCE_MANAGER_BLACK_MARKETEER' ),
	( 'GOVERNOR_PROMOTION_RESOURCE_MANAGER_INDUSTRIALIST', 'GOVERNOR_PROMOTION_RESOURCE_MANAGER_EXPEDITION' ),
	( 'GOVERNOR_PROMOTION_GRAND_ARCHITECT', 'GOVERNOR_PROMOTION_RESOURCE_MANAGER_INDUSTRIALIST' );

UPDATE GovernorPromotions SET Column=0 WHERE GovernorPromotionType='GOVERNOR_PROMOTION_RESOURCE_MANAGER_VERTICAL_INTEGRATION';
UPDATE GovernorPromotions SET Column=1 WHERE GovernorPromotionType='GOVERNOR_PROMOTION_RESOURCE_MANAGER_INDUSTRIALIST';

-- Buff to +2 Production per Strategic
-- SELECT * FROM GovernorPromotionModifiers WHERE GovernorPromotionType LIKE '%INDUSTRIALIST%';
-- SELECT * FROM ModifierArguments WHERE ModifierId LIKE '%INFRASTRUCTURE_FASTER_%';
-- INDUSTRIALIST_PRODUCTION_FROM_STRATEGIC_RESOURCES
UPDATE ModifierArguments SET Value='2' 
WHERE ModifierId='INDUSTRIALIST_PRODUCTION_FROM_STRATEGIC_RESOURCES' AND Name='Amount';
