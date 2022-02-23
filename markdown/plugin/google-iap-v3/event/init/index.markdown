# init

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google, IAP, in-app purchases, init
> __See also__			[store.init()][plugin.google-iap-v3.init]
>						[store.*][plugin.google-iap-v3]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

The following event properties are passed to the listener function specified in [store.init()][plugin.google-iap-v3.init].


## Gotchas

Since the same listener function also handles [storeTransaction][plugin.google-iap-v3.event.storeTransaction] events, you should differentiate initialization events by checking for an [event.name][plugin.google-iap-v3.event.init.name] value of `"init"`.


## Properties

#### [event.name][plugin.google-iap-v3.event.init.name]

#### [event.transaction][plugin.google-iap-v3.event.init.transaction]
