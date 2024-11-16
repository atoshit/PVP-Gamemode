log("debug", "defferals", "def.lua loaded")

local function registerLoginCard(def, tempId, cb)
    local c <const> = cards.loginCard

    def.presentCard(c, function(data)
        if data.action == "loginButton" then
            -- TODO -> Login
        end

        if data.action == "returnHomePage" then
            cb(def, tempId)
        end
    end)
end

function registerHomeCard(def, tempId)
    local c <const> = cards.homeCard
    
    def.presentCard(c, function(data)
        if data.action == "loginPage" then
           registerLoginCard(def, tempId, registerHomeCard)
        end

        if data.action == "registrationPage" then
            -- TODO -> Open Registration Page
        end

        if data.action == "infoPage" then
            -- TODO -> Open Info Page
        end
    end)
end