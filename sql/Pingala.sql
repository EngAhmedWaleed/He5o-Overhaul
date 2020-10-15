--==============================================================
--******				G O V E R N O R S				  ******
--==============================================================

--============================================
--******			Pingala				******
--============================================

-- create Pingala's science from trade routes ability and apply to middle right ability -- ok
INSERT INTO Modifiers
	(ModifierId, ModifierType)
VALUES
	('EDUCATOR_SCIENCE_FROM_DOMESTIC_TRADE_BBG', 'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_TO_OTHERS');
INSERT INTO ModifierArguments
	(ModifierId, Name, Value)
VALUES
	('EDUCATOR_SCIENCE_FROM_DOMESTIC_TRADE_BBG', 'Domestic', '1'),
	('EDUCATOR_SCIENCE_FROM_DOMESTIC_TRADE_BBG', 'Amount', '3'),
	('EDUCATOR_SCIENCE_FROM_DOMESTIC_TRADE_BBG', 'YieldType', 'YIELD_SCIENCE');
INSERT INTO Types
	(Type, Kind)
VALUES
	('GOVERNOR_PROMOTION_EDUCATOR_TRADE_BBG', 'KIND_GOVERNOR_PROMOTION');
INSERT INTO GovernorPromotionSets
	(GovernorType, GovernorPromotion)
VALUES
	('GOVERNOR_THE_EDUCATOR', 'GOVERNOR_PROMOTION_EDUCATOR_TRADE_BBG');
INSERT INTO GovernorPromotions
	(GovernorPromotionType, Name, Description, Level, Column, BaseAbility)
VALUES
	('GOVERNOR_PROMOTION_EDUCATOR_TRADE_BBG', 'LOC_GOVERNOR_PROMOTION_EDUCATOR_KNOWLEDGE_NAME', 'LOC_GOVERNOR_PROMOTION_EDUCATOR_KNOWLEDGE_DESCRIPTION', 2, 2, 0);
INSERT INTO GovernorPromotionModifiers
	(GovernorPromotionType, ModifierId)
VALUES
	('GOVERNOR_PROMOTION_EDUCATOR_TRADE_BBG', 'EDUCATOR_SCIENCE_FROM_DOMESTIC_TRADE_BBG');
DELETE FROM GovernorPromotionPrereqs WHERE GovernorPromotionType='GOVERNOR_PROMOTION_EDUCATOR_SPACE_INITIATIVE';
INSERT INTO GovernorPromotionPrereqs
	(GovernorPromotionType, PrereqGovernorPromotion)
VALUES
	('GOVERNOR_PROMOTION_EDUCATOR_TRADE_BBG', 'GOVERNOR_PROMOTION_EDUCATOR_RESEARCHER'),
	('GOVERNOR_PROMOTION_EDUCATOR_SPACE_INITIATIVE', 'GOVERNOR_PROMOTION_EDUCATOR_TRADE_BBG');

-- Pingala's double adajacency added to researcher -- ok
INSERT INTO Modifiers
	(ModifierId, ModifierType)
VALUES
	('EDUCATOR_DOUBLE_CAMPUS_ADJ_MODIFIER_BBG', 'MODIFIER_CITY_DISTRICTS_ADJUST_YIELD_MODIFIER');
INSERT INTO ModifierArguments
	(ModifierId, Name, Value)
VALUES
	('EDUCATOR_DOUBLE_CAMPUS_ADJ_MODIFIER_BBG', 'Amount', '100'),
	('EDUCATOR_DOUBLE_CAMPUS_ADJ_MODIFIER_BBG', 'YieldType', 'YIELD_SCIENCE');
INSERT INTO GovernorPromotionModifiers
	(GovernorPromotionType, ModifierId)
VALUES
	('GOVERNOR_PROMOTION_EDUCATOR_RESEARCHER', 'EDUCATOR_DOUBLE_CAMPUS_ADJ_MODIFIER_BBG');
UPDATE GovernorPromotions SET Column=1 WHERE GovernorPromotionType='GOVERNOR_PROMOTION_EDUCATOR_RESEARCHER';


-- +1 Sience from rainforest
INSERT INTO Types
	(Type, Kind)
VALUES
	('GOVERNOR_PROMOTION_RAINFOREST_SCIENCE', 'KIND_GOVERNOR_PROMOTION');

INSERT INTO GovernorPromotionSets
	(GovernorType, GovernorPromotion)
VALUES
	('GOVERNOR_THE_EDUCATOR', 'GOVERNOR_PROMOTION_RAINFOREST_SCIENCE');

INSERT INTO GovernorPromotions
	(GovernorPromotionType, Name, Description, Level, Column, BaseAbility)
VALUES
	('GOVERNOR_PROMOTION_RAINFOREST_SCIENCE', 'GOVERNOR_PROMOTION_RAINFOREST_SCIENCE_NAME', 'GOVERNOR_PROMOTION_RAINFOREST_SCIENCE_DESCRIPTION', 2, 0, 0);

INSERT INTO GovernorPromotionModifiers
	(GovernorPromotionType, ModifierId)
VALUES
	('GOVERNOR_PROMOTION_RAINFOREST_SCIENCE', 'ZOO_RAINFOREST_SCIENCE');
INSERT INTO GovernorPromotionPrereqs
	(GovernorPromotionType, PrereqGovernorPromotion)
VALUES
	('GOVERNOR_PROMOTION_RAINFOREST_SCIENCE', 'GOVERNOR_PROMOTION_EDUCATOR_RESEARCHER');

-- +25% Production towards all Projects.
INSERT INTO Types
	(Type, Kind)
VALUES
	( "GOVERNOR_PROMOTION_RESOURCE_ALLOCATION", "KIND_GOVERNOR_PROMOTION"),
	( "GOVERNOR_PROMOTION_RESOURCE_ALLOCATION_MODIFIER", "KIND_MODIFIER");

INSERT INTO GovernorPromotions
	(GovernorPromotionType, Name, Description, Level, Column)
VALUES
	("GOVERNOR_PROMOTION_RESOURCE_ALLOCATION", "LOC_GOVERNOR_PROMOTION_NAME_RESOURCE_ALLOCATION", "LOC_GOVERNOR_PROMOTION_DESC_RESOURCE_ALLOCATION", 3, 0);

---// Better way to include all projects
-- Tmp Table
CREATE TABLE PingalaProjects
(
	ProjectType TEXT NOT NULL UNIQUE,
	ModifierName TEXT NOT NULL
);

Insert into PingalaProjects
	(ProjectType, ModifierName)
Select Projects.ProjectType, 'RESOURCE_ALLOCATION_MODIFIER_' || Projects.ProjectType
FROM Projects;

Insert into Modifiers
	(ModifierId, ModifierType)
Select PingalaProjects.ModifierName, 'MODIFIER_SINGLE_CITY_ADJUST_PROJECT_PRODUCTION'
FROM PingalaProjects;

INSERT INTO ModifierArguments
	( ModifierId, Name, Value)
Select PingalaProjects.ModifierName, 'ProjectType', PingalaProjects.ProjectType
FROM PingalaProjects;

INSERT INTO ModifierArguments
	( ModifierId, Name, Value)
Select PingalaProjects.ModifierName, 'Amount', '25'
FROM PingalaProjects;

INSERT INTO GovernorPromotionModifiers
	(GovernorPromotionType, ModifierId)
Select 'GOVERNOR_PROMOTION_RESOURCE_ALLOCATION', PingalaProjects.ModifierName
FROM PingalaProjects;

DROP TABLE PingalaProjects;
---//

INSERT INTO GovernorPromotionSets
	(GovernorType, GovernorPromotion)
VALUES
	("GOVERNOR_THE_EDUCATOR", "GOVERNOR_PROMOTION_RESOURCE_ALLOCATION");
INSERT INTO GovernorPromotionPrereqs
	(GovernorPromotionType, PrereqGovernorPromotion)
VALUES
	("GOVERNOR_PROMOTION_RESOURCE_ALLOCATION", "GOVERNOR_PROMOTION_RAINFOREST_SCIENCE");


-- Delete GOVERNOR_PROMOTION_EDUCATOR_ARMS_RACE_PROPONENT
DELETE FROM GovernorPromotionPrereqs WHERE GovernorPromotionType='GOVERNOR_PROMOTION_EDUCATOR_ARMS_RACE_PROPONENT' OR PrereqGovernorPromotion='GOVERNOR_PROMOTION_EDUCATOR_ARMS_RACE_PROPONENT';
DELETE FROM GovernorPromotions WHERE GovernorPromotionType='GOVERNOR_PROMOTION_EDUCATOR_ARMS_RACE_PROPONENT';
DELETE FROM GovernorPromotionSets WHERE GovernorPromotion='GOVERNOR_PROMOTION_EDUCATOR_ARMS_RACE_PROPONENT';
DELETE FROM GovernorPromotionModifiers WHERE GovernorPromotionType='GOVERNOR_PROMOTION_EDUCATOR_ARMS_RACE_PROPONENT';

-- Buff to 50%
-- SELECT * FROM GovernorPromotionModifiers WHERE GovernorPromotionType LIKE '%ReSearcher%';
-- RESEARCHER_FASTER_CAMPUS_BUILDING_CONSTRUCTION
UPDATE ModifierArguments SET Value='50' 
WHERE ModifierId IN ('RESEARCHER_FASTER_CAMPUS_BUILDING_CONSTRUCTION') AND Name='Amount';
UPDATE ModifierArguments SET Value='50' 
WHERE ModifierId LIKE '%EDUCATOR_FASTER_%' AND Name='Amount';
-- Make it 20%
UPDATE ModifierArguments SET Value='20' 
WHERE ModifierId IN ('LIBRARIAN_SCIENCE_YIELD_BONUS') AND Name='Amount';
