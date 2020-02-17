
# event.numTaps

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Event__             [tap][api.event.tap]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          tap, numTaps
> __See also__          [system.setTapDelay()][api.library.system.setTapDelay]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The number of taps on the screen.

## Examples

##### Global Tap Listener

``````lua
local function tapListener( event )
    print( event.numTaps )
end
Runtime:addEventListener( "tap", tapListener )
``````

##### Table Listener 1

`````lua
local object = display.newImage( "image.png" )

function object:tap( event )
    print( event.numTaps )
end

object:addEventListener( "tap", object )
`````

##### Table Listener 2

`````lua
local object = display.newImage( "image.png" )

local function onObjectTap( self, event )
    print( event.numTaps )
end

object.tap = onObjectTap
object:addEventListener( "tap", object )
`````
