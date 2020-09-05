--==============================================================
--******				G O V E R N O R S				  ******
--==============================================================

--============================================
--******			Moshka				******
--============================================
-- SELECT GovernorPromotionSets.*, GovernorPromotionPrereqs.PrereqGovernorPromotion
-- FROM GovernorPromotionSets
-- LEFT JOIN GovernorPromotionPrereqs ON GovernorPromotionSets.GovernorPromotion=GovernorPromotionPrereqs.GovernorPromotionType 
-- WHERE GovernorType LIKE '%Cardi%'
-- ORDER BY GovernorType,GovernorPromotion;

-- delete moksha's scrapped abilities
DELETE FROM GovernorPromotions WHERE GovernorPromotionType='GOVERNOR_PROMOTION_CARDINAL_GRAND_INQUISITOR' OR GovernorPromotionType='GOVERNOR_PROMOTION_CARDINAL_LAYING_ON_OF_HANDS';
DELETE FROM GovernorPromotionSets WHERE GovernorPromotion='GOVERNOR_PROMOTION_CARDINAL_GRAND_INQUISITOR' OR GovernorPromotion='GOVERNOR_PROMOTION_CARDINAL_LAYING_ON_OF_HANDS';
DELETE FROM GovernorPromotionPrereqs WHERE GovernorPromotionType='GOVERNOR_PROMOTION_CARDINAL_GRAND_INQUISITOR' OR GovernorPromotionType='GOVERNOR_PROMOTION_CARDINAL_LAYING_ON_OF_HANDS';
DELETE FROM GovernorPromotionPrereqs WHERE PrereqGovernorPromotion='GOVERNOR_PROMOTION_CARDINAL_GRAND_INQUISITOR' OR PrereqGovernorPromotion='GOVERNOR_PROMOTION_CARDINAL_LAYING_ON_OF_HANDS';
DELETE FROM GovernorPromotionModifiers WHERE GovernorPromotionType='GOVERNOR_PROMOTION_CARDINAL_GRAND_INQUISITOR' OR GovernorPromotionType='GOVERNOR_PROMOTION_CARDINAL_LAYING_ON_OF_HANDS';

-- delete Citadel of god
DELETE FROM GovernorPromotions WHERE GovernorPromotionType='GOVERNOR_PROMOTION_CARDINAL_CITADEL_OF_GOD';
DELETE FROM GovernorPromotionSets WHERE GovernorPromotion='GOVERNOR_PROMOTION_CARDINAL_CITADEL_OF_GOD';
DELETE FROM GovernorPromotionPrereqs WHERE GovernorPromotionType='GOVERNOR_PROMOTION_CARDINAL_CITADEL_OF_GOD';
DELETE FROM GovernorPromotionPrereqs WHERE PrereqGovernorPromotion='GOVERNOR_PROMOTION_CARDINAL_CITADEL_OF_GOD';
DELETE FROM GovernorPromotionModifiers WHERE GovernorPromotionType='GOVERNOR_PROMOTION_CARDINAL_CITADEL_OF_GOD';

-- make the passive more useful + 50% Faith
UPDATE Modifiers SET ModifierType='MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER' WHERE ModifierId='CARDINAL_BISHOP_PRESSURE';
DELETE FROM ModifierArguments WHERE ModifierId='CARDINAL_BISHOP_PRESSURE';
INSERT INTO ModifierArguments (ModifierId , Name , Value) VALUES 
	('CARDINAL_BISHOP_PRESSURE', 'YieldType', 'YIELD_FAITH'),
	('CARDINAL_BISHOP_PRESSURE', 'Amount', '50');

-- move Pingala's 100% GPP to first on left ability of Moshka -- ok
UPDATE GovernorPromotionSets SET GovernorType='GOVERNOR_THE_CARDINAL' WHERE GovernorPromotion='GOVERNOR_PROMOTION_EDUCATOR_GRANTS';
UPDATE GovernorPromotions SET Level=1, Column=0 WHERE GovernorPromotionType='GOVERNOR_PROMOTION_EDUCATOR_GRANTS';
DELETE FROM GovernorPromotionPrereqs WHERE GovernorPromotionType='GOVERNOR_PROMOTION_EDUCATOR_GRANTS' OR PrereqGovernorPromotion='GOVERNOR_PROMOTION_EDUCATOR_GRANTS';
INSERT INTO GovernorPromotionPrereqs (GovernorPromotionType, PrereqGovernorPromotion) VALUES
		('GOVERNOR_PROMOTION_EDUCATOR_GRANTS', 'GOVERNOR_PROMOTION_CARDINAL_BISHOP');
		
-- 15% culture moved to 100% GPP -- ok
UPDATE GovernorPromotionModifiers SET GovernorPromotionType='GOVERNOR_PROMOTION_EDUCATOR_GRANTS' WHERE GovernorPromotionType='GOVERNOR_PROMOTION_EDUCATOR_LIBRARIAN' AND ModifierId='LIBRARIAN_CULTURE_YIELD_BONUS';
-- Make it 25%
UPDATE ModifierArguments SET Value='25' 
WHERE ModifierId IN ('LIBRARIAN_CULTURE_YIELD_BONUS') AND Name='Amount';

-- move Moksha's abilities -- ok
UPDATE GovernorPromotions SET Level=1, Column=2 WHERE GovernorPromotionType='GOVERNOR_PROMOTION_CARDINAL_DIVINE_ARCHITECT';
UPDATE GovernorPromotions SET Level=2, Column=2 WHERE GovernorPromotionType='GOVERNOR_PROMOTION_CARDINAL_PATRON_SAINT';
DELETE FROM GovernorPromotionPrereqs WHERE GovernorPromotionType='GOVERNOR_PROMOTION_CARDINAL_DIVINE_ARCHITECT' OR PrereqGovernorPromotion='GOVERNOR_PROMOTION_CARDINAL_DIVINE_ARCHITECT';
INSERT INTO GovernorPromotionPrereqs (GovernorPromotionType, PrereqGovernorPromotion) VALUES
	('GOVERNOR_PROMOTION_CARDINAL_DIVINE_ARCHITECT', 'GOVERNOR_PROMOTION_CARDINAL_BISHOP'),
	('GOVERNOR_PROMOTION_CARDINAL_PATRON_SAINT', 'GOVERNOR_PROMOTION_CARDINAL_DIVINE_ARCHITECT');

-- Move +1 Culture to Moksha (Moved Theater +20%) -- ok
UPDATE GovernorPromotionSets SET GovernorType='GOVERNOR_THE_CARDINAL' WHERE GovernorPromotion='GOVERNOR_PROMOTION_EDUCATOR_CONNOISSEUR';
UPDATE GovernorPromotions SET Level=2, Column=0 WHERE GovernorPromotionType='GOVERNOR_PROMOTION_EDUCATOR_CONNOISSEUR';
DELETE FROM GovernorPromotionPrereqs WHERE GovernorPromotionType='GOVERNOR_PROMOTION_EDUCATOR_CONNOISSEUR' OR PrereqGovernorPromotion='GOVERNOR_PROMOTION_EDUCATOR_CONNOISSEUR';
INSERT INTO GovernorPromotionPrereqs (GovernorPromotionType, PrereqGovernorPromotion) VALUES
	('GOVERNOR_PROMOTION_EDUCATOR_CONNOISSEUR', 'GOVERNOR_PROMOTION_EDUCATOR_GRANTS');

-- Curator moved to last moksha ability --ok
UPDATE GovernorPromotionSets SET GovernorType='GOVERNOR_THE_CARDINAL' WHERE GovernorPromotion='GOVERNOR_PROMOTION_MERCHANT_CURATOR';
UPDATE GovernorPromotions SET Column=1 WHERE GovernorPromotionType='GOVERNOR_PROMOTION_MERCHANT_CURATOR';
DELETE FROM GovernorPromotionPrereqs WHERE GovernorPromotionType='GOVERNOR_PROMOTION_MERCHANT_CURATOR';
INSERT INTO GovernorPromotionPrereqs (GovernorPromotionType, PrereqGovernorPromotion)
	VALUES
		('GOVERNOR_PROMOTION_MERCHANT_CURATOR', 'GOVERNOR_PROMOTION_EDUCATOR_CONNOISSEUR'),
		('GOVERNOR_PROMOTION_MERCHANT_CURATOR', 'GOVERNOR_PROMOTION_CARDINAL_PATRON_SAINT');

-- Buff to 100%
-- SELECT * FROM GovernorPromotionModifiers WHERE GovernorPromotionType LIKE '%DIVINE_ARCHITECT%';
-- CARDINAL_FASTER_HOLY_SITE_BUILDING_CONSTRUCTION
-- SELECT * FROM GovernorPromotionModifiers WHERE GovernorPromotionType LIKE '%CONNOISSEUR%';
-- CONNOISSEUR_FASTER_THEATER_DISTRICT_BUILDING_CONSTRUCTION
UPDATE ModifierArguments SET Value='100' 
WHERE ModifierId IN ('CARDINAL_FASTER_HOLY_SITE_BUILDING_CONSTRUCTION','CONNOISSEUR_FASTER_THEATER_DISTRICT_BUILDING_CONSTRUCTION') AND Name='Amount';
