# storeTransaction

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google, IAP, in-app purchases, storeTransaction
> __See also__			[store.init()][plugin.google-iap-v3.init]
>						[store.purchase()][plugin.google-iap-v3.purchase]
>						[store.restore()][plugin.google-iap-v3.restore]
>						[store.*][plugin.google-iap-v3]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The following event properties are passed to the listener function specified in [store.init()][plugin.google-iap-v3.init].

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

The same listener function specified in [store.init()][plugin.google-iap-v3.init] also handles [init][plugin.google-iap-v3.event.init] events, so you should differentiate store transaction events by checking for an [event.name][plugin.google-iap-v3.event.storeTransaction.name] value of `"storeTransaction"`.

</div>


## Properties

#### [event.name][plugin.google-iap-v3.event.storeTransaction.name]

#### [event.transaction][plugin.google-iap-v3.event.storeTransaction.transaction]
