--==============================================================
--******				P A N T H E O N S				  ******
--==============================================================

-- +1 Appeal to Earth goddess
INSERT INTO Modifiers
    (
    ModifierId,
    ModifierType,
    SubjectRequirementSetId
    )
VALUES
    (
        'BELIEF_EARTH_GODDESS_ADD_APPEAL',
        'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',
        'PLAYER_HAS_PANTHEON_REQUIREMENTS'
),
    (
        'BELIEF_EARTH_GODDESS_ADD_APPEAL_MODIFIER',
        'MODIFIER_PLAYER_CITIES_ADJUST_CITY_APPEAL',
        NULL
);
INSERT INTO ModifierArguments
    (ModifierId, Name, Value)
VALUES
    (
        'BELIEF_EARTH_GODDESS_ADD_APPEAL',
        'ModifierId',
        'BELIEF_EARTH_GODDESS_ADD_APPEAL_MODIFIER'
),
    (
        'BELIEF_EARTH_GODDESS_ADD_APPEAL_MODIFIER',
        'Amount',
        '1'
);
INSERT INTO BeliefModifiers
    (BeliefType, ModifierID)
VALUES
    (
        'BELIEF_EARTH_GODDESS',
        'BELIEF_EARTH_GODDESS_ADD_APPEAL'
);
-- Make it +3 Faith for breathtaking
-- For breathtaking
INSERT INTO Requirements
    (RequirementId, RequirementType)
VALUES
    (
        'REQUIRES_PLOT_BREATHTAKING_APPEAL',
        'REQUIREMENT_PLOT_IS_APPEAL_BETWEEN'
);
-- RequirementArguments
--------------------------------------------------------------------------
INSERT INTO RequirementArguments
    (RequirementId, Name, Value)
VALUES
    (
        'REQUIRES_PLOT_BREATHTAKING_APPEAL',
        'MinimumAppeal',
        4
);
-- RequirementSets
--------------------------------------------------------------------------
INSERT INTO RequirementSets
    (RequirementSetId, RequirementSetType)
VALUES
    (
        'PLOT_BREATHTAKING_APPEAL',
        'REQUIREMENTSET_TEST_ALL'
);
-- RequirementSetRequirements
--------------------------------------------------------------------------
INSERT INTO RequirementSetRequirements
    (RequirementSetId, RequirementId)
VALUES
    (
        'PLOT_BREATHTAKING_APPEAL',
        'REQUIRES_PLOT_BREATHTAKING_APPEAL'
);
UPDATE Modifiers
SET SubjectRequirementSetId = "PLOT_BREATHTAKING_APPEAL"
WHERE ModifierId = "EARTH_GODDESS_APPEAL_FAITH_MODIFIER"
    AND ModifierType = "MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD"
    AND SubjectRequirementSetId = "PLOT_CHARMING_APPEAL";
-- Make it +3 Faith
UPDATE ModifierArguments
SET Value = '3'
WHERE ModifierId = 'EARTH_GODDESS_APPEAL_FAITH_MODIFIER'
    AND Name = 'Amount';