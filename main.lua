local pollr = require "pollr"

function lovr.update(dt)
    pollr.update()
end

function pollr.buttonpressed(device, button)
    print("Button " .. button .. " pressed on device " .. device)
end

function pollr.buttonreleased(device, button)
    print("Button " .. button .. " released on device " .. device)
end