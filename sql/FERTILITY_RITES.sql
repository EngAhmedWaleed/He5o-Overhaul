--==============================================================
--******				P A N T H E O N S				  ******
--==============================================================

-- Fertility Rites also gives +1 food for rice, wheat, sheep and cattle.
INSERT INTO Tags
	(Tag, Vocabulary)
VALUES
	(
		'CLASS_FERTILITY_RITES_FOOD',
		'RESOURCE_CLASS'
	);
INSERT INTO TypeTags
	(Type, Tag)
VALUES
	('RESOURCE_SHEEP', 'CLASS_FERTILITY_RITES_FOOD'),
	('RESOURCE_WHEAT', 'CLASS_FERTILITY_RITES_FOOD'),
	('RESOURCE_CATTLE', 'CLASS_FERTILITY_RITES_FOOD'),
	('RESOURCE_RICE', 'CLASS_FERTILITY_RITES_FOOD');
INSERT INTO Modifiers
	(
	ModifierId,
	ModifierType,
	SubjectRequirementSetId
	)
VALUES
	(
		'FERTILITY_RITES_TAG_FOOD',
		'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',
		'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'
	),
	(
		'FERTILITY_RITES_TAG_FOOD_MODIFIER',
		'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',
		'PLOT_HAS_FERTILITY_TAG_FOOD_REQUIREMENTS'
	);
INSERT INTO ModifierArguments
	(
	ModifierId,
	Name,
	Value
	)
VALUES
	(
		'FERTILITY_RITES_TAG_FOOD',
		'ModifierId',
		'FERTILITY_RITES_TAG_FOOD_MODIFIER'
	),
	(
		'FERTILITY_RITES_TAG_FOOD_MODIFIER',
		'YieldType',
		'YIELD_FOOD'
	),
	(
		'FERTILITY_RITES_TAG_FOOD_MODIFIER',
		'Amount',
		'1'
	);
INSERT INTO Requirements
	(
	RequirementId,
	RequirementType
	)
VALUES
	(
		'REQUIRES_PLOT_HAS_TAG_FERTILITY_FOOD',
		'REQUIREMENT_PLOT_RESOURCE_TAG_MATCHES'
	);
INSERT INTO RequirementArguments
	(
	RequirementId,
	Name,
	Value
	)
VALUES
	(
		'REQUIRES_PLOT_HAS_TAG_FERTILITY_FOOD',
		'Tag',
		'CLASS_FERTILITY_RITES_FOOD'
	);
INSERT INTO RequirementSets
	(
	RequirementSetId,
	RequirementSetType
	)
VALUES
	(
		'PLOT_HAS_FERTILITY_TAG_FOOD_REQUIREMENTS',
		'REQUIREMENTSET_TEST_ALL'
	);
INSERT INTO RequirementSetRequirements
	(
	RequirementSetId,
	RequirementId
	)
VALUES
	(
		'PLOT_HAS_FERTILITY_TAG_FOOD_REQUIREMENTS',
		'REQUIRES_PLOT_HAS_TAG_FERTILITY_FOOD'
	);
--As a buff leave it with both!
--UPDATE BeliefModifiers SET ModifierID='FERTILITY_RITES_TAG_FOOD' WHERE BeliefType='BELIEF_FERTILITY_RITES' AND ModifierID='FERTILITY_RITES_GROWTH';
INSERT INTO BeliefModifiers
	(BeliefType, ModifierId)
VALUES
	(
		'BELIEF_FERTILITY_RITES',
		'FERTILITY_RITES_TAG_FOOD'
	);