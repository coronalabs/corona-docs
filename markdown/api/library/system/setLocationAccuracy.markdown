# system.setLocationAccuracy()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [system.*][api.library.system]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          gps, location
> __See also__          [location (GPS)][api.event.location]
>                       [system.setLocationThreshold()][api.library.system.setLocationThreshold]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sets the desired accuracy of [location (GPS)][api.event.location] events to distance in meters. Note: the actual accuracy depends on the capabilities of the device and/or platform. On the iPhone, accuracy is limited to discrete distances: < 10, 10, 100, 1000, and 3000 meters. Higher accuracy (smaller distances) requires more battery life, so use larger distance to preserve battery life.

## Syntax

	system.setLocationAccuracy( distance )

##### distance ~^(required)^~
_[Number][api.type.Number]._ Location accuracy in meters.


## Examples

``````lua
-- set GPS accuracy to 10 meters
system.setLocationAccuracy( 10 )
``````
