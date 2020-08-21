
# timer.pauseAll()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [timer.*][api.library.timer]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          timer, pause, resume
> __See also__          [timer.pause()][api.library.timer.pause]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Pauses all timers started with [timer.performWithDelay()][api.library.timer.performWithDelay].

## Syntax

	timer.pauseAll( timerId )


## Example

`````lua
local function listener( event )
    print( "listener called" )
end
 
timer1 = timer.performWithDelay( 2000, listener )  -- wait 2 seconds
timer2 = timer.performWithDelay( 3000, listener )  -- wait 3 seconds

-- sometime later...
timer.pauseAll()
`````
