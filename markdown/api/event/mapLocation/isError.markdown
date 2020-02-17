
# event.isError

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.String]
> __Event__             [mapLocation][api.event.mapLocation]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          mapLocation, isError
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Indicates whether the server returned an error rather than a location.

Normally this will be `false`, but in the error case it will be `true` (and the other event attributes will be empty). [event.errorMessage][api.event.mapLocation.errorMessage] will contain a string describing the error.

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
