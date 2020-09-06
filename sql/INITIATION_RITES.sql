--==============================================================
--******				P A N T H E O N S				  ******
--==============================================================

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