
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

## Gotchas

Using [timer.pauseAll()][api.library.timer.pauseAll] requires `Solar2D 2020.3611` or a newer build.

For multiple timers, a tag or id is needed to use [timer.resumeAll()][api.library.timer.resumeAll], [timer.pauseAll()][api.library.timer.pauseAll], or [timer.cancelAll()][api.library.timer.cancelAll]

## Syntax

	timer.pauseAll( )



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
