local serverIP = ac.getServerIP()

local validIPs = {
    "205.178.182.239",
    "135.181.7.55" -- Add more IP addresses as needed
}

local function isIPValid(ip)
    for _, validIP in ipairs(validIPs) do
        if ip == validIP then
            return true
        end
    end
    return false
end

function script.update(dt)
    local data = ac.accessCarPhysics()
    local isOnlineRace = sim.isOnlineRace

    if isOnlineRace and not isIPValid(serverIP) then
        data.gas = 0
    end
end