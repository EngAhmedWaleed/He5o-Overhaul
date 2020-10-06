-- [Added] Remove Old Modifier from Barkal
DELETE FROM BuildingModifiers WHERE ModifierId='JEBELBARKAL_GRANT_TWO_IRON';

INSERT INTO BuildingModifiers
	(BuildingType, ModifierId)
SELECT
	'BUILDING_JEBEL_BARKAL', 'MAGIL_JEBEL_BARKAL_ATTACH_MODIFIER'
FROM Civilizations
WHERE Civilizations.CivilizationType = 'CIVILIZATION_NUBIA';

INSERT INTO BuildingModifiers
	(BuildingType, ModifierId)
SELECT
	'BUILDING_ANGKOR_WAT', 'MAGIL_ANGKOR_WAT_LUXURY_EXTRA_AMENITIES'
FROM Civilizations
WHERE Civilizations.CivilizationType = 'CIVILIZATION_KHMER';

