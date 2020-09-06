--==============================================================
--******				P A N T H E O N S				  ******
--==============================================================

-- Lady of the Reeds and Marshes now applies pantanal, and gets +2 Production
INSERT INTO RequirementSetRequirements
	(RequirementSetId, RequirementId)
VALUES
	(
		'PLOT_HAS_REEDS_REQUIREMENTS',
		'REQUIRES_PLOT_HAS_PANTANAL'
	);
INSERT INTO Requirements
	(RequirementId, RequirementType)
VALUES
	(
		'REQUIRES_PLOT_HAS_PANTANAL',
		'REQUIREMENT_PLOT_FEATURE_TYPE_MATCHES'
	);
INSERT INTO RequirementArguments
	(
	RequirementId,
	Name,
	Value
	)
VALUES
	(
		'REQUIRES_PLOT_HAS_PANTANAL',
		'FeatureType',
		'FEATURE_PANTANAL'
	);
UPDATE ModifierArguments
SET Value = '2'
WHERE ModifierId = 'LADY_OF_THE_REEDS_PRODUCTION_MODIFIER'
	and Name = 'Amount';