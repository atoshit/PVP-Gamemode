log("debug", "playerConnecting", "playerConnecting.lua loaded")

AddEventHandler("playerConnecting", function(n, skr, def)
    local tempId = source
    
    def.defer()

    Wait(50)

    registerHomeCard(def, tempId)

    log("trace", "playerConnecting", "Player " .. n .. " is connecting", n)
end)