--==============================================================
--******				P A N T H E O N S				  ******
--==============================================================

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