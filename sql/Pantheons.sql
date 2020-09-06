--==============================================================
--******				P A N T H E O N S				  ******
--==============================================================
-- +1 Appeal to Earth goddess
INSERT INTO Modifiers
	(
	ModifierId,
	ModifierType,
	SubjectRequirementSetId
	)
VALUES
	(
		'BELIEF_EARTH_GODDESS_ADD_APPEAL',
		'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',
		'PLAYER_HAS_PANTHEON_REQUIREMENTS'
	),
	(
		'BELIEF_EARTH_GODDESS_ADD_APPEAL_MODIFIER',
		'MODIFIER_PLAYER_CITIES_ADJUST_CITY_APPEAL',
		NULL
	);
INSERT INTO ModifierArguments
	(ModifierId, Name, Value)
VALUES
	(
		'BELIEF_EARTH_GODDESS_ADD_APPEAL',
		'ModifierId',
		'BELIEF_EARTH_GODDESS_ADD_APPEAL_MODIFIER'
	),
	(
		'BELIEF_EARTH_GODDESS_ADD_APPEAL_MODIFIER',
		'Amount',
		'1'
	);
INSERT INTO BeliefModifiers
	(BeliefType, ModifierID)
VALUES
	(
		'BELIEF_EARTH_GODDESS',
		'BELIEF_EARTH_GODDESS_ADD_APPEAL'
	);
-- Make it +3 Faith for breathtaking
-- For breathtaking
INSERT INTO Requirements
	(RequirementId, RequirementType)
VALUES
	(
		'REQUIRES_PLOT_BREATHTAKING_APPEAL',
		'REQUIREMENT_PLOT_IS_APPEAL_BETWEEN'
	);
-- RequirementArguments
--------------------------------------------------------------------------
INSERT INTO RequirementArguments
	(RequirementId, Name, Value)
VALUES
	(
		'REQUIRES_PLOT_BREATHTAKING_APPEAL',
		'MinimumAppeal',
		4
	);
-- RequirementSets
--------------------------------------------------------------------------
INSERT INTO RequirementSets
	(RequirementSetId, RequirementSetType)
VALUES
	(
		'PLOT_BREATHTAKING_APPEAL',
		'REQUIREMENTSET_TEST_ALL'
	);
-- RequirementSetRequirements
--------------------------------------------------------------------------
INSERT INTO RequirementSetRequirements
	(RequirementSetId, RequirementId)
VALUES
	(
		'PLOT_BREATHTAKING_APPEAL',
		'REQUIRES_PLOT_BREATHTAKING_APPEAL'
	);
UPDATE Modifiers
SET SubjectRequirementSetId = "PLOT_BREATHTAKING_APPEAL"
WHERE ModifierId = "EARTH_GODDESS_APPEAL_FAITH_MODIFIER"
	AND ModifierType = "MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD"
	AND SubjectRequirementSetId = "PLOT_CHARMING_APPEAL";
-- Make it +3 Faith
UPDATE ModifierArguments
SET Value = '3'
WHERE ModifierId = 'EARTH_GODDESS_APPEAL_FAITH_MODIFIER'
	AND Name = 'Amount';
--========================================================================
- - City Patron buff 25 %
-->100 %
UPDATE ModifierArguments
SET Value = '100'
WHERE ModifierId = 'CITY_PATRON_GODDESS_DISTRICT_PRODUCTION_MODIFIER'
	AND Name = 'Amount';
--========================================================================
- - Goddes of the Harvest->Goddes of the Commerce
-- +1 Trade rout, +1 Gold / +1 Faith for trade routes
DELETE FROM BeliefModifiers
WHERE ModifierId LIKE "%GODDESS_OF_THE_HARVEST_%";
DELETE FROM ModifierArguments
WHERE ModifierId LIKE "%GODDESS_OF_THE_HARVEST_%";
DELETE FROM Modifiers
WHERE ModifierId LIKE "%GODDESS_OF_THE_HARVEST_%";
-- BELIEF_GODDESS_OF_THE_HARVEST
INSERT INTO Modifiers
	(
	ModifierId,
	ModifierType,
	SubjectRequirementSetId
	)
VALUES
	(
		'GODDESS_OF_COMMERCE_TRADE_ROUTE_SLOT',
		'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',
		'PLAYER_HAS_PANTHEON_REQUIREMENTS'
	),
	(
		'GODDESS_OF_COMMERCE_TRADE_ROUTE_SLOT_MODIFIER',
		'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY',
		NULL
	),
	(
		'GODDESS_OF_COMMERCE_TRADE_ROUTE_GOLD',
		'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',
		'PLAYER_HAS_PANTHEON_REQUIREMENTS'
	),
	(
		'GODDESS_OF_COMMERCE_TRADE_ROUTE_GOLD_MODIFIER',
		'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD',
		NULL
	),
	(
		'GODDESS_OF_COMMERCE_TRADE_ROUTE_FAITH',
		'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',
		'PLAYER_HAS_PANTHEON_REQUIREMENTS'
	),
	(
		'GODDESS_OF_COMMERCE_TRADE_ROUTE_FAITH_MODIFIER',
		'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD',
		NULL
	);
INSERT INTO ModifierArguments
	(ModifierId, Name, Value)
VALUES
	(
		'GODDESS_OF_COMMERCE_TRADE_ROUTE_SLOT',
		'ModifierId',
		'GODDESS_OF_COMMERCE_TRADE_ROUTE_SLOT_MODIFIER'
	),
	(
		'GODDESS_OF_COMMERCE_TRADE_ROUTE_GOLD',
		'ModifierId',
		'GODDESS_OF_COMMERCE_TRADE_ROUTE_GOLD_MODIFIER'
	),
	(
		'GODDESS_OF_COMMERCE_TRADE_ROUTE_FAITH',
		'ModifierId',
		'GODDESS_OF_COMMERCE_TRADE_ROUTE_FAITH_MODIFIER'
	),
	(
		'GODDESS_OF_COMMERCE_TRADE_ROUTE_SLOT_MODIFIER',
		'Amount',
		'1'
	),
	(
		'GODDESS_OF_COMMERCE_TRADE_ROUTE_GOLD_MODIFIER',
		'YieldType',
		'YIELD_GOLD'
	),
	(
		'GODDESS_OF_COMMERCE_TRADE_ROUTE_FAITH_MODIFIER',
		'YieldType',
		'YIELD_FAITH'
	),
	(
		'GODDESS_OF_COMMERCE_TRADE_ROUTE_GOLD_MODIFIER',
		'Amount',
		'1'
	),
	(
		'GODDESS_OF_COMMERCE_TRADE_ROUTE_FAITH_MODIFIER',
		'Amount',
		'1'
	);
INSERT INTO BeliefModifiers
	(BeliefType, ModifierID)
VALUES
	(
		'BELIEF_GODDESS_OF_THE_HARVEST',
		'GODDESS_OF_COMMERCE_TRADE_ROUTE_SLOT'
	),
	(
		'BELIEF_GODDESS_OF_THE_HARVEST',
		'GODDESS_OF_COMMERCE_TRADE_ROUTE_GOLD'
	),
	(
		'BELIEF_GODDESS_OF_THE_HARVEST',
		'GODDESS_OF_COMMERCE_TRADE_ROUTE_FAITH'
	);
--========================================================================
-- RELIGIOUS SETTLEMENTS (buff)
-- Add +1 Culture from City Centers, +25 % border expansion
-- Requirements
--------------------------------------------------------------------------
INSERT INTO Requirements
	(RequirementId, RequirementType)
VALUES
	(
		'P0K_BP_REQUIRES_PLOT_HAS_CITY_CENTER',
		'REQUIREMENT_PLOT_DISTRICT_TYPE_MATCHES'
	);
-- RequirementArguments
--------------------------------------------------------------------------
INSERT INTO RequirementArguments
	(RequirementId, Name, Value)
VALUES
	(
		'P0K_BP_REQUIRES_PLOT_HAS_CITY_CENTER',
		'DistrictType',
		'DISTRICT_CITY_CENTER'
	);
-- RequirementSets
--------------------------------------------------------------------------
INSERT INTO RequirementSets
	(RequirementSetId, RequirementSetType)
VALUES
	(
		'P0K_CITY_CENTER_PANTHEONS_REQUIREMENTS',
		'REQUIREMENTSET_TEST_ALL'
	);
-- RequirementSetRequirements
--------------------------------------------------------------------------
INSERT INTO RequirementSetRequirements
	(RequirementSetId, RequirementId)
VALUES
	(
		'P0K_CITY_CENTER_PANTHEONS_REQUIREMENTS',
		'P0K_BP_REQUIRES_PLOT_HAS_CITY_CENTER'
	);
-- Modifiers
--------------------------------------------------------------------------
INSERT INTO Modifiers
	(
	ModifierId,
	ModifierType,
	SubjectRequirementSetId
	)
VALUES
	(
		'P0K_RELIGIOUS_SETTLEMENTS_CITY_CENTER_CULTURE',
		'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',
		'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'
	),
	(
		'P0K_RELIGIOUS_SETTLEMENTS_CITY_CENTER_CULTURE_MODIFIER',
		'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',
		'P0K_CITY_CENTER_PANTHEONS_REQUIREMENTS'
	);
-- ModifierArguments
--------------------------------------------------------------------------
INSERT INTO ModifierArguments
	(ModifierId, Name, Value)
VALUES
	(
		'P0K_RELIGIOUS_SETTLEMENTS_CITY_CENTER_CULTURE',
		'ModifierId',
		'P0K_RELIGIOUS_SETTLEMENTS_CITY_CENTER_CULTURE_MODIFIER'
	),
	(
		'P0K_RELIGIOUS_SETTLEMENTS_CITY_CENTER_CULTURE_MODIFIER',
		'YieldType',
		'YIELD_CULTURE'
	),
	(
		'P0K_RELIGIOUS_SETTLEMENTS_CITY_CENTER_CULTURE_MODIFIER',
		'Amount',
		1
	);
-- BeliefModifiers
--------------------------------------------------------------------------
INSERT INTO BeliefModifiers
	(BeliefType, ModifierID)
VALUES
	(
		'BELIEF_RELIGIOUS_SETTLEMENTS',
		'P0K_RELIGIOUS_SETTLEMENTS_CITY_CENTER_CULTURE'
	);
-- +25% instead of +15%
UPDATE ModifierArguments
SET Value = '25'
WHERE ModifierId = 'RELIGIOUS_SETTLEMENTS_CULTUREBORDER'
	AND Name = 'Amount';
--========================================================================
-- Fertility Rites also gives +1 food for rice, wheat, sheep and cattle.
INSERT INTO Tags
	(Tag, Vocabulary)
VALUES
	(
		'CLASS_FERTILITY_RITES_FOOD',
		'RESOURCE_CLASS'
	);
INSERT INTO TypeTags
	(Type, Tag)
VALUES
	('RESOURCE_SHEEP', 'CLASS_FERTILITY_RITES_FOOD'),
	('RESOURCE_WHEAT', 'CLASS_FERTILITY_RITES_FOOD'),
	('RESOURCE_CATTLE', 'CLASS_FERTILITY_RITES_FOOD'),
	('RESOURCE_RICE', 'CLASS_FERTILITY_RITES_FOOD');
INSERT INTO Modifiers
	(
	ModifierId,
	ModifierType,
	SubjectRequirementSetId
	)
VALUES
	(
		'FERTILITY_RITES_TAG_FOOD',
		'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',
		'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'
	),
	(
		'FERTILITY_RITES_TAG_FOOD_MODIFIER',
		'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',
		'PLOT_HAS_FERTILITY_TAG_FOOD_REQUIREMENTS'
	);
INSERT INTO ModifierArguments
	(
	ModifierId,
	Name,
	Value
	)
VALUES
	(
		'FERTILITY_RITES_TAG_FOOD',
		'ModifierId',
		'FERTILITY_RITES_TAG_FOOD_MODIFIER'
	),
	(
		'FERTILITY_RITES_TAG_FOOD_MODIFIER',
		'YieldType',
		'YIELD_FOOD'
	),
	(
		'FERTILITY_RITES_TAG_FOOD_MODIFIER',
		'Amount',
		'1'
	);
INSERT INTO Requirements
	(
	RequirementId,
	RequirementType
	)
VALUES
	(
		'REQUIRES_PLOT_HAS_TAG_FERTILITY_FOOD',
		'REQUIREMENT_PLOT_RESOURCE_TAG_MATCHES'
	);
INSERT INTO RequirementArguments
	(
	RequirementId,
	Name,
	Value
	)
VALUES
	(
		'REQUIRES_PLOT_HAS_TAG_FERTILITY_FOOD',
		'Tag',
		'CLASS_FERTILITY_RITES_FOOD'
	);
INSERT INTO RequirementSets
	(
	RequirementSetId,
	RequirementSetType
	)
VALUES
	(
		'PLOT_HAS_FERTILITY_TAG_FOOD_REQUIREMENTS',
		'REQUIREMENTSET_TEST_ALL'
	);
INSERT INTO RequirementSetRequirements
	(
	RequirementSetId,
	RequirementId
	)
VALUES
	(
		'PLOT_HAS_FERTILITY_TAG_FOOD_REQUIREMENTS',
		'REQUIRES_PLOT_HAS_TAG_FERTILITY_FOOD'
	);
--As a buff leave it with both!
--UPDATE BeliefModifiers SET ModifierID='FERTILITY_RITES_TAG_FOOD' WHERE BeliefType='BELIEF_FERTILITY_RITES' AND ModifierID='FERTILITY_RITES_GROWTH';
INSERT INTO BeliefModifiers
	(BeliefType, ModifierId)
VALUES
	(
		'BELIEF_FERTILITY_RITES',
		'FERTILITY_RITES_TAG_FOOD'
	);
--========================================================================
-- God of War now God of War and Plunder (similar to divine spark, but better)
DELETE FROM BeliefModifiers
WHERE BeliefType = 'BELIEF_GOD_OF_WAR';
INSERT INTO Modifiers
	(
	ModifierId,
	ModifierType,
	SubjectRequirementSetId
	)
VALUES
	(
		'GOD_OF_WAR_AND_PLUNDER_HARBOR',
		'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',
		'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'
	),
	(
		'GOD_OF_WAR_AND_PLUNDER_ENCAMP',
		'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',
		'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'
	),
	(
		'GOD_OF_WAR_AND_PLUNDER_HARBOR_MODIFIER',
		'MODIFIER_SINGLE_CITY_DISTRICTS_ADJUST_GREAT_PERSON_POINTS',
		'DISTRICT_IS_HARBOR'
	),
	(
		'GOD_OF_WAR_AND_PLUNDER_ENCAMP_MODIFIER',
		'MODIFIER_SINGLE_CITY_DISTRICTS_ADJUST_GREAT_PERSON_POINTS',
		'DISTRICT_IS_ENCAMPMENT'
	);
INSERT INTO ModifierArguments
	(ModifierId, Name, Type, Value)
VALUES
	(
		'GOD_OF_WAR_AND_PLUNDER_HARBOR',
		'ModifierId',
		'ARGTYPE_IDENTITY',
		'GOD_OF_WAR_AND_PLUNDER_HARBOR_MODIFIER'
	),
	(
		'GOD_OF_WAR_AND_PLUNDER_ENCAMP',
		'ModifierId',
		'ARGTYPE_IDENTITY',
		'GOD_OF_WAR_AND_PLUNDER_ENCAMP_MODIFIER'
	),
	(
		'GOD_OF_WAR_AND_PLUNDER_HARBOR_MODIFIER',
		'GreatPersonClassType',
		'ARGTYPE_IDENTITY',
		'GREAT_PERSON_CLASS_ADMIRAL'
	),
	(
		'GOD_OF_WAR_AND_PLUNDER_ENCAMP_MODIFIER',
		'GreatPersonClassType',
		'ARGTYPE_IDENTITY',
		'GREAT_PERSON_CLASS_GENERAL'
	),
	(
		'GOD_OF_WAR_AND_PLUNDER_HARBOR_MODIFIER',
		'Amount',
		'ARGTYPE_IDENTITY',
		'1'
	),
	(
		'GOD_OF_WAR_AND_PLUNDER_ENCAMP_MODIFIER',
		'Amount',
		'ARGTYPE_IDENTITY',
		'1'
	);
INSERT INTO BeliefModifiers
	(BeliefType, ModifierId)
VALUES
	(
		'BELIEF_GOD_OF_WAR',
		'GOD_OF_WAR_AND_PLUNDER_HARBOR'
	),
	(
		'BELIEF_GOD_OF_WAR',
		'GOD_OF_WAR_AND_PLUNDER_ENCAMP'
	);
-- Create the modifier for +1 MILITARY slot.
INSERT INTO Types
	(Type, Kind)
VALUES
	(
		'GOD_OF_MARTIAL_LAW_GRANT_MILITARY_SLOT',
		'KIND_MODIFIER'
	),
	(
		'GOD_OF_MARTIAL_LAW_MILITARY_SLOT',
		'KIND_MODIFIER'
	);
INSERT INTO Modifiers
	(
	ModifierId,
	ModifierType,
	SubjectRequirementSetId
	)
VALUES
	(
		'GOD_OF_MARTIAL_LAW_GRANT_MILITARY_SLOT',
		'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',
		'PLAYER_HAS_PANTHEON_REQUIREMENTS'
	),
	(
		'GOD_OF_MARTIAL_LAW_MILITARY_SLOT',
		'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_MODIFIER',
		NULL
	);
INSERT INTO ModifierArguments
	(ModifierId, Name, Value)
VALUES
	(
		'GOD_OF_MARTIAL_LAW_GRANT_MILITARY_SLOT',
		'ModifierId',
		'GOD_OF_MARTIAL_LAW_MILITARY_SLOT'
	),
	(
		'GOD_OF_MARTIAL_LAW_MILITARY_SLOT',
		'GovernmentSlotType',
		'SLOT_MILITARY'
	);
INSERT INTO BeliefModifiers
	(BeliefType, ModifierId)
VALUES
	(
		'BELIEF_GOD_OF_WAR',
		'GOD_OF_MARTIAL_LAW_GRANT_MILITARY_SLOT'
	);
--========================================================================
-- Initiation Rites also gives 25% faith for each military land unit produced
INSERT INTO Modifiers
	(
	ModifierId,
	ModifierType,
	SubjectRequirementSetId
	)
VALUES
	(
		'INITIATION_RITES_FAITH_YIELD_CPL_MOD',
		'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',
		'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'
	),
	(
		'INITIATION_RITES_FAITH_YIELD_MODIFIER_CPL_MOD',
		'MODIFIER_SINGLE_CITY_GRANT_YIELD_PER_UNIT_COST',
		NULL
	);
INSERT INTO ModifierArguments
	(
	ModifierId,
	Name,
	Value
	)
VALUES
	(
		'INITIATION_RITES_FAITH_YIELD_CPL_MOD',
		'ModifierId',
		'INITIATION_RITES_FAITH_YIELD_MODIFIER_CPL_MOD'
	),
	(
		'INITIATION_RITES_FAITH_YIELD_MODIFIER_CPL_MOD',
		'YieldType',
		'YIELD_FAITH'
	),
	(
		'INITIATION_RITES_FAITH_YIELD_MODIFIER_CPL_MOD',
		'UnitProductionPercent',
		'25'
	);
--As a buff leave it with both! (Overloaded revert)
UPDATE BeliefModifiers
SET ModifierID = 'INITIATION_RITES_FAITH_YIELD_CPL_MOD'
WHERE BeliefType = 'BELIEF_INITIATION_RITES'
	AND ModifierID = 'INITIATION_RITES_FAITH_DISPERSAL';
--INSERT INTO BeliefModifiers ( BeliefType , ModifierId )
--	VALUES
--	( 'BELIEF_INITIATION_RITES' , 'INITIATION_RITES_FAITH_YIELD_CPL_MOD' );
-- INITIATION RITES (buff)
-- Add +5 Combat Strength against Barbarians.
-- Modifiers
--------------------------------------------------------------------------
INSERT INTO Modifiers
	(
	ModifierId,
	ModifierType,
	SubjectRequirementSetId
	)
VALUES
	(
		'P0K_INITIATION_RITES_BARBARIAN_COMBAT_BONUS',
		'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',
		'PLAYER_HAS_PANTHEON_REQUIREMENTS'
	),
	(
		'P0K_INITIATION_RITES_BARBARIAN_COMBAT_BONUS_MODIFIER',
		'MODIFIER_PLAYER_UNITS_ADJUST_BARBARIAN_COMBAT',
		NULL
	);
-- ModifierArguments
--------------------------------------------------------------------------
INSERT INTO ModifierArguments
	(ModifierId, Name, Value)
VALUES
	(
		'P0K_INITIATION_RITES_BARBARIAN_COMBAT_BONUS',
		'ModifierId',
		'P0K_INITIATION_RITES_BARBARIAN_COMBAT_BONUS_MODIFIER'
	),
	(
		'P0K_INITIATION_RITES_BARBARIAN_COMBAT_BONUS_MODIFIER',
		'Amount',
		5
	);
-- BeliefModifiers
--------------------------------------------------------------------------
INSERT INTO BeliefModifiers
	(BeliefType, ModifierID)
VALUES
	(
		'BELIEF_INITIATION_RITES',
		'P0K_INITIATION_RITES_BARBARIAN_COMBAT_BONUS'
	);
--========================================================================
-- GOD OF HEALING (buff)
-- Add +5 Healing everywhere (near Holy Site is +25 instead of +30 to compensate)
-- Modifiers
--------------------------------------------------------------------------
INSERT INTO Modifiers
	(
	ModifierId,
	ModifierType,
	SubjectRequirementSetId
	)
VALUES
	(
		'P0K_GOD_OF_HEALING_UNIT_HEALING_EVERYWHERE',
		'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',
		'PLAYER_HAS_PANTHEON_REQUIREMENTS'
	),
	(
		'P0K_GOD_OF_HEALING_UNIT_HEALING_EVERYWHERE_MODIFIER',
		'MODIFIER_PLAYER_UNITS_ADJUST_HEAL_PER_TURN',
		NULL
	);
-- ModifierArguments
--------------------------------------------------------------------------
UPDATE ModifierArguments
SET Value = 25
WHERE ModifierId = 'GOD_OF_HEALING_UNIT_HEALING_MODIFIER'
	AND Name = 'Amount';
INSERT INTO ModifierArguments
	(ModifierId, Name, Value)
VALUES
	(
		'P0K_GOD_OF_HEALING_UNIT_HEALING_EVERYWHERE',
		'ModifierId',
		'P0K_GOD_OF_HEALING_UNIT_HEALING_EVERYWHERE_MODIFIER'
	),
	(
		'P0K_GOD_OF_HEALING_UNIT_HEALING_EVERYWHERE_MODIFIER',
		'Type',
		'ALL'
	),
	(
		'P0K_GOD_OF_HEALING_UNIT_HEALING_EVERYWHERE_MODIFIER',
		'Amount',
		5
	);
-- BeliefModifiers
--------------------------------------------------------------------------
INSERT INTO BeliefModifiers
	(BeliefType, ModifierID)
VALUES
	(
		'BELIEF_GOD_OF_HEALING',
		'P0K_GOD_OF_HEALING_UNIT_HEALING_EVERYWHERE'
	);
--========================================================================
-- God of forge for ever!
UPDATE ModifierArguments
SET Value = 'ERA_INFORMATION'
WHERE ModifierId = 'GOD_OF_THE_FORGE_UNIT_ANCIENT_CLASSICAL_PRODUCTION_MODIFIER'
	AND Name = 'EndEra';
--========================================================================
- - ORAL TRADITION->-- BeliefModifiers
-- Modifiers
---------------------------------------------------------------------------------------------------------------
INSERT INTO Modifiers
	(
	ModifierId,
	ModifierType,
	RunOnce,
	Permanent,
	SubjectRequirementSetId
	)
VALUES
	(
		'BES_BONUS_RESOURCE_AMENITIES',
		'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',
		0,
		0,
		'PLAYER_HAS_PANTHEON_REQUIREMENTS'
	),
	(
		'BES_BONUS_RESOURCE_AMENITIES_MODIFIER',
		'MODIFIER_PLAYER_OWNED_BONUS_RESOURCE_EXTRA_AMENITIES',
		0,
		0,
		NULL
	);
---------------------------------------------------------------------------------------------------------------
-- ModifierArguments
---------------------------------------------------------------------------------------------------------------
INSERT INTO ModifierArguments
	(ModifierId, Name, Value)
VALUES
	(
		'BES_BONUS_RESOURCE_AMENITIES',
		'ModifierId',
		'BES_BONUS_RESOURCE_AMENITIES_MODIFIER'
	),
	(
		'BES_BONUS_RESOURCE_AMENITIES_MODIFIER',
		'Amount',
		2
	);
INSERT INTO BeliefModifiers
	(BeliefType, ModifierID)
VALUES
	(
		'BELIEF_ORAL_TRADITION',
		'BES_BONUS_RESOURCE_AMENITIES'
	);
-- ORAL_TRADITION also gives faith
-- Modifiers
--------------------------------------------------------------------------
INSERT INTO Modifiers
	(
	ModifierId,
	ModifierType,
	SubjectRequirementSetId
	)
VALUES
	(
		'ORAL_TRADITION_PLANTATION_TAG_FAITH',
		'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',
		'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'
	),
	(
		'ORAL_TRADITION_PLANTATION_TAG_FAITH_MODIFIER',
		'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',
		'PLOT_HAS_PLANTATION_TAG2_REQUIREMENTS'
	);
-- ModifierArguments
--------------------------------------------------------------------------
INSERT INTO ModifierArguments
	(ModifierId, Name, Value)
VALUES
	(
		'ORAL_TRADITION_PLANTATION_TAG_FAITH',
		'ModifierId',
		'ORAL_TRADITION_PLANTATION_TAG_FAITH_MODIFIER'
	),
	(
		'ORAL_TRADITION_PLANTATION_TAG_FAITH_MODIFIER',
		'YieldType',
		'YIELD_FAITH'
	),
	(
		'ORAL_TRADITION_PLANTATION_TAG_FAITH_MODIFIER',
		'Amount',
		1
	);
-- BeliefModifiers
--------------------------------------------------------------------------
INSERT INTO BeliefModifiers
	(BeliefType, ModifierID)
VALUES
	(
		'BELIEF_ORAL_TRADITION',
		'ORAL_TRADITION_PLANTATION_TAG_FAITH'
	);
--========================================================================
-- GODDESS_OF_FESTIVALS merged with BELIEF_ORAL_TRADITION so all give +1 Calture/+1 Faith
-- Switch from food to Calture
UPDATE ModifierArguments
SET Value = 'YIELD_CULTURE'
WHERE ModifierId = 'GODDESS_OF_FESTIVALS_PLANTATION_TAG_FOOD_MODIFIER'
	AND Name = 'YieldType';
-- Modifiers
--------------------------------------------------------------------------
INSERT INTO Modifiers
	(
	ModifierId,
	ModifierType,
	SubjectRequirementSetId
	)
VALUES
	(
		'BELIEF_GODDESS_OF_FESTIVALS_PLANTATION_TAG_FAITH',
		'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',
		'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'
	),
	(
		'BELIEF_GODDESS_OF_FESTIVALS_PLANTATION_TAG_FAITH_MODIFIER',
		'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',
		'PLOT_HAS_PLANTATION_TAG_REQUIREMENTS'
	);
-- ModifierArguments
--------------------------------------------------------------------------
INSERT INTO ModifierArguments
	(ModifierId, Name, Value)
VALUES
	(
		'BELIEF_GODDESS_OF_FESTIVALS_PLANTATION_TAG_FAITH',
		'ModifierId',
		'BELIEF_GODDESS_OF_FESTIVALS_PLANTATION_TAG_FAITH_MODIFIER'
	),
	(
		'BELIEF_GODDESS_OF_FESTIVALS_PLANTATION_TAG_FAITH_MODIFIER',
		'YieldType',
		'YIELD_FAITH'
	),
	(
		'BELIEF_GODDESS_OF_FESTIVALS_PLANTATION_TAG_FAITH_MODIFIER',
		'Amount',
		1
	);
-- BeliefModifiers
--------------------------------------------------------------------------
INSERT INTO BeliefModifiers
	(BeliefType, ModifierID)
VALUES
	(
		'BELIEF_GODDESS_OF_FESTIVALS',
		'BELIEF_GODDESS_OF_FESTIVALS_PLANTATION_TAG_FAITH'
	);
-- MERGE BOTH
UPDATE BeliefModifiers
SET BeliefType = 'BELIEF_GODDESS_OF_FESTIVALS'
WHERE BeliefType = 'BELIEF_ORAL_TRADITION'
	AND ModifierID <> 'BES_BONUS_RESOURCE_AMENITIES';
--========================================================================
- - God of Craftsmen
-->GodKing
INSERT INTO Requirements
	(
	RequirementId,
	RequirementType
	)
VALUES
	(
		'SPM_SPIRIT_OF_THE_DEITY_REQUIRES_DISTRICT_IS_CITY_CENTER',
		'REQUIREMENT_PLOT_DISTRICT_TYPE_MATCHES'
	);
INSERT INTO RequirementArguments
	(
	RequirementId,
	Name,
	Value
	)
VALUES
	(
		'SPM_SPIRIT_OF_THE_DEITY_REQUIRES_DISTRICT_IS_CITY_CENTER',
		'DistrictType',
		'DISTRICT_CITY_CENTER'
	);
INSERT INTO RequirementSets
	(
	RequirementSetId,
	RequirementSetType
	)
VALUES
	(
		'SPM_SPIRIT_OF_THE_DEITY_AMENITY_REQUIREMENTS',
		'REQUIREMENTSET_TEST_ALL'
	);
INSERT INTO RequirementSetRequirements
	(
	RequirementSetId,
	RequirementId
	)
VALUES
	(
		'SPM_SPIRIT_OF_THE_DEITY_AMENITY_REQUIREMENTS',
		'SPM_SPIRIT_OF_THE_DEITY_REQUIRES_DISTRICT_IS_CITY_CENTER'
	),
	(
		'SPM_SPIRIT_OF_THE_DEITY_AMENITY_REQUIREMENTS',
		'REQUIRES_CITY_HAS_PALACE'
	);
-- FOOD
INSERT INTO Modifiers
	(
	ModifierId,
	ModifierType,
	SubjectRequirementSetId
	)
VALUES
	(
		'SPM_SPIRIT_OF_THE_DEITY_FOOD',
		'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',
		'PLAYER_HAS_PANTHEON_REQUIREMENTS'
	),
	(
		'SPM_SPIRIT_OF_THE_DEITY_FOOD_MODIFIER',
		'MODIFIER_BUILDING_YIELD_CHANGE',
		NULL
	);
INSERT INTO ModifierArguments
	(ModifierId, Name, Value)
VALUES
	(
		'SPM_SPIRIT_OF_THE_DEITY_FOOD',
		'ModifierId',
		'SPM_SPIRIT_OF_THE_DEITY_FOOD_MODIFIER'
	),
	(
		'SPM_SPIRIT_OF_THE_DEITY_FOOD_MODIFIER',
		'BuildingType',
		'BUILDING_PALACE'
	),
	(
		'SPM_SPIRIT_OF_THE_DEITY_FOOD_MODIFIER',
		'YieldType',
		'YIELD_FOOD'
	),
	(
		'SPM_SPIRIT_OF_THE_DEITY_FOOD_MODIFIER',
		'Amount',
		1
	);
INSERT INTO BeliefModifiers
	(BeliefType, ModifierID)
VALUES
	(
		'BELIEF_GOD_OF_CRAFTSMEN',
		'SPM_SPIRIT_OF_THE_DEITY_FOOD'
	);
-- PRODUCTION
INSERT INTO Modifiers
	(
	ModifierId,
	ModifierType,
	SubjectRequirementSetId
	)
VALUES
	(
		'SPM_SPIRIT_OF_THE_DEITY_PRODUCTION',
		'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',
		'PLAYER_HAS_PANTHEON_REQUIREMENTS'
	),
	(
		'SPM_SPIRIT_OF_THE_DEITY_PRODUCTION_MODIFIER',
		'MODIFIER_BUILDING_YIELD_CHANGE',
		NULL
	);
INSERT INTO ModifierArguments
	(ModifierId, Name, Value)
VALUES
	(
		'SPM_SPIRIT_OF_THE_DEITY_PRODUCTION',
		'ModifierId',
		'SPM_SPIRIT_OF_THE_DEITY_PRODUCTION_MODIFIER'
	),
	(
		'SPM_SPIRIT_OF_THE_DEITY_PRODUCTION_MODIFIER',
		'BuildingType',
		'BUILDING_PALACE'
	),
	(
		'SPM_SPIRIT_OF_THE_DEITY_PRODUCTION_MODIFIER',
		'YieldType',
		'YIELD_PRODUCTION'
	),
	(
		'SPM_SPIRIT_OF_THE_DEITY_PRODUCTION_MODIFIER',
		'Amount',
		1
	);
INSERT INTO BeliefModifiers
	(BeliefType, ModifierID)
VALUES
	(
		'BELIEF_GOD_OF_CRAFTSMEN',
		'SPM_SPIRIT_OF_THE_DEITY_PRODUCTION'
	);
-- GOLD
INSERT INTO Modifiers
	(
	ModifierId,
	ModifierType,
	SubjectRequirementSetId
	)
VALUES
	(
		'SPM_SPIRIT_OF_THE_DEITY_GOLD',
		'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',
		'PLAYER_HAS_PANTHEON_REQUIREMENTS'
	),
	(
		'SPM_SPIRIT_OF_THE_DEITY_GOLD_MODIFIER',
		'MODIFIER_BUILDING_YIELD_CHANGE',
		NULL
	);
INSERT INTO ModifierArguments
	(ModifierId, Name, Value)
VALUES
	(
		'SPM_SPIRIT_OF_THE_DEITY_GOLD',
		'ModifierId',
		'SPM_SPIRIT_OF_THE_DEITY_GOLD_MODIFIER'
	),
	(
		'SPM_SPIRIT_OF_THE_DEITY_GOLD_MODIFIER',
		'BuildingType',
		'BUILDING_PALACE'
	),
	(
		'SPM_SPIRIT_OF_THE_DEITY_GOLD_MODIFIER',
		'YieldType',
		'YIELD_GOLD'
	),
	(
		'SPM_SPIRIT_OF_THE_DEITY_GOLD_MODIFIER',
		'Amount',
		1
	);
INSERT INTO BeliefModifiers
	(BeliefType, ModifierID)
VALUES
	(
		'BELIEF_GOD_OF_CRAFTSMEN',
		'SPM_SPIRIT_OF_THE_DEITY_GOLD'
	);
-- SCIENCE
INSERT INTO Modifiers
	(
	ModifierId,
	ModifierType,
	SubjectRequirementSetId
	)
VALUES
	(
		'SPM_SPIRIT_OF_THE_DEITY_SCIENCE',
		'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',
		'PLAYER_HAS_PANTHEON_REQUIREMENTS'
	),
	(
		'SPM_SPIRIT_OF_THE_DEITY_SCIENCE_MODIFIER',
		'MODIFIER_BUILDING_YIELD_CHANGE',
		NULL
	);
INSERT INTO ModifierArguments
	(ModifierId, Name, Value)
VALUES
	(
		'SPM_SPIRIT_OF_THE_DEITY_SCIENCE',
		'ModifierId',
		'SPM_SPIRIT_OF_THE_DEITY_SCIENCE_MODIFIER'
	),
	(
		'SPM_SPIRIT_OF_THE_DEITY_SCIENCE_MODIFIER',
		'BuildingType',
		'BUILDING_PALACE'
	),
	(
		'SPM_SPIRIT_OF_THE_DEITY_SCIENCE_MODIFIER',
		'YieldType',
		'YIELD_SCIENCE'
	),
	(
		'SPM_SPIRIT_OF_THE_DEITY_SCIENCE_MODIFIER',
		'Amount',
		1
	);
INSERT INTO BeliefModifiers
	(BeliefType, ModifierID)
VALUES
	(
		'BELIEF_GOD_OF_CRAFTSMEN',
		'SPM_SPIRIT_OF_THE_DEITY_SCIENCE'
	);
-- CULTURE
INSERT INTO Modifiers
	(
	ModifierId,
	ModifierType,
	SubjectRequirementSetId
	)
VALUES
	(
		'SPM_SPIRIT_OF_THE_DEITY_CULTURE',
		'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',
		'PLAYER_HAS_PANTHEON_REQUIREMENTS'
	),
	(
		'SPM_SPIRIT_OF_THE_DEITY_CULTURE_MODIFIER',
		'MODIFIER_BUILDING_YIELD_CHANGE',
		NULL
	);
INSERT INTO ModifierArguments
	(ModifierId, Name, Value)
VALUES
	(
		'SPM_SPIRIT_OF_THE_DEITY_CULTURE',
		'ModifierId',
		'SPM_SPIRIT_OF_THE_DEITY_CULTURE_MODIFIER'
	),
	(
		'SPM_SPIRIT_OF_THE_DEITY_CULTURE_MODIFIER',
		'BuildingType',
		'BUILDING_PALACE'
	),
	(
		'SPM_SPIRIT_OF_THE_DEITY_CULTURE_MODIFIER',
		'YieldType',
		'YIELD_CULTURE'
	),
	(
		'SPM_SPIRIT_OF_THE_DEITY_CULTURE_MODIFIER',
		'Amount',
		1
	);
INSERT INTO BeliefModifiers
	(BeliefType, ModifierID)
VALUES
	(
		'BELIEF_GOD_OF_CRAFTSMEN',
		'SPM_SPIRIT_OF_THE_DEITY_CULTURE'
	);
-- FAITH
INSERT INTO Modifiers
	(
	ModifierId,
	ModifierType,
	SubjectRequirementSetId
	)
VALUES
	(
		'SPM_SPIRIT_OF_THE_DEITY_FAITH',
		'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',
		'PLAYER_HAS_PANTHEON_REQUIREMENTS'
	),
	(
		'SPM_SPIRIT_OF_THE_DEITY_FAITH_MODIFIER',
		'MODIFIER_BUILDING_YIELD_CHANGE',
		NULL
	);
INSERT INTO ModifierArguments
	(ModifierId, Name, Value)
VALUES
	(
		'SPM_SPIRIT_OF_THE_DEITY_FAITH',
		'ModifierId',
		'SPM_SPIRIT_OF_THE_DEITY_FAITH_MODIFIER'
	),
	(
		'SPM_SPIRIT_OF_THE_DEITY_FAITH_MODIFIER',
		'BuildingType',
		'BUILDING_PALACE'
	),
	(
		'SPM_SPIRIT_OF_THE_DEITY_FAITH_MODIFIER',
		'YieldType',
		'YIELD_FAITH'
	),
	(
		'SPM_SPIRIT_OF_THE_DEITY_FAITH_MODIFIER',
		'Amount',
		1
	);
INSERT INTO BeliefModifiers
	(BeliefType, ModifierID)
VALUES
	(
		'BELIEF_GOD_OF_CRAFTSMEN',
		'SPM_SPIRIT_OF_THE_DEITY_FAITH'
	);
-- HOUSING
INSERT INTO Modifiers
	(
	ModifierId,
	ModifierType,
	SubjectRequirementSetId
	)
VALUES
	(
		'SPM_SPIRIT_OF_THE_DEITY_HOUSING',
		'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',
		'PLAYER_HAS_PANTHEON_REQUIREMENTS'
	),
	(
		'SPM_SPIRIT_OF_THE_DEITY_HOUSING_MODIFIER',
		'MODIFIER_SINGLE_CITY_ADJUST_BUILDING_HOUSING',
		'SPM_SPIRIT_OF_THE_DEITY_AMENITY_REQUIREMENTS'
	);
INSERT INTO ModifierArguments
	(ModifierId, Name, Value)
VALUES
	(
		'SPM_SPIRIT_OF_THE_DEITY_HOUSING',
		'ModifierId',
		'SPM_SPIRIT_OF_THE_DEITY_HOUSING_MODIFIER'
	),
	(
		'SPM_SPIRIT_OF_THE_DEITY_HOUSING_MODIFIER',
		'BuildingType',
		'BUILDING_PALACE'
	),
	(
		'SPM_SPIRIT_OF_THE_DEITY_HOUSING_MODIFIER',
		'Amount',
		1
	);
INSERT INTO BeliefModifiers
	(BeliefType, ModifierID)
VALUES
	(
		'BELIEF_GOD_OF_CRAFTSMEN',
		'SPM_SPIRIT_OF_THE_DEITY_HOUSING'
	);
-- AMENITY
INSERT INTO Modifiers
	(
	ModifierId,
	ModifierType,
	SubjectRequirementSetId
	)
VALUES
	(
		'SPM_SPIRIT_OF_THE_DEITY_AMENITY',
		'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',
		'PLAYER_HAS_PANTHEON_REQUIREMENTS'
	),
	(
		'SPM_SPIRIT_OF_THE_DEITY_AMENITY_MODIFIER',
		'MODIFIER_CITY_DISTRICTS_ADJUST_CITY_AMENITIES_FROM_RELIGION',
		'SPM_SPIRIT_OF_THE_DEITY_AMENITY_REQUIREMENTS'
	);
INSERT INTO ModifierArguments
	(ModifierId, Name, Value)
VALUES
	(
		'SPM_SPIRIT_OF_THE_DEITY_AMENITY',
		'ModifierId',
		'SPM_SPIRIT_OF_THE_DEITY_AMENITY_MODIFIER'
	),
	(
		'SPM_SPIRIT_OF_THE_DEITY_AMENITY_MODIFIER',
		'Amount',
		1
	);
INSERT INTO BeliefModifiers
	(BeliefType, ModifierID)
VALUES
	(
		'BELIEF_GOD_OF_CRAFTSMEN',
		'SPM_SPIRIT_OF_THE_DEITY_AMENITY'
	);
-- religious idols +1 faith bonus , +1 calcure lux, and +1 prod strat
-- merged
UPDATE BeliefModifiers
SET BeliefType = 'BELIEF_RELIGIOUS_IDOLS'
WHERE BeliefType = 'BELIEF_GOD_OF_CRAFTSMEN'
	AND ModifierID = 'GOD_OF_CRAFTSMEN_STRATEGIC_MINE_PRODUCTION';
UPDATE ModifierArguments
SET Value = '1'
WHERE ModifierId = 'RELIGIOUS_IDOLS_BONUS_MINE_FAITH_MODIFIER'
	and Name = 'Amount';
UPDATE ModifierArguments
SET Value = '1'
WHERE ModifierId = 'RELIGIOUS_IDOLS_LUXURY_MINE_FAITH_MODIFIER'
	and Name = 'Amount';
UPDATE ModifierArguments
SET Value = 'YIELD_CULTURE'
WHERE ModifierId = 'RELIGIOUS_IDOLS_LUXURY_MINE_FAITH_MODIFIER'
	and Name = 'YieldType';
-- stone circles +2 faith and +1 prod
INSERT INTO Modifiers
	(
	ModifierId,
	ModifierType,
	SubjectRequirementSetId
	)
VALUES
	(
		'STONE_CIRCLES_QUARRY_PROD_BBG',
		'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',
		'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'
	),
	(
		'STONE_CIRCLES_QUARRY_PROD_MODIFIER_BBG',
		'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',
		'PLOT_HAS_QUARRY_REQUIREMENTS'
	);
INSERT INTO ModifierArguments
	(ModifierId, Name, Value)
VALUES
	(
		'STONE_CIRCLES_QUARRY_PROD_BBG',
		'ModifierId',
		'STONE_CIRCLES_QUARRY_PROD_MODIFIER_BBG'
	),
	(
		'STONE_CIRCLES_QUARRY_PROD_MODIFIER_BBG',
		'YieldType',
		'YIELD_PRODUCTION'
	),
	(
		'STONE_CIRCLES_QUARRY_PROD_MODIFIER_BBG',
		'Amount',
		'1'
	);
INSERT INTO BeliefModifiers
	(BeliefType, ModifierID)
VALUES
	(
		'BELIEF_STONE_CIRCLES',
		'STONE_CIRCLES_QUARRY_PROD_BBG'
	);
-- BELIEF_GODDESS_OF_THE_HUNT gets +1 calture from pastures
UPDATE BeliefModifiers
SET BeliefType = 'BELIEF_GODDESS_OF_THE_HUNT'
WHERE BeliefType = 'BELIEF_GOD_OF_THE_OPEN_SKY'
	AND ModifierID = 'GOD_OF_THE_OPEN_SKY_PASTURE_CULTURE';
- - GOD OF THE
OPEN SKY
-->God of redemtion
INSERT INTO Requirements
	(RequirementId, RequirementType)
VALUES
	(
		'AEP_REQUIRES_PLOT_ADJACENT_TO_OASIS',
		'REQUIREMENT_PLOT_ADJACENT_FEATURE_TYPE_MATCHES'
	);
INSERT INTO RequirementArguments
	(RequirementId, Name, Value)
VALUES
	(
		'AEP_REQUIRES_PLOT_ADJACENT_TO_OASIS',
		'FeatureType',
		'FEATURE_OASIS'
	);
INSERT INTO RequirementSets
	(RequirementSetId, RequirementSetType)
VALUES
	(
		'AEP_OASIS_REQUIREMENTS',
		'REQUIREMENTSET_TEST_ALL'
	),
	(
		'AEP_ADJACENT_OASIS_REQUIREMENTS',
		'REQUIREMENTSET_TEST_ALL'
	);
INSERT INTO RequirementSetRequirements
	(RequirementSetId, RequirementId)
VALUES
	(
		'AEP_OASIS_REQUIREMENTS',
		'REQUIRES_PLOT_HAS_OASIS'
	),
	(
		'AEP_ADJACENT_OASIS_REQUIREMENTS',
		'PETRA_YIELD_MODIFIER_REQUIRES_PLOT_HAS_DESERT'
	),
	(
		'AEP_ADJACENT_OASIS_REQUIREMENTS',
		'AEP_REQUIRES_PLOT_ADJACENT_TO_OASIS'
	);
INSERT INTO Modifiers
	(
	ModifierId,
	ModifierType,
	RunOnce,
	Permanent,
	SubjectRequirementSetId
	)
VALUES
	(
		'ASH_OASIS_CULTURE',
		'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',
		0,
		0,
		'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'
	),
	(
		'ASH_OASIS_CULTURE_MODIFIER',
		'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',
		0,
		0,
		'AEP_OASIS_REQUIREMENTS'
	),
	(
		'ASH_OASIS_FAITH',
		'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',
		0,
		0,
		'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'
	),
	(
		'ASH_OASIS_FAITH_MODIFIER',
		'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',
		0,
		0,
		'AEP_OASIS_REQUIREMENTS'
	),
	(
		'ASH_OASIS_PRODUCTION',
		'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',
		0,
		0,
		'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'
	),
	(
		'ASH_OASIS_PRODUCTION_MODIFIER',
		'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',
		0,
		0,
		'AEP_OASIS_REQUIREMENTS'
	),
	(
		'ASH_ADJACENT_OASIS_SCIENCE',
		'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',
		0,
		0,
		'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'
	),
	(
		'ASH_ADJACENT_OASIS_SCIENCE_MODIFIER',
		'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',
		0,
		0,
		'AEP_ADJACENT_OASIS_REQUIREMENTS'
	),
	(
		'ASH_ADJACENT_OASIS_FOOD',
		'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',
		0,
		0,
		'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'
	),
	(
		'ASH_ADJACENT_OASIS_FOOD_MODIFIER',
		'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',
		0,
		0,
		'AEP_ADJACENT_OASIS_REQUIREMENTS'
	);
INSERT INTO ModifierArguments
	(ModifierId, Name, Value)
VALUES
	(
		'ASH_OASIS_CULTURE',
		'ModifierId',
		'ASH_OASIS_CULTURE_MODIFIER'
	),
	(
		'ASH_OASIS_CULTURE_MODIFIER',
		'YieldType',
		'YIELD_CULTURE'
	),
	('ASH_OASIS_CULTURE_MODIFIER', 'Amount', 2),
	(
		'ASH_OASIS_FAITH',
		'ModifierId',
		'ASH_OASIS_FAITH_MODIFIER'
	),
	(
		'ASH_OASIS_FAITH_MODIFIER',
		'YieldType',
		'YIELD_FAITH'
	),
	('ASH_OASIS_FAITH_MODIFIER', 'Amount', 2),
	(
		'ASH_OASIS_PRODUCTION',
		'ModifierId',
		'ASH_OASIS_PRODUCTION_MODIFIER'
	),
	(
		'ASH_OASIS_PRODUCTION_MODIFIER',
		'YieldType',
		'YIELD_PRODUCTION'
	),
	(
		'ASH_OASIS_PRODUCTION_MODIFIER',
		'Amount',
		2
	),
	(
		'ASH_ADJACENT_OASIS_SCIENCE',
		'ModifierId',
		'ASH_ADJACENT_OASIS_SCIENCE_MODIFIER'
	),
	(
		'ASH_ADJACENT_OASIS_SCIENCE_MODIFIER',
		'YieldType',
		'YIELD_SCIENCE'
	),
	(
		'ASH_ADJACENT_OASIS_SCIENCE_MODIFIER',
		'Amount',
		1
	),
	(
		'ASH_ADJACENT_OASIS_FOOD',
		'ModifierId',
		'ASH_ADJACENT_OASIS_FOOD_MODIFIER'
	),
	(
		'ASH_ADJACENT_OASIS_FOOD_MODIFIER',
		'YieldType',
		'YIELD_FOOD'
	),
	(
		'ASH_ADJACENT_OASIS_FOOD_MODIFIER',
		'Amount',
		2
	);
INSERT INTO BeliefModifiers
	(BeliefType, ModifierID)
VALUES
	(
		'BELIEF_GOD_OF_THE_OPEN_SKY',
		'ASH_OASIS_CULTURE'
	),
	('BELIEF_GOD_OF_THE_OPEN_SKY', 'ASH_OASIS_FAITH'),
	(
		'BELIEF_GOD_OF_THE_OPEN_SKY',
		'ASH_OASIS_PRODUCTION'
	),
	(
		'BELIEF_GOD_OF_THE_OPEN_SKY',
		'ASH_ADJACENT_OASIS_SCIENCE'
	),
	(
		'BELIEF_GOD_OF_THE_OPEN_SKY',
		'ASH_ADJACENT_OASIS_FOOD'
	);
-- GOD OF THE SEA (buff): Applies to all Sea resources and Reef.
-- Requirements
--------------------------------------------------------------------------
INSERT INTO Requirements
	(RequirementId, RequirementType)
VALUES
	(
		'P0K_BP_REQUIRES_PLOT_HAS_GREAT_BARRIER_REEF',
		'REQUIREMENT_PLOT_FEATURE_TYPE_MATCHES'
	);
INSERT INTO RequirementArguments
	(RequirementId, Name, Value)
VALUES
	(
		'P0K_BP_REQUIRES_PLOT_HAS_GREAT_BARRIER_REEF',
		'FeatureType',
		'FEATURE_BARRIER_REEF'
	);
INSERT INTO RequirementSets
	(RequirementSetId, RequirementSetType)
VALUES
	(
		'P0K_GOD_OF_SEA_COAST_RESOURCE_REQUIREMENTS',
		'REQUIREMENTSET_TEST_ALL'
	),
	(
		'P0K_GOD_OF_SEA_OCEAN_RESOURCE_REQUIREMENTS',
		'REQUIREMENTSET_TEST_ALL'
	),
	(
		'P0K_GOD_OF_SEA_REEF_REQUIREMENTS',
		'REQUIREMENTSET_TEST_ANY'
	);
INSERT INTO RequirementSetRequirements
	(RequirementSetId, RequirementId)
VALUES
	(
		'P0K_GOD_OF_SEA_COAST_RESOURCE_REQUIREMENTS',
		'REQUIRES_TERRAIN_COAST'
	),
	(
		'P0K_GOD_OF_SEA_COAST_RESOURCE_REQUIREMENTS',
		'REQUIRES_PLOT_HAS_VISIBLE_RESOURCE'
	),
	(
		'P0K_GOD_OF_SEA_OCEAN_RESOURCE_REQUIREMENTS',
		'REQUIRES_TERRAIN_OCEAN'
	),
	(
		'P0K_GOD_OF_SEA_OCEAN_RESOURCE_REQUIREMENTS',
		'REQUIRES_PLOT_HAS_VISIBLE_RESOURCE'
	),
	(
		'P0K_GOD_OF_SEA_REEF_REQUIREMENTS',
		'REQUIRES_PLOT_HAS_REEF'
	),
	(
		'P0K_GOD_OF_SEA_REEF_REQUIREMENTS',
		'P0K_BP_REQUIRES_PLOT_HAS_GREAT_BARRIER_REEF'
	);
-- Modifiers
--------------------------------------------------------------------------
INSERT INTO Modifiers
	(
	ModifierId,
	ModifierType,
	SubjectRequirementSetId
	)
VALUES
	(
		'P0K_GOD_OF_SEA_COAST_RESOURCE_PRODUCTION',
		'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',
		'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'
	),
	(
		'P0K_GOD_OF_SEA_COAST_RESOURCE_PRODUCTION_MODIFIER',
		'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',
		'P0K_GOD_OF_SEA_COAST_RESOURCE_REQUIREMENTS'
	),
	(
		'P0K_GOD_OF_SEA_OCEAN_RESOURCE_PRODUCTION',
		'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',
		'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'
	),
	(
		'P0K_GOD_OF_SEA_OCEAN_RESOURCE_PRODUCTION_MODIFIER',
		'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',
		'P0K_GOD_OF_SEA_OCEAN_RESOURCE_REQUIREMENTS'
	),
	(
		'P0K_GOD_OF_SEA_REEF_PRODUCTION',
		'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',
		'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'
	),
	(
		'P0K_GOD_OF_SEA_REEF_PRODUCTION_MODIFIER',
		'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',
		'P0K_GOD_OF_SEA_REEF_REQUIREMENTS'
	);
-- ModifierArguments
--------------------------------------------------------------------------
INSERT INTO ModifierArguments
	(ModifierId, Name, Value)
VALUES
	(
		'P0K_GOD_OF_SEA_COAST_RESOURCE_PRODUCTION',
		'ModifierId',
		'P0K_GOD_OF_SEA_COAST_RESOURCE_PRODUCTION_MODIFIER'
	),
	(
		'P0K_GOD_OF_SEA_COAST_RESOURCE_PRODUCTION_MODIFIER',
		'YieldType',
		'YIELD_PRODUCTION'
	),
	(
		'P0K_GOD_OF_SEA_COAST_RESOURCE_PRODUCTION_MODIFIER',
		'Amount',
		1
	),
	(
		'P0K_GOD_OF_SEA_OCEAN_RESOURCE_PRODUCTION',
		'ModifierId',
		'P0K_GOD_OF_SEA_OCEAN_RESOURCE_PRODUCTION_MODIFIER'
	),
	(
		'P0K_GOD_OF_SEA_OCEAN_RESOURCE_PRODUCTION_MODIFIER',
		'YieldType',
		'YIELD_PRODUCTION'
	),
	(
		'P0K_GOD_OF_SEA_OCEAN_RESOURCE_PRODUCTION_MODIFIER',
		'Amount',
		1
	),
	(
		'P0K_GOD_OF_SEA_REEF_PRODUCTION',
		'ModifierId',
		'P0K_GOD_OF_SEA_REEF_PRODUCTION_MODIFIER'
	),
	(
		'P0K_GOD_OF_SEA_REEF_PRODUCTION_MODIFIER',
		'YieldType',
		'YIELD_PRODUCTION'
	),
	(
		'P0K_GOD_OF_SEA_REEF_PRODUCTION_MODIFIER',
		'Amount',
		1
	);
-- BeliefModifiers
--------------------------------------------------------------------------
DELETE FROM BeliefModifiers
WHERE BeliefType = 'BELIEF_GOD_OF_THE_SEA';
INSERT INTO BeliefModifiers
	(BeliefType, ModifierID)
VALUES
	(
		'BELIEF_GOD_OF_THE_SEA',
		'P0K_GOD_OF_SEA_COAST_RESOURCE_PRODUCTION'
	),
	(
		'BELIEF_GOD_OF_THE_SEA',
		'P0K_GOD_OF_SEA_OCEAN_RESOURCE_PRODUCTION'
	),
	(
		'BELIEF_GOD_OF_THE_SEA',
		'P0K_GOD_OF_SEA_REEF_PRODUCTION'
	);
-- Lady of the Reeds and Marshes now applies pantanal, and gets +2 Production
INSERT INTO RequirementSetRequirements
	(RequirementSetId, RequirementId)
VALUES
	(
		'PLOT_HAS_REEDS_REQUIREMENTS',
		'REQUIRES_PLOT_HAS_PANTANAL'
	);
INSERT INTO Requirements
	(RequirementId, RequirementType)
VALUES
	(
		'REQUIRES_PLOT_HAS_PANTANAL',
		'REQUIREMENT_PLOT_FEATURE_TYPE_MATCHES'
	);
INSERT INTO RequirementArguments
	(
	RequirementId,
	Name,
	Value
	)
VALUES
	(
		'REQUIRES_PLOT_HAS_PANTANAL',
		'FeatureType',
		'FEATURE_PANTANAL'
	);
UPDATE ModifierArguments
SET Value = '2'
WHERE ModifierId = 'LADY_OF_THE_REEDS_PRODUCTION_MODIFIER'
	and Name = 'Amount';
-- DIVINE SPARK (buff)
-- +1 GPP from Commercial Hubs and Industerial Zones.
-- Modifiers
--------------------------------------------------------------------------
INSERT INTO Modifiers
	(
	ModifierId,
	ModifierType,
	SubjectRequirementSetId
	)
VALUES
	(
		'P0K_DIVINE_SPARK_COMMERCIAL_HUB',
		'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',
		'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'
	),
	(
		'P0K_DIVINE_SPARK_COMMERCIAL_HUB_MODIFIER',
		'MODIFIER_SINGLE_CITY_DISTRICTS_ADJUST_GREAT_PERSON_POINTS',
		'DISTRICT_IS_COMMERCIAL_HUB'
	),
	(
		'P0K_DIVINE_SPARK_INDUSTRIAL_ZONE',
		'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',
		'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'
	),
	(
		'P0K_DIVINE_SPARK_INDUSTRIAL_ZONE_MODIFIER',
		'MODIFIER_SINGLE_CITY_DISTRICTS_ADJUST_GREAT_PERSON_POINTS',
		'DISTRICT_IS_INDUSTRIAL_ZONE'
	);
-- ModifierArguments
--------------------------------------------------------------------------
INSERT INTO ModifierArguments
	(ModifierId, Name, Value)
VALUES
	(
		'P0K_DIVINE_SPARK_COMMERCIAL_HUB',
		'ModifierId',
		'P0K_DIVINE_SPARK_COMMERCIAL_HUB_MODIFIER'
	),
	(
		'P0K_DIVINE_SPARK_COMMERCIAL_HUB_MODIFIER',
		'GreatPersonClassType',
		'GREAT_PERSON_CLASS_MERCHANT'
	),
	(
		'P0K_DIVINE_SPARK_COMMERCIAL_HUB_MODIFIER',
		'Amount',
		1
	),
	(
		'P0K_DIVINE_SPARK_INDUSTRIAL_ZONE',
		'ModifierId',
		'P0K_DIVINE_SPARK_INDUSTRIAL_ZONE_MODIFIER'
	),
	(
		'P0K_DIVINE_SPARK_INDUSTRIAL_ZONE_MODIFIER',
		'GreatPersonClassType',
		'GREAT_PERSON_CLASS_ENGINEER'
	),
	(
		'P0K_DIVINE_SPARK_INDUSTRIAL_ZONE_MODIFIER',
		'Amount',
		1
	);
-- BeliefModifiers
--------------------------------------------------------------------------
INSERT INTO BeliefModifiers
	(BeliefType, ModifierID)
VALUES
	(
		'BELIEF_DIVINE_SPARK',
		'P0K_DIVINE_SPARK_COMMERCIAL_HUB'
	),
	(
		'BELIEF_DIVINE_SPARK',
		'P0K_DIVINE_SPARK_INDUSTRIAL_ZONE'
	);
-- Monument to the Gods affects all wonders... not just Ancient and Classical Era
UPDATE ModifierArguments
SET Value = 'ERA_INFORMATION'
WHERE ModifierId = 'MONUMENT_TO_THE_GODS_ANCIENTCLASSICALWONDER_MODIFIER'
	AND Name = 'EndEra';
-- River Goddess
INSERT INTO RequirementSets
	(RequirementSetId, RequirementSetType)
VALUES
	(
		'AEP_RIVER_FARM_REQUIREMENTS',
		'REQUIREMENTSET_TEST_ALL'
	);
INSERT INTO RequirementSetRequirements
	(RequirementSetId, RequirementId)
VALUES
	(
		'AEP_RIVER_FARM_REQUIREMENTS',
		'REQUIRES_PLOT_HAS_FARM'
	),
	(
		'AEP_RIVER_FARM_REQUIREMENTS',
		'REQUIRES_PLOT_ADJACENT_TO_RIVER'
	);
INSERT INTO Modifiers
	(
	ModifierId,
	ModifierType,
	RunOnce,
	Permanent,
	SubjectRequirementSetId
	)
VALUES
	(
		'ISIS_RIVER_FARM_FOOD',
		'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',
		0,
		0,
		'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'
	),
	(
		'ISIS_RIVER_FARM_FOOD_MODIFIER',
		'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',
		0,
		0,
		'AEP_RIVER_FARM_REQUIREMENTS'
	),
	(
		'ISIS_RIVER_FARM_FAITH',
		'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',
		0,
		0,
		'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'
	),
	(
		'ISIS_RIVER_FARM_FAITH_MODIFIER',
		'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',
		0,
		0,
		'AEP_RIVER_FARM_REQUIREMENTS'
	);
INSERT INTO ModifierArguments
	(ModifierId, Name, Value)
VALUES
	(
		'ISIS_RIVER_FARM_FOOD',
		'ModifierId',
		'ISIS_RIVER_FARM_FOOD_MODIFIER'
	),
	(
		'ISIS_RIVER_FARM_FOOD_MODIFIER',
		'YieldType',
		'YIELD_FOOD'
	),
	(
		'ISIS_RIVER_FARM_FOOD_MODIFIER',
		'Amount',
		1
	),
	(
		'ISIS_RIVER_FARM_FAITH',
		'ModifierId',
		'ISIS_RIVER_FARM_FAITH_MODIFIER'
	),
	(
		'ISIS_RIVER_FARM_FAITH_MODIFIER',
		'YieldType',
		'YIELD_FAITH'
	),
	(
		'ISIS_RIVER_FARM_FAITH_MODIFIER',
		'Amount',
		1
	);
DELETE FROM BeliefModifiers
WHERE BeliefType = 'BELIEF_RIVER_GODDESS';
INSERT INTO BeliefModifiers
	(BeliefType, ModifierID)
VALUES
	('BELIEF_RIVER_GODDESS', 'ISIS_RIVER_FARM_FOOD'),
	('BELIEF_RIVER_GODDESS', 'ISIS_RIVER_FARM_FAITH');
-- Sacred Path +1 Faith Holy Site adjacency now applies to both Woods and Rainforest
INSERT INTO BeliefModifiers
	(BeliefType, ModifierId)
VALUES
	(
		'BELIEF_SACRED_PATH',
		'SACRED_PATH_WOODS_FAITH_ADJACENCY'
	);
INSERT INTO Modifiers
	(
	ModifierId,
	ModifierType,
	SubjectRequirementSetId
	)
VALUES
	(
		'SACRED_PATH_WOODS_FAITH_ADJACENCY',
		'MODIFIER_ALL_CITIES_FEATURE_ADJACENCY',
		'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'
	);
INSERT INTO ModifierArguments
	(
	ModifierId,
	Name,
	Value
	)
VALUES
	(
		'SACRED_PATH_WOODS_FAITH_ADJACENCY',
		'DistrictType',
		'DISTRICT_HOLY_SITE'
	),
	(
		'SACRED_PATH_WOODS_FAITH_ADJACENCY',
		'FeatureType',
		'FEATURE_FOREST'
	),
	(
		'SACRED_PATH_WOODS_FAITH_ADJACENCY',
		'YieldType',
		'YIELD_FAITH'
	),
	(
		'SACRED_PATH_WOODS_FAITH_ADJACENCY',
		'Amount',
		'1'
	),
	(
		'SACRED_PATH_WOODS_FAITH_ADJACENCY',
		'Description',
		'LOC_DISTRICT_SACREDPATH_WOODS_FAITH'
	);