
# colorSample

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          colorSample
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Provides information about the [colorSample][api.library.display.colorSample] that generated this event.

## Properties

#### [event.x][api.event.colorSample.x]

#### [event.y][api.event.colorSample.y]

#### [event.r][api.event.colorSample.r]

#### [event.g][api.event.colorSample.g]

#### [event.b][api.event.colorSample.b]

#### [event.a][api.event.colorSample.a]

## Example

``````lua
-- Called when a colorSample event has been received
local function onColorSampleEvent( event )
    print( "Sampling result, at position: " .. event.x .. " " .. event.y .. " The color is: " .. event.r .. " " .. event.g .. " " .. event.b .. " " .. event.a )
end
                             
display.colorSample( 17, 9, onColorSampleEvent )
``````
