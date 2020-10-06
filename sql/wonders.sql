--- Apadana
-- Global Apadana effect
UPDATE Modifiers Set SubjectRequirementSetId=NULL WHERE ModifierId="APADANA_AWARD_TWO_INFLUENCE_TOKEN";

--- Bolshoi Theatre
-- +2/+2 Writer and Musicail Slots
UPDATE Building_GreatWorks SET NumSlots="2" WHERE BuildingType='BUILDING_BOLSHOI_THEATRE';

--- Broadway
-- +50% calture instead of +20%
UPDATE ModifierArguments
SET Value = '50'
WHERE ModifierId = 'BROADWAY_ADDCULTUREYIELD'
	AND Name = 'Amount';

--- Casa de Contratación
-- No other continent needed for effects
UPDATE Modifiers
SET SubjectRequirementSetId = 'CITY_HAS_GOVERNOR'
WHERE ModifierId LIKE 'CONTRATACION_FOREIGN%';

--- Eiffel Tower
-- +50% Tourism in this city.
INSERT INTO Modifiers
	(ModifierId, ModifierType)
VALUES
	('EIFFELTOWER_ENHANCEDLATETOURISM', 'MODIFIER_SINGLE_CITY_ADJUST_TOURISM_LATE_ERAS');
INSERT INTO ModifierArguments
	(ModifierId, Name, Value)
VALUES
	('EIFFELTOWER_ENHANCEDLATETOURISM', 'Modifier', '50'),
	('EIFFELTOWER_ENHANCEDLATETOURISM', 'MinimumEra', 'ERA_ANCIENT');
INSERT INTO BuildingModifiers
	(BuildingType, ModifierId)
VALUES
	('BUILDING_EIFFEL_TOWER', 'EIFFELTOWER_ENHANCEDLATETOURISM');

--- Kilwa Kisiwani
-- +25% instead of +15% for its modifiers
UPDATE ModifierArguments
SET Value = '25'
WHERE ModifierId LIKE 'KILWA_%'
	AND Name = 'Amount' AND Value = '15';
-- +3 Envoy Points
INSERT INTO Modifiers
	(ModifierId, ModifierType)
VALUES
	('KILWA_INFLUENCEPOINTS', 'MODIFIER_PLAYER_ADJUST_INFLUENCE_POINTS_PER_TURN');
INSERT INTO ModifierArguments
	(ModifierId, Name, Value)
VALUES
	('KILWA_INFLUENCEPOINTS', 'Amount', '3');
INSERT INTO BuildingModifiers
	(BuildingType, ModifierId)
VALUES
	('BUILDING_KILWA_KISIWANI', 'KILWA_INFLUENCEPOINTS');

--- Kotoku-in
-- Gives Missionaries instead of Monks
UPDATE ModifierArguments
SET Value = 'UNIT_MISSIONARY'
WHERE ModifierId = 'KOTOKU_GRANTMONKS'
	AND Name = 'UnitType';
-- +50% faith instead of +20%
UPDATE ModifierArguments
SET Value = '50'
WHERE ModifierId = 'KOTOKU_ADDFAITHYIELD'
	AND Name = 'Amount' AND Value = '20';

--- Statue of Liberty
-- Global Loyalty never drops
UPDATE Modifiers Set SubjectRequirementSetId=NULL WHERE ModifierId="STATUELIBERTY_CITIES_ALWAYS_LOYAL";
