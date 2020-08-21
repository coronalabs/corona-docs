
# timer.cancelAll()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [timer.*][api.library.timer]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          timer, delay, cancel
> __See also__          [timer.cancel()][api.library.timer.cancel]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Cancels all timer operations initiated with [timer.performWithDelay()][api.library.timer.performWithDelay].

<!---

This function doesn't return any values.

-->

## Syntax

	timer.cancelAll()


## Example

`````lua
local function listener( event )
    print( "listener called" )
end
 
timer1 = timer.performWithDelay( 2000, listener )  -- wait 2 seconds
timer2 = timer.performWithDelay( 3000, listener )  -- wait 3 seconds

-- sometime later...
timer.cancelAll()
`````
