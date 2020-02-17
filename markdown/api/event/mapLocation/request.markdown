
# event.request

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [mapLocation][api.event.mapLocation]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          mapLocation, request
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The original input.

## Example
 
``````lua
local function mapLocationHandler( event )
    print( "This event is for the address: " .. event.request ) -- Prints "1900 Embarcadero Road, Palo Alto, CA"
end

myMap:requestLocation( "1900 Embarcadero Road, Palo Alto, CA", mapLocationHandler )
``````
