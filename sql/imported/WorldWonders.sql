--This file contains all changes related to vanilla world wonders. They may be altered by files later in the load order dependent on enabled expansions.

--Buildings
UPDATE Buildings SET AdjacentResource=NULL WHERE BuildingType='BUILDING_GREAT_ZIMBABWE' AND AdjacentResource='RESOURCE_CATTLE';
UPDATE Buildings SET Entertainment='3' WHERE BuildingType='BUILDING_ESTADIO_DO_MARACANA';

--Modifiers
INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	
	--Great Lighthouse
	('MAGIL_GREAT_LIGHTHOUSE_HARBOR_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_DISTRICT_PRODUCTION', 0, 0, NULL, NULL),
	('MAGIL_GREAT_LIGHTHOUSE_HARBOR_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_DISTRICT_PRODUCTION', 0, 0, NULL, NULL),
	('MAGIL_GREAT_LIGHTHOUSE_LIGHTHOUSE_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION', 0, 0, NULL, NULL),
	('MAGIL_GREAT_LIGHTHOUSE_SHIPYARD_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION', 0, 0, NULL, NULL),
	('MAGIL_GREAT_LIGHTHOUSE_SEAPORT_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION', 0, 0, NULL, NULL),
	('MAGIL_GREAT_LIGHTHOUSE_ATTACH_ABILITY', 'MODIFIER_PLAYER_UNITS_GRANT_ABILITY', 0, 1, NULL, NULL),
	--Mahabodhi Temple
	('MAGIL_MAHABODHI_TEMPLE_HOLYSITE_WITH_SHRINE_PRODUCTION', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE', 0, 0, NULL, 'MAGIL_DISTRICT_IS_HOLY_SITE_WITH_SHRINE'),		
	('MAGIL_MAHABODHI_TEMPLE_HOLYSITE_WITH_TEMPLE_PRODUCTION', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE', 0, 0, NULL, 'MAGIL_DISTRICT_IS_HOLY_SITE_WITH_TEMPLE'),		
	('MAGIL_MAHABODHI_TEMPLE_HOLYSITE_WITH_WORSHIP_PRODUCTION', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE', 0, 0, NULL, 'MAGIL_DISTRICT_IS_HOLY_SITE_WITH_WORSHIP'),	
	--Hagia Sophia
	('MAGIL_HAGIA_SOPHIA_HOLYSITE_WITH_SHRINE_SCIENCE', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE', 0, 0, NULL, 'MAGIL_DISTRICT_IS_HOLY_SITE_WITH_SHRINE'),		
	('MAGIL_HAGIA_SOPHIA_HOLYSITE_WITH_TEMPLE_SCIENCE', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE', 0, 0, NULL, 'MAGIL_DISTRICT_IS_HOLY_SITE_WITH_TEMPLE'),		
	('MAGIL_HAGIA_SOPHIA_HOLYSITE_WITH_WORSHIP_SCIENCE', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE', 0, 0, NULL, 'MAGIL_DISTRICT_IS_HOLY_SITE_WITH_WORSHIP'),			
	--Mont St. Michel
	('MAGIL_MONT_ST_MICHEL_BONUS_MODIFIER', 'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH', 0, 0, NULL, NULL),	
	('MAGIL_MONT_ST_MICHEL_ATTACH_ABILITY', 'MODIFIER_PLAYER_UNITS_GRANT_ABILITY', 0, 1, NULL, NULL),	
	
	('MAGIL_MONT_ST_MICHEL_HOLYSITE_WITH_SHRINE_CULTURE', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE', 0, 0, NULL, 'MAGIL_DISTRICT_IS_HOLY_SITE_WITH_SHRINE'),		
	('MAGIL_MONT_ST_MICHEL_HOLYSITE_WITH_TEMPLE_CULTURE', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE', 0, 0, NULL, 'MAGIL_DISTRICT_IS_HOLY_SITE_WITH_TEMPLE'),		
	('MAGIL_MONT_ST_MICHEL_HOLYSITE_WITH_WORSHIP_CULTURE', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE', 0, 0, NULL, 'MAGIL_DISTRICT_IS_HOLY_SITE_WITH_WORSHIP'),
	--Hermitage
	('MAGIL_HERMITAGE_MUSEUM_AUTO_THEME', 'MODIFIER_PLAYER_ADJUST_AUTO_THEMED_BUILDING', 0, 0, NULL, NULL),
	--Sydney Opera House
	('MAGIL_SYDNEY_OPERA_HOUSE_THEATER_TOURISM', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_TOURISM_CHANGE', 0, 1, NULL, 'MAGIL_DISTRICT_IS_THEATER_WITH_BROADCAST_REQUIREMENTS'),
	('MAGIL_SYDNEY_OPERA_INCREASED_TOURISM', 'MODIFIER_PLAYER_ADJUST_TOURISM', 0, 0, NULL, NULL),	
	--Ruhr Valley
	('MAGIL_RUHR_VALLEY_MINE_PRODUCTION', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 0, 0, NULL, 'MAGIL_PLOT_HAS_RIVER_MINE_REQUIREMENTS'),	
	('MAGIL_RUHR_VALLEY_QUARRY_PRODUCTION', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 0, 0, NULL, 'MAGIL_PLOT_HAS_RIVER_QUARRY_REQUIREMENTS'),	
	('MAGIL_RUHR_VALLEY_LUMBERMILL_PRODUCTION', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 0, 0, NULL, 'MAGIL_PLOT_HAS_RIVER_LUMBERMILL_REQUIREMENTS'),	
	--Great Zimbabwe
	('MAGIL_GREAT_ZIMBABWE_GOLD_PER_DOMESTIC_POST', 'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_PER_POST_IN_OWN_CITY', 0, 0, NULL, NULL),	
	('MAGIL_GREAT_ZIMBABWE_GOLD_PER_FOREIGN_POST', 'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_PER_POST_IN_FOREIGN_CITY', 0, 0, NULL, NULL),	
	--Estadio do Maracana
	('MAGIL_ESTADIO_DO_MARACANA_DISTRICTPROJECT_BONUS', 'MODIFIER_PLAYER_CITIES_ADJUST_ALL_PROJECTS_PRODUCTION', 0, 0, NULL, NULL),	
	
	--DLC WONDERS
	--Angkor Wat
	('MAGIL_ANGKOR_WAT_LUXURY_EXTRA_AMENITIES', 'MODIFIER_PLAYER_OWNED_LUXURY_EXTRA_AMENITIES', 0, 0, NULL, NULL),			
	--Jebel Barkal
	('MAGIL_JEBEL_BARKAL_ATTACH_MODIFIER', 'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, NULL, NULL),			
	('MAGIL_JEBEL_BARKAL_FAITH_FROM_UNITS', 'MODIFIER_SINGLE_CITY_GRANT_YIELD_PER_UNIT_COST', 1, 1, NULL, NULL);

INSERT INTO ModifierArguments
	(ModifierId, Name, Value, Extra, SecondExtra)
VALUES	
	--Great Lighthouse
	('MAGIL_GREAT_LIGHTHOUSE_ATTACH_ABILITY', 'AbilityType', 'MAGIL_ABILITY_GREATLIGHTHOUSE_SIGHT', NULL, NULL),

	('MAGIL_GREAT_LIGHTHOUSE_HARBOR_PRODUCTION', 'DistrictType', 'DISTRICT_HARBOR', NULL, NULL),
	('MAGIL_GREAT_LIGHTHOUSE_HARBOR_PRODUCTION', 'Amount', '50', NULL, NULL),
	
	('MAGIL_GREAT_LIGHTHOUSE_LIGHTHOUSE_PRODUCTION', 'BuildingType', 'BUILDING_LIGHTHOUSE', NULL, NULL),
	('MAGIL_GREAT_LIGHTHOUSE_LIGHTHOUSE_PRODUCTION', 'Amount', '50', NULL, NULL),
	
	('MAGIL_GREAT_LIGHTHOUSE_SHIPYARD_PRODUCTION', 'BuildingType', 'BUILDING_SHIPYARD', NULL, NULL),
	('MAGIL_GREAT_LIGHTHOUSE_SHIPYARD_PRODUCTION', 'Amount', '50', NULL, NULL),
	
	('MAGIL_GREAT_LIGHTHOUSE_SEAPORT_PRODUCTION', 'BuildingType', 'BUILDING_SEAPORT', NULL, NULL),
	('MAGIL_GREAT_LIGHTHOUSE_SEAPORT_PRODUCTION', 'Amount', '50', NULL, NULL),
	
	--Mahabodhi Temple
	('MAGIL_MAHABODHI_TEMPLE_HOLYSITE_WITH_SHRINE_PRODUCTION', 'YieldType', 'YIELD_PRODUCTION', NULL, NULL),
	('MAGIL_MAHABODHI_TEMPLE_HOLYSITE_WITH_SHRINE_PRODUCTION', 'Amount', '2', NULL, NULL),	

	('MAGIL_MAHABODHI_TEMPLE_HOLYSITE_WITH_TEMPLE_PRODUCTION', 'YieldType', 'YIELD_PRODUCTION', NULL, NULL),
	('MAGIL_MAHABODHI_TEMPLE_HOLYSITE_WITH_TEMPLE_PRODUCTION', 'Amount', '2', NULL, NULL),
	
	('MAGIL_MAHABODHI_TEMPLE_HOLYSITE_WITH_WORSHIP_PRODUCTION', 'YieldType', 'YIELD_PRODUCTION', NULL, NULL),
	('MAGIL_MAHABODHI_TEMPLE_HOLYSITE_WITH_WORSHIP_PRODUCTION', 'Amount', '2', NULL, NULL),
	
	--Hagia Sophia	
	('MAGIL_HAGIA_SOPHIA_HOLYSITE_WITH_SHRINE_SCIENCE', 'YieldType', 'YIELD_SCIENCE', NULL, NULL),
	('MAGIL_HAGIA_SOPHIA_HOLYSITE_WITH_SHRINE_SCIENCE', 'Amount', '2', NULL, NULL),	

	('MAGIL_HAGIA_SOPHIA_HOLYSITE_WITH_TEMPLE_SCIENCE', 'YieldType', 'YIELD_SCIENCE', NULL, NULL),
	('MAGIL_HAGIA_SOPHIA_HOLYSITE_WITH_TEMPLE_SCIENCE', 'Amount', '2', NULL, NULL),
	
	('MAGIL_HAGIA_SOPHIA_HOLYSITE_WITH_WORSHIP_SCIENCE', 'YieldType', 'YIELD_SCIENCE', NULL, NULL),
	('MAGIL_HAGIA_SOPHIA_HOLYSITE_WITH_WORSHIP_SCIENCE', 'Amount', '2', NULL, NULL),
	
	--Mont St. Michel
	('MAGIL_MONT_ST_MICHEL_ATTACH_ABILITY', 'AbilityType', 'MAGIL_MONT_ST_MICHEL_BONUS', NULL, NULL),
	('MAGIL_MONT_ST_MICHEL_BONUS_MODIFIER', 'Amount', '10', NULL, NULL),	
	
	('MAGIL_MONT_ST_MICHEL_HOLYSITE_WITH_SHRINE_CULTURE', 'YieldType', 'YIELD_CULTURE', NULL, NULL),
	('MAGIL_MONT_ST_MICHEL_HOLYSITE_WITH_SHRINE_CULTURE', 'Amount', '2', NULL, NULL),	

	('MAGIL_MONT_ST_MICHEL_HOLYSITE_WITH_TEMPLE_CULTURE', 'YieldType', 'YIELD_CULTURE', NULL, NULL),
	('MAGIL_MONT_ST_MICHEL_HOLYSITE_WITH_TEMPLE_CULTURE', 'Amount', '2', NULL, NULL),
	
	('MAGIL_MONT_ST_MICHEL_HOLYSITE_WITH_WORSHIP_CULTURE', 'YieldType', 'YIELD_CULTURE', NULL, NULL),
	('MAGIL_MONT_ST_MICHEL_HOLYSITE_WITH_WORSHIP_CULTURE', 'Amount', '2', NULL, NULL),	
	
	--Hermitage
	('MAGIL_HERMITAGE_MUSEUM_AUTO_THEME', 'BuildingType', 'BUILDING_MUSEUM_ART', NULL, NULL),	
	
	--Sydney Opera House
	('MAGIL_SYDNEY_OPERA_HOUSE_THEATER_TOURISM', 'Amount', '10', NULL, NULL),		
	('MAGIL_SYDNEY_OPERA_INCREASED_TOURISM', 'Amount', '50', NULL, NULL),	
	
	--Ruhr Valley
	('MAGIL_RUHR_VALLEY_MINE_PRODUCTION', 'YieldType', 'YIELD_PRODUCTION', NULL, NULL),
	('MAGIL_RUHR_VALLEY_MINE_PRODUCTION', 'Amount', '1', NULL, NULL),	

	('MAGIL_RUHR_VALLEY_QUARRY_PRODUCTION', 'YieldType', 'YIELD_PRODUCTION', NULL, NULL),
	('MAGIL_RUHR_VALLEY_QUARRY_PRODUCTION', 'Amount', '1', NULL, NULL),
	
	('MAGIL_RUHR_VALLEY_LUMBERMILL_PRODUCTION', 'YieldType', 'YIELD_PRODUCTION', NULL, NULL),
	('MAGIL_RUHR_VALLEY_LUMBERMILL_PRODUCTION', 'Amount', '1', NULL, NULL),	
	
	--Great Zimbabwe
	('MAGIL_GREAT_ZIMBABWE_GOLD_PER_DOMESTIC_POST', 'YieldType', 'YIELD_GOLD', NULL, NULL),
	('MAGIL_GREAT_ZIMBABWE_GOLD_PER_DOMESTIC_POST', 'Amount', '1', NULL, NULL),		
	
	('MAGIL_GREAT_ZIMBABWE_GOLD_PER_FOREIGN_POST', 'YieldType', 'YIELD_GOLD', NULL, NULL),
	('MAGIL_GREAT_ZIMBABWE_GOLD_PER_FOREIGN_POST', 'Amount', '1', NULL, NULL),	
	
	--Estadio do Maracana
	('MAGIL_ESTADIO_DO_MARACANA_DISTRICTPROJECT_BONUS', 'Amount', '20', NULL, NULL),	
	
--DLC WONDERS
	--Angkor Wat
	('MAGIL_ANGKOR_WAT_LUXURY_EXTRA_AMENITIES', 'Amount', '1', NULL, NULL),	
	
	--Jebel Barkal
	('MAGIL_JEBEL_BARKAL_ATTACH_MODIFIER', 'ModifierId', 'MAGIL_JEBEL_BARKAL_FAITH_FROM_UNITS', NULL, NULL),
	
	('MAGIL_JEBEL_BARKAL_FAITH_FROM_UNITS', 'YieldType', 'YIELD_FAITH', NULL, NULL),
	('MAGIL_JEBEL_BARKAL_FAITH_FROM_UNITS', 'UnitProductionPercent', '25', NULL, NULL);

--Attaching Modifiers to Buildings

UPDATE BuildingModifiers SET BuildingType='BUILDING_HERMITAGE' WHERE BuildingType='BUILDING_BROADWAY' AND ModifierId='BROADWAY_ADDCULTUREYIELD';

DELETE FROM BuildingModifiers WHERE BuildingType='BUILDING_GREAT_ZIMBABWE';
DELETE FROM BuildingModifiers WHERE BuildingType='BUILDING_MONT_ST_MICHEL';
DELETE FROM BuildingModifiers WHERE BuildingType='BUILDING_RUHR_VALLEY';


INSERT INTO BuildingModifiers
	(BuildingType, ModifierId)
VALUES	
	('BUILDING_GREAT_LIGHTHOUSE', 'MAGIL_GREAT_LIGHTHOUSE_HARBOR_PRODUCTION'),	
	('BUILDING_GREAT_LIGHTHOUSE', 'MAGIL_GREAT_LIGHTHOUSE_LIGHTHOUSE_PRODUCTION'),	
	('BUILDING_GREAT_LIGHTHOUSE', 'MAGIL_GREAT_LIGHTHOUSE_SHIPYARD_PRODUCTION'),
	('BUILDING_GREAT_LIGHTHOUSE', 'MAGIL_GREAT_LIGHTHOUSE_SEAPORT_PRODUCTION'),	
	('BUILDING_GREAT_LIGHTHOUSE', 'MAGIL_GREAT_LIGHTHOUSE_ATTACH_ABILITY'),
	
	('BUILDING_MAHABODHI_TEMPLE', 'MAGIL_MAHABODHI_TEMPLE_HOLYSITE_WITH_SHRINE_PRODUCTION'),	
	('BUILDING_MAHABODHI_TEMPLE', 'MAGIL_MAHABODHI_TEMPLE_HOLYSITE_WITH_TEMPLE_PRODUCTION'),
	('BUILDING_MAHABODHI_TEMPLE', 'MAGIL_MAHABODHI_TEMPLE_HOLYSITE_WITH_WORSHIP_PRODUCTION'),		
		
	('BUILDING_HAGIA_SOPHIA', 'MAGIL_HAGIA_SOPHIA_HOLYSITE_WITH_SHRINE_SCIENCE'),	
	('BUILDING_HAGIA_SOPHIA', 'MAGIL_HAGIA_SOPHIA_HOLYSITE_WITH_TEMPLE_SCIENCE'),
	('BUILDING_HAGIA_SOPHIA', 'MAGIL_HAGIA_SOPHIA_HOLYSITE_WITH_WORSHIP_SCIENCE'),		
	
	('BUILDING_MONT_ST_MICHEL', 'MAGIL_MONT_ST_MICHEL_ATTACH_ABILITY'),	
	('BUILDING_MONT_ST_MICHEL', 'MAGIL_MONT_ST_MICHEL_HOLYSITE_WITH_SHRINE_CULTURE'),	
	('BUILDING_MONT_ST_MICHEL', 'MAGIL_MONT_ST_MICHEL_HOLYSITE_WITH_TEMPLE_CULTURE'),
	('BUILDING_MONT_ST_MICHEL', 'MAGIL_MONT_ST_MICHEL_HOLYSITE_WITH_WORSHIP_CULTURE'),		
	
	('BUILDING_GREAT_ZIMBABWE', 'GREAT_ZIMBABWE_ADDTRADEROUTE'),
	('BUILDING_GREAT_ZIMBABWE', 'MAGIL_GREAT_ZIMBABWE_GOLD_PER_DOMESTIC_POST'),	
	('BUILDING_GREAT_ZIMBABWE', 'MAGIL_GREAT_ZIMBABWE_GOLD_PER_FOREIGN_POST'),		
	
	('BUILDING_HERMITAGE', 'MAGIL_HERMITAGE_MUSEUM_AUTO_THEME'),			
	
	('BUILDING_ESTADIO_DO_MARACANA', 'MAGIL_ESTADIO_DO_MARACANA_DISTRICTPROJECT_BONUS'),
	
	('BUILDING_RUHR_VALLEY', 'RUHR_VALLEY_PRODUCTION_MODIFIER'),	
	('BUILDING_RUHR_VALLEY', 'MAGIL_RUHR_VALLEY_MINE_PRODUCTION'),	
	('BUILDING_RUHR_VALLEY', 'MAGIL_RUHR_VALLEY_QUARRY_PRODUCTION'),	
	('BUILDING_RUHR_VALLEY', 'MAGIL_RUHR_VALLEY_LUMBERMILL_PRODUCTION'),
	
	('BUILDING_SYDNEY_OPERA_HOUSE', 'MAGIL_SYDNEY_OPERA_HOUSE_THEATER_TOURISM'),
	('BUILDING_SYDNEY_OPERA_HOUSE', 'MAGIL_SYDNEY_OPERA_INCREASED_TOURISM');	
	
--Setting up Requirements	
INSERT INTO Requirements
	(RequirementId,	RequirementType,	Inverse)
VALUES	
	('MAGIL_PLOT_HAS_WOODS', 'REQUIREMENT_PLOT_FEATURE_TYPE_MATCHES', 0),	
	('MAGIL_REQUIRES_LIBRARY', 'REQUIREMENT_CITY_HAS_BUILDING', 0),	
	('MAGIL_CITY_HAS_MAHABODHI_TEMPLE', 'REQUIREMENT_CITY_HAS_BUILDING', 0),	
	('MAGIL_REQUIRES_PLOT_HAS_LUMBERMILL', 'REQUIREMENT_PLOT_IMPROVEMENT_TYPE_MATCHES', 0),		
	('MAGIL_REQUIRES_CITY_HAS_TEMPLE', 'REQUIREMENT_REQUIREMENTSET_IS_MET', 0),	
	('MAGIL_REQUIRES_CITY_HAS_WORSHIP', 'REQUIREMENT_REQUIREMENTSET_IS_MET', 0),	
	('MAGIL_REQUIRES_CITY_HAS_CATHEDRAL', 'REQUIREMENT_CITY_HAS_BUILDING', 0),	
	('MAGIL_REQUIRES_CITY_HAS_GURDWARA', 'REQUIREMENT_CITY_HAS_BUILDING', 0),	
	('MAGIL_REQUIRES_CITY_HAS_MEETINGHOUSE', 'REQUIREMENT_CITY_HAS_BUILDING', 0),	
	('MAGIL_REQUIRES_CITY_HAS_MOSQUE', 'REQUIREMENT_CITY_HAS_BUILDING', 0),	
	('MAGIL_REQUIRES_CITY_HAS_PAGODA', 'REQUIREMENT_CITY_HAS_BUILDING', 0),	
	('MAGIL_REQUIRES_CITY_HAS_SYNAGOGUE', 'REQUIREMENT_CITY_HAS_BUILDING', 0),	
	('MAGIL_REQUIRES_CITY_HAS_WAT', 'REQUIREMENT_CITY_HAS_BUILDING', 0),	
	('MAGIL_REQUIRES_CITY_HAS_STUPA', 'REQUIREMENT_CITY_HAS_BUILDING', 0),	
	('MAGIL_REQUIRES_CITY_HAS_DAREMEHR', 'REQUIREMENT_CITY_HAS_BUILDING', 0),	
	('MAGIL_REQUIRES_CITY_HAS_MONUMENT', 'REQUIREMENT_CITY_HAS_BUILDING', 0),
	('MAGIL_CITY_HAS_VENETIAN_ARSENAL', 'REQUIREMENT_CITY_HAS_BUILDING', 0),
	('MAGIL_PLOT_HAS_INDUSTRIAL_ZONE', 'REQUIREMENT_PLOT_DISTRICT_TYPE_MATCHES', 0),
	('MAGIL_PLOT_HAS_CITY_CENTER', 'REQUIREMENT_PLOT_DISTRICT_TYPE_MATCHES', 0),
	('MAGIL_REQUIRES_CITY_HAS_BROADCAST_TOWER', 'REQUIREMENT_CITY_HAS_BUILDING', 0),	
	('MAGIL_REQUIRES_CITY_HAS_FILM_STUDIO', 'REQUIREMENT_CITY_HAS_BUILDING', 0),
	('MAGIL_REQUIRES_CITY_HAS_BROADCAST_OR_STUDIO_REQUIREMENTSET', 'REQUIREMENT_REQUIREMENTSET_IS_MET', 0);
	
INSERT INTO RequirementArguments
	(RequirementId,	Name,	Value,	Extra,	SecondExtra)
VALUES	
	('MAGIL_PLOT_HAS_WOODS', 'FeatureType', 'FEATURE_FOREST', NULL, NULL),		
	('MAGIL_REQUIRES_LIBRARY', 'BuildingType', 'BUILDING_LIBRARY', NULL, NULL),		
	('MAGIL_CITY_HAS_MAHABODHI_TEMPLE', 'BuildingType', 'BUILDING_MAHABODHI_TEMPLE', NULL, NULL),		
	('MAGIL_REQUIRES_PLOT_HAS_LUMBERMILL', 'ImprovementType', 'IMPROVEMENT_LUMBER_MILL', NULL, NULL),			
	('MAGIL_PLOT_HAS_INDUSTRIAL_ZONE', 'DistrictType', 'DISTRICT_INDUSTRIAL_ZONE', NULL, NULL),		
	('MAGIL_PLOT_HAS_CITY_CENTER', 'DistrictType', 'DISTRICT_CITY_CENTER', NULL, NULL),			
	('MAGIL_REQUIRES_CITY_HAS_TEMPLE', 'RequirementSetId', 'MAGIL_CITY_HAS_TEMPLE_REQUIREMENTSET', NULL, NULL),		
	('MAGIL_REQUIRES_CITY_HAS_WORSHIP', 'RequirementSetId', 'MAGIL_CITY_HAS_WORSHIP_REQUIREMENTSET', NULL, NULL),		
	('MAGIL_REQUIRES_CITY_HAS_CATHEDRAL', 'BuildingType', 'BUILDING_CATHEDRAL', NULL, NULL),		
	('MAGIL_REQUIRES_CITY_HAS_GURDWARA', 'BuildingType', 'BUILDING_GURDWARA', NULL, NULL),		
	('MAGIL_REQUIRES_CITY_HAS_MEETINGHOUSE', 'BuildingType', 'BUILDING_MEETING_HOUSE', NULL, NULL),		
	('MAGIL_REQUIRES_CITY_HAS_MOSQUE', 'BuildingType', 'BUILDING_MOSQUE', NULL, NULL),		
	('MAGIL_REQUIRES_CITY_HAS_PAGODA', 'BuildingType', 'BUILDING_PAGODA', NULL, NULL),		
	('MAGIL_REQUIRES_CITY_HAS_SYNAGOGUE', 'BuildingType', 'BUILDING_SYNAGOGUE', NULL, NULL),		
	('MAGIL_REQUIRES_CITY_HAS_WAT', 'BuildingType', 'BUILDING_WAT', NULL, NULL),		
	('MAGIL_REQUIRES_CITY_HAS_STUPA', 'BuildingType', 'BUILDING_STUPA', NULL, NULL),		
	('MAGIL_REQUIRES_CITY_HAS_DAREMEHR', 'BuildingType', 'BUILDING_DAR_E_MEHR', NULL, NULL),
	('MAGIL_CITY_HAS_VENETIAN_ARSENAL', 'BuildingType', 'BUILDING_VENETIAN_ARSENAL', NULL, NULL),	
	('MAGIL_REQUIRES_CITY_HAS_MONUMENT', 'BuildingType', 'BUILDING_MONUMENT', NULL, NULL),
	('MAGIL_REQUIRES_CITY_HAS_BROADCAST_TOWER', 'BuildingType', 'BUILDING_BROADCAST_CENTER', NULL, NULL),		
	('MAGIL_REQUIRES_CITY_HAS_FILM_STUDIO', 'BuildingType', 'BUILDING_FILM_STUDIO', NULL, NULL),		
	('MAGIL_REQUIRES_CITY_HAS_BROADCAST_OR_STUDIO_REQUIREMENTSET', 'RequirementSetId', 'MAGIL_CITY_HAS_BROADCAST_TOWER_REQUIREMENTS', NULL, NULL);

--Setting up Requirement sets

INSERT INTO RequirementSets
	(RequirementSetId,	RequirementSetType)
VALUES	
	('MAGIL_CITY_HAS_MAHABODHI_TEMPLE_REQUIREMENTS', 'REQUIREMENTSET_TEST_ALL'),	
	('MAGIL_PLOT_HAS_WOODS_REQUIREMENTS', 'REQUIREMENTSET_TEST_ALL'),	
	('MAGIL_REQUIRES_LIBRARY_REQUIREMENTS', 'REQUIREMENTSET_TEST_ALL'),	
	('MAGIL_PLOT_HAS_RIVER_MINE_REQUIREMENTS', 'REQUIREMENTSET_TEST_ALL'),	
	('MAGIL_PLOT_HAS_RIVER_QUARRY_REQUIREMENTS', 'REQUIREMENTSET_TEST_ALL'),	
	('MAGIL_PLOT_HAS_RIVER_LUMBERMILL_REQUIREMENTS', 'REQUIREMENTSET_TEST_ALL'),	
	('MAGIL_REQUIRES_INDUSTRIAL_ZONE_ON_RIVER', 'REQUIREMENTSET_TEST_ALL'),	
	('MAGIL_CITY_HAS_VENETIAN_ARSENAL_REQUIREMENTS', 'REQUIREMENTSET_TEST_ALL'),	
	('MAGIL_PLOT_IS_TERRAIN_COAST_REQUIREMENTS', 'REQUIREMENTSET_TEST_ALL'),	
	('MAGIL_DISTRICT_IS_HOLY_SITE_WITH_SHRINE', 'REQUIREMENTSET_TEST_ALL'),	
	('MAGIL_DISTRICT_IS_HOLY_SITE_WITH_TEMPLE', 'REQUIREMENTSET_TEST_ALL'),	
	('MAGIL_CITY_HAS_TEMPLE_REQUIREMENTSET', 'REQUIREMENTSET_TEST_ANY'),	
	('MAGIL_DISTRICT_IS_HOLY_SITE_WITH_WORSHIP', 'REQUIREMENTSET_TEST_ALL'),	
	('MAGIL_CITY_HAS_WORSHIP_REQUIREMENTSET', 'REQUIREMENTSET_TEST_ANY'),	
	('MAGIL_DISTRICT_IS_CITYCENTER_WITH_MONUMENT', 'REQUIREMENTSET_TEST_ALL'),	
	('MAGIL_DISTRICT_IS_WONDER_REQUIREMENTS', 'REQUIREMENTSET_TEST_ALL'),
	('MAGIL_CITY_HAS_BROADCAST_TOWER_REQUIREMENTS', 'REQUIREMENTSET_TEST_ANY'),	
	('MAGIL_DISTRICT_IS_THEATER_WITH_BROADCAST_REQUIREMENTS', 'REQUIREMENTSET_TEST_ALL');
	
INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	
	('MAGIL_CITY_HAS_MAHABODHI_TEMPLE_REQUIREMENTS', 'MAGIL_CITY_HAS_MAHABODHI_TEMPLE'),	
	('MAGIL_PLOT_HAS_WOODS_REQUIREMENTS', 'MAGIL_PLOT_HAS_WOODS'),	
	('MAGIL_REQUIRES_LIBRARY_REQUIREMENTS', 'MAGIL_REQUIRES_LIBRARY'),	
	('MAGIL_PLOT_HAS_RIVER_MINE_REQUIREMENTS', 'REQUIRES_PLOT_ADJACENT_TO_RIVER'),	
	('MAGIL_PLOT_HAS_RIVER_MINE_REQUIREMENTS', 'REQUIRES_PLOT_HAS_MINE'),	
	('MAGIL_PLOT_HAS_RIVER_QUARRY_REQUIREMENTS', 'REQUIRES_PLOT_ADJACENT_TO_RIVER'),	
	('MAGIL_PLOT_HAS_RIVER_QUARRY_REQUIREMENTS', 'REQUIRES_PLOT_HAS_QUARRY'),	
	('MAGIL_PLOT_HAS_RIVER_LUMBERMILL_REQUIREMENTS', 'REQUIRES_PLOT_ADJACENT_TO_RIVER'),	
	('MAGIL_PLOT_HAS_RIVER_LUMBERMILL_REQUIREMENTS', 'MAGIL_REQUIRES_PLOT_HAS_LUMBERMILL'),	
	('MAGIL_REQUIRES_INDUSTRIAL_ZONE_ON_RIVER', 'MAGIL_PLOT_HAS_INDUSTRIAL_ZONE'),	
	('MAGIL_REQUIRES_INDUSTRIAL_ZONE_ON_RIVER', 'REQUIRES_PLOT_ADJACENT_TO_RIVER'),	
	('MAGIL_CITY_HAS_VENETIAN_ARSENAL_REQUIREMENTS', 'MAGIL_CITY_HAS_VENETIAN_ARSENAL'),	
	('MAGIL_PLOT_IS_TERRAIN_COAST_REQUIREMENTS', 'REQUIRES_PLOT_IS_COAST'),	
	('MAGIL_DISTRICT_IS_HOLY_SITE_WITH_SHRINE', 'REQUIRES_DISTRICT_IS_HOLY_SITE'),	
	('MAGIL_DISTRICT_IS_HOLY_SITE_WITH_SHRINE', 'REQUIRES_CITY_HAS_SHRINE'),	
	('MAGIL_DISTRICT_IS_HOLY_SITE_WITH_TEMPLE', 'REQUIRES_DISTRICT_IS_HOLY_SITE'),	
	('MAGIL_DISTRICT_IS_HOLY_SITE_WITH_TEMPLE', 'MAGIL_REQUIRES_CITY_HAS_TEMPLE'),	
	('MAGIL_DISTRICT_IS_HOLY_SITE_WITH_WORSHIP', 'REQUIRES_DISTRICT_IS_HOLY_SITE'),	
	('MAGIL_DISTRICT_IS_HOLY_SITE_WITH_WORSHIP', 'MAGIL_REQUIRES_CITY_HAS_WORSHIP'),	
	('MAGIL_CITY_HAS_TEMPLE_REQUIREMENTSET', 'REQUIRES_CITY_HAS_TEMPLE'),	
	('MAGIL_CITY_HAS_TEMPLE_REQUIREMENTSET', 'REQUIRES_CITY_HAS_STAVE'),	
	('MAGIL_CITY_HAS_WORSHIP_REQUIREMENTSET', 'MAGIL_REQUIRES_CITY_HAS_CATHEDRAL'),	
	('MAGIL_CITY_HAS_WORSHIP_REQUIREMENTSET', 'MAGIL_REQUIRES_CITY_HAS_GURDWARA'),	
	('MAGIL_CITY_HAS_WORSHIP_REQUIREMENTSET', 'MAGIL_REQUIRES_CITY_HAS_MEETINGHOUSE'),	
	('MAGIL_CITY_HAS_WORSHIP_REQUIREMENTSET', 'MAGIL_REQUIRES_CITY_HAS_MOSQUE'),	
	('MAGIL_CITY_HAS_WORSHIP_REQUIREMENTSET', 'MAGIL_REQUIRES_CITY_HAS_PAGODA'),	
	('MAGIL_CITY_HAS_WORSHIP_REQUIREMENTSET', 'MAGIL_REQUIRES_CITY_HAS_SYNAGOGUE'),	
	('MAGIL_CITY_HAS_WORSHIP_REQUIREMENTSET', 'MAGIL_REQUIRES_CITY_HAS_WAT'),	
	('MAGIL_CITY_HAS_WORSHIP_REQUIREMENTSET', 'MAGIL_REQUIRES_CITY_HAS_DAREMEHR'),	
	('MAGIL_CITY_HAS_WORSHIP_REQUIREMENTSET', 'MAGIL_REQUIRES_CITY_HAS_STUPA'),	
	('MAGIL_DISTRICT_IS_CITYCENTER_WITH_MONUMENT', 'MAGIL_PLOT_HAS_CITY_CENTER'),	
	('MAGIL_DISTRICT_IS_CITYCENTER_WITH_MONUMENT', 'MAGIL_REQUIRES_CITY_HAS_MONUMENT'),	
	('MAGIL_DISTRICT_IS_WONDER_REQUIREMENTS', 'REQUIRES_DISTRICT_IS_WORLD_WONDER'),
	('MAGIL_CITY_HAS_BROADCAST_TOWER_REQUIREMENTS', 'MAGIL_REQUIRES_CITY_HAS_BROADCAST_TOWER'),	
	('MAGIL_CITY_HAS_BROADCAST_TOWER_REQUIREMENTS', 'MAGIL_REQUIRES_CITY_HAS_FILM_STUDIO'),
	('MAGIL_DISTRICT_IS_THEATER_WITH_BROADCAST_REQUIREMENTS', 'REQUIRES_DISTRICT_IS_THEATER'),
	('MAGIL_DISTRICT_IS_THEATER_WITH_BROADCAST_REQUIREMENTS', 'MAGIL_REQUIRES_CITY_HAS_BROADCAST_OR_STUDIO_REQUIREMENTSET');
	
--UNIT ABILITIES
--Types, used to declare new additions to the game
INSERT INTO Types
	(Type,	Kind)
VALUES	
	('MAGIL_MONT_ST_MICHEL_BONUS', 'KIND_ABILITY'),	
	('MAGIL_ABILITY_GREATLIGHTHOUSE_SIGHT', 'KIND_ABILITY');

--TypeTags controls which kinds of units can possibly have the ability. Note that even if you grant the ability to all units, it will only affect those defined here (useful). 
INSERT INTO TypeTags
	(Type,	Tag)
VALUES		
	('MAGIL_ABILITY_GREATLIGHTHOUSE_SIGHT', 'CLASS_NAVAL_MELEE'),	
	('MAGIL_ABILITY_GREATLIGHTHOUSE_SIGHT', 'CLASS_NAVAL_RANGED'),	
	('MAGIL_ABILITY_GREATLIGHTHOUSE_SIGHT', 'CLASS_NAVAL_RAIDER'),	
	('MAGIL_ABILITY_GREATLIGHTHOUSE_SIGHT', 'CLASS_NAVAL_CARRIER'),	
	('MAGIL_MONT_ST_MICHEL_BONUS', 'CLASS_RELIGIOUS'),	
	('MAGIL_MONT_ST_MICHEL_BONUS', 'CLASS_INQUISITOR');
	
/* Used to control float text and whether or not the abiltiy starts active, as far as I can tell. 
By setting Inactive=true, we can make certain that it only applies when the associated modifier fires. When Inactive=false, every unit of the proper class will have the ability	*/
INSERT INTO UnitAbilities
	(UnitAbilityType,	Name,	Description,	Inactive,	ShowFloatTextWhenEarned)
VALUES			
	('MAGIL_MONT_ST_MICHEL_BONUS', 'LOC_MAGIL_ABILITY_MONTSTMICHEL_BONUS_NAME', 'LOC_MAGIL_ABILITY_MONTSTMICHEL_BONUS_PREVIEWTEXT', 1, 0 ),		
	('MAGIL_ABILITY_GREATLIGHTHOUSE_SIGHT', 'LOC_MAGIL_ABILITY_GREATLIGHTHOUSE_SIGHT_NAME', 'LOC_MAGIL_ABILITY_GREATLIGHTHOUSE_SIGHT_DESCRIPTION', 1, 0 );
	
--The modifiers actually define what the abilities do. Not sure what the difference between applying an ability to a unit or a modifier to a unit in this case.
INSERT INTO UnitAbilityModifiers
	(UnitAbilityType,	ModifierId)
VALUES	
	('MAGIL_MONT_ST_MICHEL_BONUS', 'MAGIL_MONT_ST_MICHEL_BONUS_MODIFIER'),		
	('MAGIL_ABILITY_GREATLIGHTHOUSE_SIGHT', 'SPYGLASS_BONUS_SIGHT');

--Modifier Strings: This is for Preview Text or Context Text	
INSERT INTO ModifierStrings
	(ModifierId,	Context,	Text)
VALUES	
	('MAGIL_MONT_ST_MICHEL_BONUS_MODIFIER', 'Preview', 'LOC_MAGIL_ABILITY_MONTSTMICHEL_BONUS_PREVIEWTEXT');	
	
--Unit prerequisite stuff, only missionaries for Stonehenge
INSERT INTO Unit_BuildingPrereqs
	(Unit,	PrereqBuilding)
VALUES	
	('UNIT_MISSIONARY', 'BUILDING_STONEHENGE');		