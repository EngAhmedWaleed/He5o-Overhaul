--==============================================================
--******				P A N T H E O N S				  ******
--==============================================================

-- Monument to the Gods affects all wonders... not just Ancient and Classical Era
UPDATE ModifierArguments
SET Value = 'ERA_INFORMATION'
WHERE ModifierId = 'MONUMENT_TO_THE_GODS_ANCIENTCLASSICALWONDER_MODIFIER'
	AND Name = 'EndEra';