-- Wrap peripherals
local detector = peripheral.wrap("left")       -- Player Detector on the left
local monitor = peripheral.wrap("right")       -- Monitor on the right

-- Clear and set up the monitor
monitor.clear()
monitor.setCursorPos(1,1)
monitor.setTextScale(1)

-- Table to keep track of already logged players
local loggedPlayers = {}

while true do
    local players = detector.getPlayers()      -- Get all players nearby

    -- Clear monitor for fresh log
    monitor.clear()
    monitor.setCursorPos(1,1)
    monitor.write("Nearby Players:\n")
    
    for _, player in ipairs(players) do
        -- Log new players only
        if not loggedPlayers[player.name] then
            loggedPlayers[player.name] = true
            print(player.name .. " detected!")    -- Optional console log
        end

        -- Print to monitor
        monitor.write(player.name .. " @ (" .. math.floor(player.x) .. ", " .. math.floor(player.y) .. ", " .. math.floor(player.z) .. ")\n")
    end

    os.sleep(1)  -- Wait a bit before scanning again
end
