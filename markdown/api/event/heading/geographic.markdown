
# event.geographic

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Event__             [heading (compass)][api.event.heading]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          heading, compass, geographic
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Provides the heading in degrees (clockwise) relative to the geographic North Pole, sometimes known as true North.

## Example
 
``````lua
local function updateCompass( event )
    print( "Compass geographic: " .. event.geographic )
end
 
Runtime:addEventListener( "heading", updateCompass )
``````
