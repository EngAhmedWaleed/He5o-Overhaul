--==============================================================
--******				G O V E R N O R S				  ******
--==============================================================

--============================================
--******			Vector				******
--============================================

-- Victor combat bonus reduced to +3
UPDATE ModifierArguments SET Value='3' WHERE ModifierId='GARRISON_COMMANDER_ADJUST_CITY_COMBAT_BONUS' AND Name='Amount';

-- Start clean
DELETE FROM GovernorPromotionPrereqs WHERE GovernorPromotionType IN 
		('GOVERNOR_PROMOTION_AIR_DEFENSE_INITIATIVE','GOVERNOR_PROMOTION_DEFENSE_LOGISTICS'
		,'GOVERNOR_PROMOTION_EMBRASURE','GOVERNOR_PROMOTION_GARRISON_COMMANDER'
		,'GOVERNOR_PROMOTION_SECURITY_EXPERT');

-- Adjust dependencies
INSERT INTO GovernorPromotionPrereqs (GovernorPromotionType, PrereqGovernorPromotion)
	VALUES
		('GOVERNOR_PROMOTION_GARRISON_COMMANDER', 'GOVERNOR_PROMOTION_REDOUBT'),
		('GOVERNOR_PROMOTION_AMBASSADOR_PRESTIGE', 'GOVERNOR_PROMOTION_REDOUBT'),
		('GOVERNOR_PROMOTION_SECURITY_EXPERT', 'GOVERNOR_PROMOTION_AMBASSADOR_PRESTIGE'),
		('GOVERNOR_PROMOTION_EMBRASURE', 'GOVERNOR_PROMOTION_GARRISON_COMMANDER'),
		('GOVERNOR_PROMOTION_AIR_DEFENSE_INITIATIVE', 'GOVERNOR_PROMOTION_SECURITY_EXPERT'),
		('GOVERNOR_PROMOTION_AIR_DEFENSE_INITIATIVE', 'GOVERNOR_PROMOTION_EMBRASURE');
UPDATE GovernorPromotions SET Level=1, Column=0 WHERE GovernorPromotionType='GOVERNOR_PROMOTION_GARRISON_COMMANDER';
UPDATE GovernorPromotions SET Level=2, Column=0 WHERE GovernorPromotionType='GOVERNOR_PROMOTION_EMBRASURE';
UPDATE GovernorPromotions SET Level=1, Column=2 WHERE GovernorPromotionType='GOVERNOR_PROMOTION_AMBASSADOR_PRESTIGE';
UPDATE GovernorPromotions SET Level=2, Column=2 WHERE GovernorPromotionType='GOVERNOR_PROMOTION_SECURITY_EXPERT';
UPDATE GovernorPromotions SET Level=3, Column=1 WHERE GovernorPromotionType='GOVERNOR_PROMOTION_AIR_DEFENSE_INITIATIVE';

-- Buff Prestige
UPDATE ModifierArguments SET Value='4' WHERE ModifierId='PRESTIGE_IDENTITY_PRESSURE_TO_DOMESTIC_CITIES' AND Name='Amount';

-- +12 Loyality to Victor
UPDATE Governors SET IdentityPressure=12 WHERE GovernorType='GOVERNOR_THE_DEFENDER';

-- Remove and Merge Logistics
DELETE FROM GovernorPromotionSets WHERE GovernorPromotion='GOVERNOR_PROMOTION_DEFENSE_LOGISTICS';
UPDATE GovernorPromotionModifiers SET GovernorPromotionType='GOVERNOR_PROMOTION_EMBRASURE' WHERE GovernorPromotionType='GOVERNOR_PROMOTION_DEFENSE_LOGISTICS';
