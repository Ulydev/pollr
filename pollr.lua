local pollr = {
    buffer = {},
    buttons = {
        "trigger", "thumbstick", "touchpad", "grip", "menu", "a", "b", "x", "y", "proximity"
    }
}

function pollr.updateDevice(device)
    local buffer = pollr.buffer
    if not buffer[device] then buffer[device] = {} end
    for _, button in ipairs(pollr.buttons) do
        local down = lovr.headset.isDown(device, button)
        if not buffer[device][button] and down then
            buffer[device][button] = true
            if pollr.buttonpressed then pollr.buttonpressed(device, button) end
        elseif buffer[device][button] and not down then
            buffer[device][button] = false
            if pollr.buttonreleased then pollr.buttonreleased(device, button) end
        end
    end
end

function pollr.update(dt)
    pollr.updateDevice("head")
    for _, hand in ipairs(lovr.headset.getHands()) do
        pollr.updateDevice(hand)
    end
end

return pollr