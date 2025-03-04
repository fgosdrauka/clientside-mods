-- made by caites

local palConfig = require "config"

-- Prints the mod successful loading message in red
print(palConfig.palRedColorWrapperFront .. palConfig.palModName .. " version " .. palConfig.palModVersion .. " loaded for game version " .. palConfig.palGameVersion .. palConfig.palRedColorWrapperBack)

-- Register the new modifiers and print a successful change message in red
RegisterHook("/Script/Engine.PlayerController:ClientRestart", function()
    if palConfig.palCheckRestart ~= 1 then
        local items = FindAllOf("PalGameSetting")
        if items then
            for _, item in ipairs(items) do                
				item.LongPressInterval  = palConfig.LongPressInterval	
				item.LongPressInterval_EnemyCampCage  = palConfig.LongPressInterval_EnemyCampCage	
				item.LongPressInterval_GetHatchedPal  = palConfig.LongPressInterval_GetHatchedPal				
            end
        end
        print(palConfig.palRedColorWrapperFront .. "[" .. palConfig.palModName .. "] Standard long press time set to " .. palConfig.LongPressInterval .. palConfig.palRedColorWrapperBack)
		print(palConfig.palRedColorWrapperFront .. "[" .. palConfig.palModName .. "] Freeing caged pal time set to " .. palConfig.LongPressInterval_EnemyCampCage .. palConfig.palRedColorWrapperBack)
		print(palConfig.palRedColorWrapperFront .. "[" .. palConfig.palModName .. "] Hatched Pal Retrieval Time set to " .. palConfig.LongPressInterval_GetHatchedPal .. palConfig.palRedColorWrapperBack)				
				
    end
    palConfig.palCheckRestart = 1
end)


-- [DEDICATED SRV] Register the new modifiers and print a successful change message in red
RegisterHook("/Script/Engine.PlayerController:ServerAcknowledgePossession", function(Context)
    if not palConfig.serverAcknowledgedPossession then
        local items = FindAllOf("PalGameSetting")
        if items then
            for _, item in ipairs(items) do                
				item.LongPressInterval  = palConfig.LongPressInterval	
				item.LongPressInterval_EnemyCampCage  = palConfig.LongPressInterval_EnemyCampCage	
				item.LongPressInterval_GetHatchedPal  = palConfig.LongPressInterval_GetHatchedPal	
            end
        end
         print(palConfig.palRedColorWrapperFront .. "[" .. palConfig.palModName .. "] Standard long press time set to " .. palConfig.LongPressInterval .. palConfig.palRedColorWrapperBack)
		print(palConfig.palRedColorWrapperFront .. "[" .. palConfig.palModName .. "] Freeing caged pal time set to " .. palConfig.LongPressInterval_EnemyCampCage .. palConfig.palRedColorWrapperBack)
		print(palConfig.palRedColorWrapperFront .. "[" .. palConfig.palModName .. "] Hatched Pal Retrieval Time set to " .. palConfig.LongPressInterval_GetHatchedPal .. palConfig.palRedColorWrapperBack)	
    end
    palConfig.serverAcknowledgedPossession = true
end)