
# store.restore()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Samsung, IAP, in-app purchases, restore
> __See also__          [store.consumePurchase()][plugin.samsung-iap.consumePurchase]
>						[store.acknowledgePurchase()][plugin.samsung-iap.acknowledgePurchase]
>						[store.purchase()][plugin.samsung-iap.purchase]
>						[store.*][plugin.samsung-iap]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Users who wipe the information on a device or buy a new device may wish to restore previously purchased items. This function initiates the process of retrieving all valid purchases. This includes consumable items that have not be consumed, non-consumable items, and active subscriptions.

During this process, the [storeTransaction][plugin.samsung-iap.event.storeTransaction] listener defined in [store.init()][plugin.samsung-iap.init] may be called multiple times, once for each item, with a `state` of `"restoreCompleted"`. Each event provides the `purchaseId` and the `acknowledgedStatus` of the purchase: consume restored consumable items with [store.consumePurchase()][plugin.samsung-iap.consumePurchase] and acknowledge non-consumable items and subscriptions with `acknowledgedStatus` of `"notAcknowledged"` with [store.acknowledgePurchase()][plugin.samsung-iap.acknowledgePurchase].


## Gotchas

* No event is dispatched when the user does not own any item.

* Subscriptions whose price is about to increase provide a `subscriptionPriceChange` table. If its `priceChangeMode` is `"priceIncreaseUserAgreementRequired"` and `isConsented` is `false`, the user has to agree to the new price in the Galaxy Store, for example by opening `"samsungapps://SubscriptionDetail?purchaseId=" .. transaction.purchaseId` with [system.openURL()][api.library.system.openURL].


## Syntax

	store.restore( [productType] )

##### productType ~^(optional)^~
_[String][api.type.String]._ Which purchases to retrieve: `"all"` (default), `"item"` for consumable and non-consumable items only, or `"subscription"` for subscriptions only.
