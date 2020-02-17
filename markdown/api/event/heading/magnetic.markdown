
# event.magnetic

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [heading (compass)][api.event.heading]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          heading, compass, magnetic
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Provides the heading in degrees (clockwise) relative to the magnetic North Pole.

## Example
 
``````lua
local function updateCompass( event )
    print( "Compass magnetic: " .. event.magnetic )
end
 
Runtime:addEventListener( "heading", updateCompass )
``````
