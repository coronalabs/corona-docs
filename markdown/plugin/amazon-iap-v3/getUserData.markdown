# store.getUserData()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Amazon, IAP, in-app purchases, getUserData
> __See also__			[store.getUserId()][plugin.amazon-iap-v3.getUserId]
>						[store.*][plugin.amazon-iap-v3]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Initiates a request to retrieve the user&nbsp;ID and marketplace code of the currently <nobr>logged-in</nobr> user, dispatching a [userData][plugin.amazon-iap-v3.event.userData] event to the listener defined as `userDataListener`.

Alternatively, the user&nbsp;ID alone can be gathered via the [store.getUserId()][plugin.amazon-iap-v3.getUserId] function.


## Syntax

	store.getUserData( userDataListener )

##### userDataListener ~^(required)^~
_[Listener][api.type.Listener]._ The listener that will handle the [userData][plugin.amazon-iap-v3.event.userData] event.
