
# timer.resume()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [timer.*][api.library.timer]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          timer, resume, pause
> __See also__          [timer.pause()][api.library.timer.pause]<br/>[timer.performWithDelay()][api.library.timer.performWithDelay]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Resumes a timer that was paused with [timer.pause()][api.library.timer.pause]. It returns a [number][api.type.Number] that represents the amount of time remaining in the timer.

## Syntax

	timer.resume( timerId )

##### timerId ~^(required)^~
_[Object][api.type.Object]._ The timer ID from [timer.performWithDelay()][api.library.timer.performWithDelay].


## Example

`````lua
local function listener( event )
    print( "listener called" )
end
 
timer1 = timer.performWithDelay( 2000, listener )  -- wait 2 seconds

-- sometime later...
local pauseTime = timer.pause( timer1 )
print( "Time remaining is " .. pauseTime )

-- sometime later...
local resumeTime = timer.resume( timer1 )
print( "Resume time is " .. resumeTime )
`````
