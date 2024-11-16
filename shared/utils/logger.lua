--- level string: info, error, warn, debug, success, log
local logLevels <const> = {
    ["info"] = { message = "^9Info", debugLevel = 1  },
    ["warn"] = { message = "^3Warning", debugLevel = 1 },
    ["debug"] = { message = "^5Debug", debugLevel = 2 },
    ["success"] = { message = "^2Success", debugLevel = 1 },
    ["trace"] = { message = "^6Trace", debugLevel = 2 },
    ["log"] = { message = "^7Log", debugLevel = 1 },
}

local logQueue = {}
local isProcessingQueue = false

--- Display a log message
--- @param level string: info, error, warn, debug, success, log
--- @param module string: Module name
--- @param message string: Message to log
local function logMessage(level, module, message)
    if not message or type(message) ~= "string" then
        return
    end

    local timestamp = IsDuplicityVersion() and os.date("%d/%m/%Y %H:%M:%S") or "CLIENT"
    local levelColor = logLevels[level].message or "^7LOG"
    local m = "[" .. timestamp .. " : " .. (module or "PVP-Gamemode") .. "] " .. levelColor .. ": " .. message .. "^7"

    print(m)
end

--- Process the log queue
local function processQueue()
    isProcessingQueue = true
    CreateThread(function()
        while #logQueue > 0 do
            local logEntry = table.remove(logQueue, 1)
            logMessage(logEntry.level, logEntry.module, logEntry.message)
            Wait(99)
        end

        isProcessingQueue = false
    end)
end

--- Add a message to the log queue
--- @param level string: info, error, warn, debug, success, log
--- @param module string: Module name
--- @param message string: Message to log
function log(level, module, message)
    local debugLevel <const> = tonumber(GetConvar("debugLevel"))

    if debugLevel == 0 or logLevels[level].debugLevel > debugLevel then
        return
    end

    logQueue[#logQueue + 1] = {level = level, module = module, message = message}

    if not isProcessingQueue then
        processQueue()
    end
end

RegisterCommand("test:log", function()
    log("info", "PVP-Gamemode", "Logger initialized")
    log("warn", "PVP-Gamemode", "This is a warning message")
    log("debug", "PVP-Gamemode", "This is a debug message")
    log("success", "PVP-Gamemode", "This is a success message")
    log("trace", "PVP-Gamemode", "This is a trace message")
    log("log", "PVP-Gamemode", "This is a log message")
end)