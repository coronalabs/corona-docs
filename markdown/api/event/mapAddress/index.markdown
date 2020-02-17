
# mapAddress

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          mapAddress
> __See also__          [map:nearestAddress()][api.type.Map.nearestAddress]
>						[mapLocation][api.event.mapLocation]
>						[mapMarker][api.event.mapMarker]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The `mapAddress` event is generated asynchronously in response to calling [map:nearestAddress()][api.type.Map.nearestAddress].


## Gotchas

<!---

* On devices, `mapAddress` events may be delayed by activation of the device's location hardware. One workaround is to repeatedly queue the location hardware until it receives a proper response. See [map:nearestAddress()][api.type.Map.nearestAddress] for details.

-->

This event is not available in the Corona Simulator.


## Properties

#### [event.city][api.event.mapAddress.city]

#### [event.cityDetail][api.event.mapAddress.cityDetail]

#### [event.countryCode][api.event.mapAddress.countryCode]

#### [event.country][api.event.mapAddress.country]

#### [event.errorMessage][api.event.mapAddress.errorMessage]

#### [event.isError][api.event.mapAddress.isError]

#### [event.name][api.event.mapAddress.name]

#### [event.postalCode][api.event.mapAddress.postalCode]

#### [event.region][api.event.mapAddress.region]

#### [event.regionDetail][api.event.mapAddress.regionDetail]

#### [event.street][api.event.mapAddress.street]

#### [event.streetDetail][api.event.mapAddress.streetDetail]
