# system.setLocationThreshold()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [system.*][api.library.system]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          gps, location
> __See also__          [location (GPS)][api.event.location]
>                       [system.setLocationAccuracy()][api.library.system.setLocationAccuracy]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sets how much distance in meters must be travelled until the next [location (GPS)][api.event.location] event is sent. Because location events involve hardware that can drain the battery, using larger threshold distances preserve battery life.

## Syntax

	system.setLocationThreshold( distance )

##### distance ~^(required)^~
_[Number][api.type.Number]._ Location event distance (in meters). Defaults to 0 meters.


## Examples

``````lua
-- fire the location event every 100 meters
system.setLocationThreshold( 100 )
``````
