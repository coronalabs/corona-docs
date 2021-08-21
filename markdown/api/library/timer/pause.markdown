
# timer.pause()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [timer.*][api.library.timer]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          timer, pause, resume
> __See also__          [timer.resume()][api.library.timer.resume]<br/>[timer.performWithDelay()][api.library.timer.performWithDelay]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Pauses a specific timer or all timers with the same tag that were started with [timer.performWithDelay()][api.library.timer.performWithDelay].

If a specific timer is paused, then the function returns a [number][api.type.Number] that represents the amount of time remaining, in milliseconds.

## Syntax

	timer.pause( whatToPause )

##### whatToPause ~^(required)^~
_[Object][api.type.Object] or [String][api.type.String]._ The timer ID from, or `tag` passed to, [timer.performWithDelay()][api.library.timer.performWithDelay]. Note: Using `tag` requires `Solar2D 2020.3611` or a newer build.

## Example

`````lua
local function listener( event )
    print( "listener called" )
end
 
timer1 = timer.performWithDelay( 2000, listener )  -- wait 2 seconds

-- sometime later...
local result = timer.pause( timer1 )
print( "Time remaining is " .. result )
`````

`````lua
local function listener( event )
    print( "listener called" )
end

timer1 = timer.performWithDelay( 2000, listener, "red" )  -- wait 2 seconds
timer2 = timer.performWithDelay( 3000, listener, "blue" )  -- wait 3 seconds

-- sometime later...
timer.pause( "red" )
`````
