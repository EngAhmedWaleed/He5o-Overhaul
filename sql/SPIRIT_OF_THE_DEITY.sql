--==============================================================
--******				P A N T H E O N S				  ******
--==============================================================

-- God of Craftsmen --> GodKing
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