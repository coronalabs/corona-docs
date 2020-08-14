
# timer.cancel()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [timer.*][api.library.timer]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          timer, delay, cancel
> __See also__          [timer.performWithDelay()][api.library.timer.performWithDelay]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Cancels a specific timer or all timers with the same tag that were initiated with [timer.performWithDelay()][api.library.timer.performWithDelay].

<!---

This function returns two numbers: time remaining ( and number of iterations that were left.

-->

## Syntax

	timer.cancel( whatToCancel )

##### whatToCancel ~^(required)^~
_[Object][api.type.Object] or [String][api.type.String]._ The timer ID from, or `tag` passed to, [timer.performWithDelay()][api.library.timer.performWithDelay].

## Example

`````lua
local function listener( event )
    print( "listener called" )
end
 
timer1 = timer.performWithDelay( 2000, listener )  -- wait 2 seconds

-- sometime later...
timer.cancel( timer1 )
`````

`````lua
local function listener( event )
    print( "listener called" )
end
 
timer1 = timer.performWithDelay( 2000, listener, "red" )  -- wait 2 seconds
timer2 = timer.performWithDelay( 3000, listener, "blue" )  -- wait 3 seconds

-- sometime later...
timer.cancel( "red" )
`````

`````lua
local t = {}
function t:timer( event )
    local count = event.count
    print( "Table listener called " .. count .. " time(s)" )
    if count >= 3 then
        timer.cancel( event.source ) -- after 3rd invocation, cancel timer
    end
end
 
-- Register to call t's timer method an infinite number of times
timer.performWithDelay( 1000, t, 0 )
`````
