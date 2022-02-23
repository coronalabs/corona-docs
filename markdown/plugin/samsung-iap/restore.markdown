
# store.restore()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Samsung, IAP, in-app purchases, restore
>						[store.purchase()][plugin.samsung-iap.purchase]
>						[store.*][plugin.samsung-iap]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Users who wipe the information on a device or buy a new device may wish to restore previously purchased items. This function initiates the process of retrieving all valid purchases. This includes consumable items that have not be consumed, non-consumable items, and active subscriptions.

During this process, the [storeTransaction][plugin.samsung-iap.event.storeTransaction] listener defined in [store.init()][plugin.samsung-iap.init] may be called multiple times, once for each item.




## Syntax

	store.restore()
