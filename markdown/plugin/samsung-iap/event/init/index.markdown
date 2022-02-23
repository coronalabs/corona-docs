# init

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Samsung, IAP, in-app purchases, init
> __See also__			[store.init()][plugin.samsung-iap]
>						[store.*][plugin.samsung-iap]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

The following event properties are passed to the listener function specified in [store.init()][plugin.samsung-iap.init].


## Gotchas

Since the same listener function also handles [storeTransaction][plugin.samsung-iap.event.storeTransaction] events, you should differentiate initialization events by checking for an [event.name][plugin.samsung-iap.event.init.name] value of `"init"`.


## Properties

#### [event.name][plugin.samsung-iap.event.init.name]

#### [event.transaction][plugin.samsung-iap.init.transaction]
