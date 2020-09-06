--==============================================================
--******				P A N T H E O N S				  ******
--==============================================================

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
