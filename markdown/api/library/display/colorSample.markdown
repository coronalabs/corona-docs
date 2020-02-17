
# display.colorSample()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [display.*][api.library.display]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          color, sampling, screen
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Get the color of a pixel on screen.

## Syntax

	display.colorSample( x, y, listener )

##### x ~^(required)^~
_[Number][api.type.Number]._ The __x__ coordinate of the pixel on screen, in content coordinates.

##### y ~^(required)^~
_[Number][api.type.Number]._ The __y__ coordinate of the pixel on screen, in content coordinates.

##### listener ~^(required)^~
_[Listener][api.type.Listener]._ The event listener to receive the result.


## Gotchas

`display.colorSample()` has similar performance limitations as [display.capture()][api.library.display.capture]. This function should not be called in a tight loop, during a Runtime `"enterFrame"` listener, or during a touch listener's `"moved"` phase.


## Example

``````lua
local function onColorSample( event )
    print( "Sampling pixel at position (" .. event.x .. "," .. event.y .. ")" )
    print( "R = " .. event.r )
    print( "G = " .. event.g )
    print( "B = " .. event.b )
    print( "A = " .. event.a )
end

display.colorSample( 17, 9, onColorSample )
``````
