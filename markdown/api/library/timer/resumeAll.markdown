
# timer.resumeAll()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [timer.*][api.library.timer]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          timer, resume, pause
> __See also__          [timer.resume()][api.library.timer.resume]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Resumes all timers that were paused with [timer.pause()][api.library.timer.pause].

## Syntax

	timer.resumeAll()


## Example

`````lua
local function listener( event )
    print( "listener called" )
end
 
timer1 = timer.performWithDelay( 2000, listener )  -- wait 2 seconds
timer2 = timer.performWithDelay( 3000, listener )  -- wait 3 seconds

-- sometime later...
timer.pauseAll()

-- sometime later...
timer.resumeAll()
`````
