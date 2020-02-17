
# event.time

> --------------------- ------------------------------------------------------------------------------------------
> __Type__				[String][api.type.String]
> __Event__				[timer][api.event.timer]
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__          timer, time
> __See also__			[system.getTimer()][api.library.system.getTimer]
>                       [timer][api.event.timer]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A timestamp relative to [system.getTimer()][api.library.system.getTimer].


## Example

``````lua
local function manageTime( event )
	print( event.time )
end

timer.performWithDelay( 1000, manageTime, 0 )
``````
