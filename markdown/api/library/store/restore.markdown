
# store.restore()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Apple, IAP, in-app purchases, restore
>						[store.purchase()][api.library.store.purchase]
>						[store.*][api.library.store]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Users who wipe the information on a device or buy a new device may wish to restore previously purchased items. This function initiates the process of retrieving all valid purchases.

During this process, the [storeTransaction][api.library.store.event.storeTransaction] listener defined in [store.init()][api.library.store.init] may be called multiple times, once for each item.


## Gotchas

For Apple IAP, the transaction state of restored items will be `"restored"` and the `originalReceipt`, `originalIdentifier`, and `originalDate` fields of the [transaction][api.library.store.event.storeTransaction.transaction] object will provide context about the original purchase.


## Syntax

	store.restore()
