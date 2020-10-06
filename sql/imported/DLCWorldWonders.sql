-- [Added] Remove Old Modifier from Barkal
DELETE FROM BuildingModifiers WHERE ModifierId='JEBELBARKAL_GRANT_TWO_IRON';

INSERT INTO BuildingModifiers
	(BuildingType,	ModifierId)
SELECT	
	'BUILDING_JEBEL_BARKAL', 'MAGIL_JEBEL_BARKAL_ATTACH_MODIFIER'
		FROM Civilizations WHERE Civilizations.CivilizationType = 'CIVILIZATION_NUBIA';		
		
INSERT INTO BuildingModifiers
	(BuildingType,	ModifierId)
SELECT	
	'BUILDING_ANGKOR_WAT', 'MAGIL_ANGKOR_WAT_LUXURY_EXTRA_AMENITIES'
		FROM Civilizations WHERE Civilizations.CivilizationType = 'CIVILIZATION_KHMER';	
		
--Recognizes Prasat as Temple
INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
SELECT	
	'MAGIL_CITY_HAS_TEMPLE_REQUIREMENTSET', 'MAGIL_REQUIRES_CITY_HAS_PRASAT'
		FROM Civilizations WHERE Civilizations.CivilizationType = 'CIVILIZATION_INDONESIA';
		
INSERT INTO Requirements
	(RequirementId,	RequirementType)
SELECT	
	'MAGIL_REQUIRES_CITY_HAS_PRASAT', 'REQUIREMENT_CITY_HAS_BUILDING'
		FROM Civilizations WHERE Civilizations.CivilizationType = 'CIVILIZATION_INDONESIA';		
		
INSERT INTO RequirementArguments
	(RequirementId,	Name,	Value)
SELECT	
	'MAGIL_REQUIRES_CITY_HAS_PRASAT', 'BuildingType', 'BUILDING_PRASAT'
		FROM Civilizations WHERE Civilizations.CivilizationType = 'CIVILIZATION_INDONESIA';