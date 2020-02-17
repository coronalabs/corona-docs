
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

Pauses a timer started with [timer.performWithDelay()][api.library.timer.performWithDelay]. It returns a [number][api.type.Number] that represents the amount of time remaining, in milliseconds.

## Syntax

	timer.pause( timerId )

##### timerId ~^(required)^~
_[Table][api.type.Table]._ The timer ID from [timer.performWithDelay()][api.library.timer.performWithDelay].

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
