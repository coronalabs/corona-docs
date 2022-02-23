
# store.restore()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Apple, IAP, in-app purchases, restore
>						[store.purchase()][plugin.apple-iap.purchase]
>						[store.*][plugin.apple-iap]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Users who wipe the information on a device or buy a new device may wish to restore previously purchased items. This function initiates the process of retrieving all valid purchases.

During this process, the [storeTransaction][plugin.apple-iap.event.storeTransaction] listener defined in [store.init()][plugin.apple-iap.init] may be called multiple times, once for each item. Once completed, a transaction state "restoreCompleted" is called.


## Gotchas

For Apple IAP, the transaction state of restored items will be `"restored"` and the `originalReceipt`, `originalIdentifier`, and `originalDate` fields of the [transaction][plugin.apple-iap.event.storeTransaction.transaction] object will provide context about the original purchase.


## Syntax

	store.restore()
