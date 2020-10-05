--- Apadana
-- Global Apadana effect
UPDATE Modifiers Set SubjectRequirementSetId=NULL WHERE ModifierId="APADANA_AWARD_TWO_INFLUENCE_TOKEN";

--- Bolshoi Theatre
-- +2/+2 Writer and Musicail Slots
UPDATE Building_GreatWorks SET NumSlots="2" WHERE BuildingType='BUILDING_BOLSHOI_THEATRE'

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
