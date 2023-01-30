local addonName, addon = ...
local _G = _G

if not _G["AutoCombatLogging"]["instance_type_mapping"] then 
    _G["AutoCombatLogging"]["instance_type_mapping"] = {}
    local map = _G["AutoCombatLogging"]["instance_type_mapping"]

    map["none"] = "DEFAULT_LOGGING"
    map["pvp"] = "PVP_LOGGING"
    map["arena"] = "PVP_LOGGING"
    map["party"] = "DUNGEON_LOGGING"
    map["raid"] = "RAID_LOGGING"
end

function addon:getLoggingType(instanceType)
    return _G["AutoCombatLogging"]["instance_type_mapping"][instanceType]
end

function addon:logCurrentInstance(instanceType)
    local loggingType =  addon:getLoggingType(instanceType)
    return _G["AutoCombatLogging"][loggingType]
end
