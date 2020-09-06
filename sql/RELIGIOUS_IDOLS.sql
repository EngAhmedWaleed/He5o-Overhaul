--==============================================================
--******				P A N T H E O N S				  ******
--==============================================================

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