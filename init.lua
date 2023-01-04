local addonName, addon = ...
-- AddonName = "TestAddon"
-- TestAddon = TestAddon or error("Addon not loaded properly???")

local EventFrame = CreateFrame("Frame", "FrameEvent")
local _G = _G

-- if addon is empty, create a table so we can populate it


-- PLAYER_ENTERING_WORLD world
EventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")

-- setup listener
EventFrame:SetScript("OnEvent",  
    function(self, event, isLogin, isReload)
        local combatLoggingEnabled  = LoggingCombat()
        local inInstance, instanceType = IsInInstance()

        if addon:logCurrentInstance(instanceType) then
            if not combatLoggingEnabled then
                print("Combat Logging is being enable!")
                LoggingCombat(true)
            end
        else 
            if combatLoggingEnabled then 
                print("Disabling Combat Logging...")
                LoggingCombat(false)
            end
        end
    end
)

-- 5x TestAddon/init.lua:17: attempt to index field 'utils' (a nil value)
-- [string "@TestAddon/init.lua"]:17: in function <TestAddon/init.lua:13>

-- Locals:
-- self = FrameEvent {
--  0 = <userdata>
-- }
-- event = "PLAYER_ENTERING_WORLD"
-- isLogin = false
-- isReload = true
-- combatLoggingEnabled = false
-- inInstance = false
-- instanceType = "none"
-- (*temporary) = nil
-- (*temporary) = nil
-- (*temporary) = "attempt to index field 'utils' (a nil value)"
-- addon = <table> {
-- }
