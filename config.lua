AddonName = "AutoCombatLogging"
AutoCombatLogging = AutoCombatLogging or {}

local addonName, addon =  AddonName, AutoCombatLogging
local _G = _G

local frame = CreateFrame("Frame", nil)
frame.name = addonName

if not _G["AutoCombatLogging"] then
    _G["AutoCombatLogging"] = {}
end

if not _G["AutoCombatLogging"]["PVP_LOGGING"] then
    _G["AutoCombatLogging"]["PVP_LOGGING"] = true
end

if not _G["AutoCombatLogging"]["RAID_LOGGING"] then
    _G["AutoCombatLogging"]["RAID_LOGGING"] = true
end

if not _G["AutoCombatLogging"]["DUNGEON_LOGGING"] then
    _G["AutoCombatLogging"]["DUNGEON_LOGGING"] = true
end

if not _G["AutoCombatLogging"]["DEFAULT_LOGGING"] then
    _G["AutoCombatLogging"]["DEFAULT_LOGGING"] = false
end



frame:SetScript("OnShow", 
    function(frame)
        local title = frame:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
        title:SetPoint("TOPLEFT", 16, -16)
        title:SetText(addonName)

        local pvp_logging_toggle = CreateFrame("CheckButton",
                                          "PvpLoggingCheckbox",
                                          frame,
                                          "ChatConfigCheckButtonTemplate")
        pvp_logging_toggle:SetPoint("TOPLEFT", title , "BOTTOMLEFT", 16, -16)
        pvp_logging_toggle.tooltip = "Enable/Disable pvp combat logs"
        PvpLoggingCheckboxText:SetText("Toggle pvp combat logs")
        pvp_logging_toggle:SetChecked(_G["AutoCombatLogging"]["PVP_LOGGING"])
        pvp_logging_toggle:SetScript("OnClick",
            function(self)
                _G["AutoCombatLogging"]["PVP_LOGGING"] = 
                    PvpLoggingCheckbox:GetChecked()
            end
        )

        local dungeon_logging_toggle = CreateFrame("CheckButton",
                                                   "DungeonLoggingCheckbox",
                                                   frame,
                                                   "ChatConfigCheckButtonTemplate")
        dungeon_logging_toggle:SetPoint("TOPLEFT", title , "BOTTOMLEFT", 16, -48)
        dungeon_logging_toggle.tooltip = "Enable/Disable dungeon combat logs"
        DungeonLoggingCheckboxText:SetText("Toggle dungeon combat logs")
        dungeon_logging_toggle:SetChecked(_G["AutoCombatLogging"]["DUNGEON_LOGGING"])
        dungeon_logging_toggle:SetScript("OnClick",
            function(self)
                _G["AutoCombatLogging"]["DUNGEON_LOGGING"] = 
                    DungeonLoggingCheckbox:GetChecked()
            end
        )

        local raid_logging_toggle = CreateFrame("CheckButton",
                                                   "RaidLoggingCheckbox",
                                                   frame,
                                                   "ChatConfigCheckButtonTemplate")
        raid_logging_toggle:SetPoint("TOPLEFT", title , "BOTTOMLEFT", 16, -80)
        raid_logging_toggle.tooltip = "Enable/Disable raid combat logs"
        RaidLoggingCheckboxText:SetText("Toggle raid combat logs")
        raid_logging_toggle:SetChecked(_G["AutoCombatLogging"]["RAID_LOGGING"])
        raid_logging_toggle:SetScript("OnClick",
            function(self)
                _G["AutoCombatLogging"]["RAID_LOGGING"] = 
                    RaidLoggingCheckbox:GetChecked()
            end
        )
       frame:SetScript("OnShow", nil)
    end
)

InterfaceOptions_AddCategory(frame)