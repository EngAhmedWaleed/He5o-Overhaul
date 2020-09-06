--==============================================================
--******				P A N T H E O N S				  ******
--==============================================================

-- City Patron buff 25 % -->100 %
UPDATE ModifierArguments
SET Value = '100'
WHERE ModifierId = 'CITY_PATRON_GODDESS_DISTRICT_PRODUCTION_MODIFIER'
	AND Name = 'Amount';