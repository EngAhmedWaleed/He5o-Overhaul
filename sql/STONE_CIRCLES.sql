--==============================================================
--******				P A N T H E O N S				  ******
--==============================================================

-- stone circles +2 faith and +1 prod
INSERT INTO Modifiers
	(
	ModifierId,
	ModifierType,
	SubjectRequirementSetId
	)
VALUES
	(
		'STONE_CIRCLES_QUARRY_PROD_BBG',
		'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',
		'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'
	),
	(
		'STONE_CIRCLES_QUARRY_PROD_MODIFIER_BBG',
		'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',
		'PLOT_HAS_QUARRY_REQUIREMENTS'
	);
INSERT INTO ModifierArguments
	(ModifierId, Name, Value)
VALUES
	(
		'STONE_CIRCLES_QUARRY_PROD_BBG',
		'ModifierId',
		'STONE_CIRCLES_QUARRY_PROD_MODIFIER_BBG'
	),
	(
		'STONE_CIRCLES_QUARRY_PROD_MODIFIER_BBG',
		'YieldType',
		'YIELD_PRODUCTION'
	),
	(
		'STONE_CIRCLES_QUARRY_PROD_MODIFIER_BBG',
		'Amount',
		'1'
	);
INSERT INTO BeliefModifiers
	(BeliefType, ModifierID)
VALUES
	(
		'BELIEF_STONE_CIRCLES',
		'STONE_CIRCLES_QUARRY_PROD_BBG'
	);