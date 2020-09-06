--==============================================================
--******				P A N T H E O N S				  ******
--==============================================================

-- BELIEF_GODDESS_OF_THE_HUNT gets +1 calture from pastures
UPDATE BeliefModifiers
SET BeliefType = 'BELIEF_GODDESS_OF_THE_HUNT'
WHERE BeliefType = 'BELIEF_GOD_OF_THE_OPEN_SKY'
	AND ModifierID = 'GOD_OF_THE_OPEN_SKY_PASTURE_CULTURE';