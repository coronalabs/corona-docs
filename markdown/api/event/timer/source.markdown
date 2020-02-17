
# event.source

> --------------------- ------------------------------------------------------------------------------------------
> __Event__             [timer][api.event.timer]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          timer, source
> __See also__              [timer][api.event.timer]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A reference to the timer registered to send the event. This may be useful if you have multiple timers calling the same listener.

## Example

``````lua
local function listener( event )
    -- Print the reference to the timer
    print( event.source )
end

timer.performWithDelay( 1000, listener )
``````