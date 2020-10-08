-- Inspired by Visibility Matters Minimal and DiplomacyRibbon_Expansion1.lua

-- Base File
include("DiplomacyRibbon_Expansion1");

-- ===========================================================================
function FinishAddingLeader( playerID:number, uiLeader:table, kProps:table)

	local localPlayerID:number = Game.GetLocalPlayer();

	if localPlayerID == PlayerTypes.NONE or localPlayerID == PlayerTypes.OBSERVER then
		return;
	end
	
	local visibilityLevel = playerID ~= localPlayerID and Players[localPlayerID]:GetDiplomacy():GetVisibilityOn(playerID) or 3;

	if (playerID ~= localPlayerID) then

		uiLeader.Military:SetHide( true );
		uiLeader.Science:SetHide( true );	
		uiLeader.Culture:SetHide( true );
		uiLeader.Gold:SetHide( true );
		uiLeader.Faith:SetHide( true );

		if(visibilityLevel > 0) then
			uiLeader.Military:SetHide( false );
		end

		if(visibilityLevel > 1) then
			uiLeader.Culture:SetHide( false );
			uiLeader.Science:SetHide( false );
		end

		if(visibilityLevel > 2) then
			uiLeader.Gold:SetHide( false );
			uiLeader.Faith:SetHide( false );
		end

	end
	
	UpdateStatValues( playerID, uiLeader );
end