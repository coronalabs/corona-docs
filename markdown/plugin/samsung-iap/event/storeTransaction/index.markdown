# storeTransaction

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Samsung, IAP, in-app purchases, storeTransaction
> __See also__			[store.init()][plugin.samsung-iap.init]
>						[store.purchase()][plugin.samsung-iap.purchase]
>						[store.restore()][plugin.samsung-iap.restore]
>						[store.*][plugin.samsung-iap]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The following event properties are passed to the listener function specified in [store.init()][plugin.samsung-iap.init].

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

The same listener function specified in [store.init()][plugin.samsung-iap.init] also handles [init][plugin.samsung-iap.event.init] events, so you should differentiate store transaction events by checking for an [event.name][plugin.samsung-iap.event.storeTransaction.name] value of `"storeTransaction"`.

</div>


## Properties

#### [event.name][plugin.samsung-iap.event.storeTransaction.name]

#### [event.transaction][plugin.samsung-iap.event.storeTransaction.transaction]
