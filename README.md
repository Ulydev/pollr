## Pollr

LÖVR input polling

### Usage

Load the library, update it in `lovr.update`, and define the `pollr.buttonpressed` and `pollr.buttonreleased` callbacks as needed.

### Example (*main.lua*):

```lua
local pollr = require "pollr"

function lovr.update(dt)
    pollr.update()
end

function pollr.buttonpressed(device, button)
    -- button pressed
end

function pollr.buttonreleased(device, button)
    -- button released
end
```