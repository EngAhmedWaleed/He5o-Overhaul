-- Texts are not imported.

--==============================================================
--******				R E L I G I O N					  ******
--==============================================================

-- Give monks wall breaker ability
INSERT INTO Modifiers
	(ModifierId, ModifierType)
VALUES
	('ENABLE_WALL_ATTACK_WHOLE_GAME_MONK_BBG', 'MODIFIER_PLAYER_UNITS_ADJUST_ENABLE_WALL_ATTACK_WHOLE_GAME_PROMOTION_CLASS');
INSERT INTO ModifierArguments
	(ModifierId, Name, Value)
VALUES
	('ENABLE_WALL_ATTACK_WHOLE_GAME_MONK_BBG', 'PromotionClass', 'PROMOTION_CLASS_MONK');
INSERT INTO UnitAbilities
	(UnitAbilityType)
VALUES
	('WARRIOR_MONK_WALL_BREAKER_BBG');
INSERT INTO UnitAbilityModifiers
	(UnitAbilityType, ModifierId)
VALUES
	('WARRIOR_MONK_WALL_BREAKER_BBG', 'ENABLE_WALL_ATTACK_WHOLE_GAME_MONK_BBG');

-- Nerf Inquisitors
UPDATE Units SET ReligionEvictPercent=50, SpreadCharges=2 WHERE UnitType='UNIT_INQUISITOR';

-- Religious spread from trade routes increased
UPDATE GlobalParameters SET Value='2.0' WHERE Name='RELIGION_SPREAD_TRADE_ROUTE_PRESSURE_FOR_DESTINATION';
UPDATE GlobalParameters SET Value='1.0' WHERE Name='RELIGION_SPREAD_TRADE_ROUTE_PRESSURE_FOR_ORIGIN';

-- Divine Inspiration yield increased
UPDATE ModifierArguments SET Value='6' WHERE ModifierId='DIVINE_INSPIRATION_WONDER_FAITH_MODIFIER' AND Name='Amount';

-- Crusader +7 instead of +10
UPDATE ModifierArguments SET Value='7' WHERE ModifierId='JUST_WAR_COMBAT_BONUS_MODIFIER';

-- Lay Ministry now +2 Culture and +2 Faith per Theater and Holy Site
UPDATE ModifierArguments SET Value='2' WHERE ModifierId='LAY_MINISTRY_CULTURE_DISTRICTS_MODIFIER' AND Name='Amount';
UPDATE ModifierArguments SET Value='2' WHERE ModifierId='LAY_MINISTRY_FAITH_DISTRICTS_MODIFIER' AND Name='Amount';

-- Itinerant Preachers now causes a Religion to spread 40% father away instead of only 30%
UPDATE ModifierArguments SET Value='4' WHERE ModifierId='ITINERANT_PREACHERS_SPREAD_DISTANCE';

-- Cross-Cultural Dialogue is now +1 Science for every 3 foreign followers
UPDATE ModifierArguments SET Value='3' WHERE ModifierId='CROSS_CULTURAL_DIALOGUE_SCIENCE_FOREIGN_FOLLOWER_MODIFIER' AND Name='PerXItems';

-- Pilgrimmage now gives 3 Faith instead of 2 for each foreign city converted
UPDATE ModifierArguments SET Value='3' WHERE ModifierId='PILGRIMAGE_FAITH_FOREIGN_CITY_MODIFIER' AND Name='Amount';

-- Tithe is now +1 Gold for every 3 followers
UPDATE ModifierArguments SET Value='3' WHERE ModifierId='TITHE_GOLD_FOLLOWER_MODIFIER' AND Name='PerXItems';

-- World Church is now +1 Culture for every 3 foreign followers
UPDATE ModifierArguments SET Value='3' WHERE ModifierId='WORLD_CHURCH_CULTURE_FOREIGN_FOLLOWER_MODIFIER' AND Name='PerXItems';

-- Zen Meditation now only requires 1 District to get the +1 Amentity
UPDATE RequirementArguments SET Value='1' WHERE RequirementId='REQUIRES_CITY_HAS_2_SPECIALTY_DISTRICTS' AND Name='Amount';

-- Religious Communities now gives +1 Housing to Holy Sites, like it does for Shines and Temples
INSERT INTO Modifiers
	(ModifierId , ModifierType , SubjectRequirementSetId)
VALUES
	('RELIGIOUS_COMMUNITY_HOLY_SITE_HOUSING' , 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER' , 'CITY_FOLLOWS_RELIGION_HAS_HOLY_SITE');
INSERT INTO Modifiers
	(ModifierId , ModifierType)
VALUES
	('RELIGIOUS_COMMUNITY_HOLY_SITE_HOUSING_MODIFIER' , 'MODIFIER_SINGLE_CITY_ADJUST_BUILDING_HOUSING');
INSERT INTO ModifierArguments
	(ModifierId , Name , Value)
VALUES
	('RELIGIOUS_COMMUNITY_HOLY_SITE_HOUSING' , 'ModifierId' , 'RELIGIOUS_COMMUNITY_HOLY_SITE_HOUSING_MODIFIER');
INSERT INTO ModifierArguments
	(ModifierId , Name , Value)
VALUES
	('RELIGIOUS_COMMUNITY_HOLY_SITE_HOUSING_MODIFIER' , 'Amount' , '1');
INSERT INTO BeliefModifiers
	(BeliefType , ModifierId)
VALUES
	('BELIEF_RELIGIOUS_COMMUNITY' , 'RELIGIOUS_COMMUNITY_HOLY_SITE_HOUSING');
INSERT INTO RequirementSets
	(RequirementSetId , RequirementSetType)
VALUES
	('CITY_FOLLOWS_RELIGION_HAS_HOLY_SITE' , 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements
	(RequirementSetId , RequirementId)
VALUES
	('CITY_FOLLOWS_RELIGION_HAS_HOLY_SITE' , 'REQUIRES_CITY_FOLLOWS_RELIGION');
INSERT INTO RequirementSetRequirements
	(RequirementSetId , RequirementId)
VALUES
	('CITY_FOLLOWS_RELIGION_HAS_HOLY_SITE' , 'REQUIRES_CITY_HAS_HOLY_SITE');

-- Warrior Monks +5 Combat Strength
UPDATE Units SET Combat=40 WHERE UnitType='UNIT_WARRIOR_MONK';

-- Work Ethic now provides production equal to base yield for Shrine and Temple
DELETE From BeliefModifiers WHERE ModifierId='WORK_ETHIC_FOLLOWER_PRODUCTION';
INSERT INTO Modifiers
	(ModifierId , ModifierType , SubjectRequirementSetId)
VALUES
	('WORK_ETHIC_SHRINE_PRODUCTION'          , 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER' , 'CITY_FOLLOWS_RELIGION_HAS_SHRINE'),--<
	('WORK_ETHIC_TEMPLE_PRODUCTION'          , 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER' , 'CITY_FOLLOWS_RELIGION_HAS_TEMPLE'),
	('WORK_ETHIC_SHRINE_PRODUCTION_MODIFIER' , 'MODIFIER_BUILDING_YIELD_CHANGE'      , null                              ),--<
	('WORK_ETHIC_TEMPLE_PRODUCTION_MODIFIER' , 'MODIFIER_BUILDING_YIELD_CHANGE'      , null                              );
INSERT INTO ModifierArguments
	(ModifierId , Name , Value)
VALUES
	('WORK_ETHIC_SHRINE_PRODUCTION'          , 'ModifierId'   , 'WORK_ETHIC_SHRINE_PRODUCTION_MODIFIER'),--<
	('WORK_ETHIC_TEMPLE_PRODUCTION'          , 'ModifierId'   , 'WORK_ETHIC_TEMPLE_PRODUCTION_MODIFIER'),
	('WORK_ETHIC_SHRINE_PRODUCTION_MODIFIER' , 'BuildingType' , 'BUILDING_SHRINE'                      ),--<
	('WORK_ETHIC_SHRINE_PRODUCTION_MODIFIER' , 'YieldType'    , 'YIELD_PRODUCTION'                     ),
	('WORK_ETHIC_SHRINE_PRODUCTION_MODIFIER' , 'Amount'       , '2'                                    ),
	('WORK_ETHIC_TEMPLE_PRODUCTION_MODIFIER' , 'BuildingType' , 'BUILDING_TEMPLE'                      ),--<
	('WORK_ETHIC_TEMPLE_PRODUCTION_MODIFIER' , 'YieldType'    , 'YIELD_PRODUCTION'                     ),
	('WORK_ETHIC_TEMPLE_PRODUCTION_MODIFIER' , 'Amount'       , '4'                                    );
INSERT INTO BeliefModifiers
	(BeliefType , ModifierId)
VALUES
	('BELIEF_WORK_ETHIC' , 'WORK_ETHIC_TEMPLE_PRODUCTION'),
	('BELIEF_WORK_ETHIC' , 'WORK_ETHIC_SHRINE_PRODUCTION');

-- Dar E Mehr provides +2 culture instead of faith from eras
DELETE FROM Building_YieldsPerEra WHERE BuildingType='BUILDING_DAR_E_MEHR';
INSERT INTO Building_YieldChanges
	(BuildingType , YieldType , YieldChange)
VALUES
	('BUILDING_DAR_E_MEHR' , 'YIELD_CULTURE' , '2');
	
-- -- All worship building production costs reduced	
-- UPDATE Buildings SET Cost='120' WHERE BuildingType='BUILDING_CATHEDRAL'    ;
-- UPDATE Buildings SET Cost='120' WHERE BuildingType='BUILDING_GURDWARA'     ;
-- UPDATE Buildings SET Cost='120' WHERE BuildingType='BUILDING_MEETING_HOUSE';
-- UPDATE Buildings SET Cost='120' WHERE BuildingType='BUILDING_MOSQUE'       ;
-- UPDATE Buildings SET Cost='120' WHERE BuildingType='BUILDING_PAGODA'       ;
-- UPDATE Buildings SET Cost='120' WHERE BuildingType='BUILDING_SYNAGOGUE'    ;
-- UPDATE Buildings SET Cost='120' WHERE BuildingType='BUILDING_WAT'          ;
-- UPDATE Buildings SET Cost='120' WHERE BuildingType='BUILDING_STUPA'        ;
-- UPDATE Buildings SET Cost='120' WHERE BuildingType='BUILDING_DAR_E_MEHR'   ;
