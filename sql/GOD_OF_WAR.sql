--==============================================================
--******				P A N T H E O N S				  ******
--==============================================================

-- God of War now God of War and Plunder (similar to divine spark, but better)
DELETE FROM BeliefModifiers
WHERE BeliefType = 'BELIEF_GOD_OF_WAR';
INSERT INTO Modifiers
	(
	ModifierId,
	ModifierType,
	SubjectRequirementSetId
	)
VALUES
	(
		'GOD_OF_WAR_AND_PLUNDER_HARBOR',
		'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',
		'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'
	),
	(
		'GOD_OF_WAR_AND_PLUNDER_ENCAMP',
		'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',
		'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'
	),
	(
		'GOD_OF_WAR_AND_PLUNDER_HARBOR_MODIFIER',
		'MODIFIER_SINGLE_CITY_DISTRICTS_ADJUST_GREAT_PERSON_POINTS',
		'DISTRICT_IS_HARBOR'
	),
	(
		'GOD_OF_WAR_AND_PLUNDER_ENCAMP_MODIFIER',
		'MODIFIER_SINGLE_CITY_DISTRICTS_ADJUST_GREAT_PERSON_POINTS',
		'DISTRICT_IS_ENCAMPMENT'
	);
INSERT INTO ModifierArguments
	(ModifierId, Name, Type, Value)
VALUES
	(
		'GOD_OF_WAR_AND_PLUNDER_HARBOR',
		'ModifierId',
		'ARGTYPE_IDENTITY',
		'GOD_OF_WAR_AND_PLUNDER_HARBOR_MODIFIER'
	),
	(
		'GOD_OF_WAR_AND_PLUNDER_ENCAMP',
		'ModifierId',
		'ARGTYPE_IDENTITY',
		'GOD_OF_WAR_AND_PLUNDER_ENCAMP_MODIFIER'
	),
	(
		'GOD_OF_WAR_AND_PLUNDER_HARBOR_MODIFIER',
		'GreatPersonClassType',
		'ARGTYPE_IDENTITY',
		'GREAT_PERSON_CLASS_ADMIRAL'
	),
	(
		'GOD_OF_WAR_AND_PLUNDER_ENCAMP_MODIFIER',
		'GreatPersonClassType',
		'ARGTYPE_IDENTITY',
		'GREAT_PERSON_CLASS_GENERAL'
	),
	(
		'GOD_OF_WAR_AND_PLUNDER_HARBOR_MODIFIER',
		'Amount',
		'ARGTYPE_IDENTITY',
		'1'
	),
	(
		'GOD_OF_WAR_AND_PLUNDER_ENCAMP_MODIFIER',
		'Amount',
		'ARGTYPE_IDENTITY',
		'1'
	);
INSERT INTO BeliefModifiers
	(BeliefType, ModifierId)
VALUES
	(
		'BELIEF_GOD_OF_WAR',
		'GOD_OF_WAR_AND_PLUNDER_HARBOR'
	),
	(
		'BELIEF_GOD_OF_WAR',
		'GOD_OF_WAR_AND_PLUNDER_ENCAMP'
	);
-- Create the modifier for +1 MILITARY slot.
INSERT INTO Types
	(Type, Kind)
VALUES
	(
		'GOD_OF_MARTIAL_LAW_GRANT_MILITARY_SLOT',
		'KIND_MODIFIER'
	),
	(
		'GOD_OF_MARTIAL_LAW_MILITARY_SLOT',
		'KIND_MODIFIER'
	);
INSERT INTO Modifiers
	(
	ModifierId,
	ModifierType,
	SubjectRequirementSetId
	)
VALUES
	(
		'GOD_OF_MARTIAL_LAW_GRANT_MILITARY_SLOT',
		'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',
		'PLAYER_HAS_PANTHEON_REQUIREMENTS'
	),
	(
		'GOD_OF_MARTIAL_LAW_MILITARY_SLOT',
		'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_MODIFIER',
		NULL
	);
INSERT INTO ModifierArguments
	(ModifierId, Name, Value)
VALUES
	(
		'GOD_OF_MARTIAL_LAW_GRANT_MILITARY_SLOT',
		'ModifierId',
		'GOD_OF_MARTIAL_LAW_MILITARY_SLOT'
	),
	(
		'GOD_OF_MARTIAL_LAW_MILITARY_SLOT',
		'GovernmentSlotType',
		'SLOT_MILITARY'
	);
INSERT INTO BeliefModifiers
	(BeliefType, ModifierId)
VALUES
	(
		'BELIEF_GOD_OF_WAR',
		'GOD_OF_MARTIAL_LAW_GRANT_MILITARY_SLOT'
	);