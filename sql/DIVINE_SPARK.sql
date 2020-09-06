--==============================================================
--******				P A N T H E O N S				  ******
--==============================================================

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