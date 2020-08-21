
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

Resumes a specific timer or all timers with the same tag that were paused with [timer.pause()][api.library.timer.pause].

If a specific timer is resumed, then the function returns a [number][api.type.Number] that represents the amount of time remaining in the timer.

## Syntax

	timer.resume( whatToResume )

##### whatToResume ~^(required)^~
_[Object][api.type.Object] or [String][api.type.String]._ The timer ID from, or `tag` passed to, [timer.performWithDelay()][api.library.timer.performWithDelay].


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

`````lua
local function listener( event )
    print( "listener called" )
end
 
timer1 = timer.performWithDelay( 2000, listener, "red" )  -- wait 2 seconds
timer2 = timer.performWithDelay( 3000, listener, "blue" )  -- wait 3 seconds

-- sometime later...
timer.pause( "red" )

-- sometime later...
timer.resume( "red" )
`````
