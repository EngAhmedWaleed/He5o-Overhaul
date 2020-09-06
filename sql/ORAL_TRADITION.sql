--==============================================================
--******				P A N T H E O N S				  ******
--==============================================================

-- ORAL TRADITION
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