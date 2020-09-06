--==============================================================
--******				P A N T H E O N S				  ******
--==============================================================

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