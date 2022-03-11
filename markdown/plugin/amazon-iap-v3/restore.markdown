# store.restore()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Amazon, IAP, in-app purchases, restore
> __See also__			[store.purchase()][plugin.amazon-iap-v3.purchase]
>						[store.*][plugin.amazon-iap-v3]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Users who wipe the information on a device or buy a new device may wish to restore previously purchased items. This function initiates the process of retrieving all valid purchases.

During this process, the [storeTransaction][plugin.amazon-iap-v3.event.storeTransaction] listener defined in [store.init()][plugin.amazon-iap-v3.init] may be called multiple times, once for each item.


## Gotchas

Unlike Apple IAP, Amazon&nbsp;IAP does not include a `"restored"` state for transactions. This function should still be called to retrieve all of the user's purchases, but all valid transactions will be of the `"purchased"` state. When you do a restore, you should treat the returned restored purchases as normal purchases, but avoid making duplicate records in your file or database — essentially, before adding a purchase, check if it already exists in your file/database or overwrite it by its key.


## Syntax

	store.restore()
