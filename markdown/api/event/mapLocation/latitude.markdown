
# event.latitude

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Event__             [mapLocation][api.event.mapLocation]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          mapLocation, latitude
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The latitude in degrees of the desired location.

## Example
 
``````lua
local function mapLocationHandler( event )
    -- handle mapLocation event here
    if event.isError then
        print( "Error: " .. event.errorMessage )
    else
        print( "The specified string is at: " .. event.latitude .. ", " .. event.longitude )
    end
end

myMap:requestLocation( "1900 Embarcadero Road, Palo Alto, CA", mapLocationHandler )
``````
