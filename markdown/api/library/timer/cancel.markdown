
# timer.cancel()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [timer.*][api.library.timer]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          timer, delay, cancel
> __See also__          [timer.performWithDelay()][api.library.timer.performWithDelay]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Cancels a timer operation initiated with [timer.performWithDelay()][api.library.timer.performWithDelay].

<!---

This function returns two numbers: time remaining ( and number of iterations that were left.

-->

## Syntax

	timer.cancel( timerID )

##### timerID ~^(required)^~
_[Object][api.type.Object]._ Handle returned by the call to [timer.performWithDelay()][api.library.timer.performWithDelay].

## Example

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
