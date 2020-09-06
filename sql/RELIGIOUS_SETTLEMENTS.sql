--==============================================================
--******				P A N T H E O N S				  ******
--==============================================================

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