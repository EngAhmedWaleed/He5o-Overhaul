--==============================================================
--******				P A N T H E O N S				  ******
--==============================================================

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