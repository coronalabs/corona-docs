# event.transaction

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Table][api.type.Table]
> __Event__             [storeTransaction][plugin.samsung-iap.event.storeTransaction]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Samsung, IAP, in-app purchases, storeTransaction, transaction
> __See also__			[storeTransaction][plugin.samsung-iap.event.storeTransaction]
>						[store.*][plugin.samsung-iap]
> --------------------- ------------------------------------------------------------------------------------------
## Gotchas

Samsung recommends using a server for using receipt rest api [Samsung IAP Server Guide](https://developer.samsung.com/iap/programming-guide/samsung-iap-server-api.html)

## Overview

This table contains the following <nobr>read-only</nobr> properties pertaining to the transaction. Properties that do not apply to the transaction's `state` are `nil`.


* `state` &mdash; A [string][api.type.String] indicating the state of the transaction. This will be `"purchased"` in the case of a purchase or a subscription plan change, `"cancelled"` for a cancelled purchase, `"consumed"` for a consumed purchase, `"acknowledged"` for an acknowledged purchase, `"restoreCompleted"` for each restored purchase, or `"failed"` in case of an error.

* `identifier` &mdash; The unique [string][api.type.String] payment identifier of the transaction.

* `purchaseId` &mdash; The unique [string][api.type.String] purchase identifier of the transaction. Pass it to [store.consumePurchase()][plugin.samsung-iap.consumePurchase] or [store.acknowledgePurchase()][plugin.samsung-iap.acknowledgePurchase], and use it to verify the purchase with the Samsung IAP server API.

* `productIdentifier` &mdash; A [string][api.type.String] representing the product identifier associated with the transaction.

* `previousProductIdentifier` &mdash; For [store.changeSubscriptionPlan()][plugin.samsung-iap.changeSubscriptionPlan], a [string][api.type.String] representing the product identifier of the replaced subscription.

* `orderIdentifier` &mdash; A [string][api.type.String] representing the Samsung order identifier of a purchase.

* `purchaseType` &mdash; Type ([string][api.type.String]) which is either `"item"` or `"subscription"`.

* `isConsumable` &mdash; A ([boolean][api.type.Boolean]) whether or not the in-app item is consumable.

* `date` &mdash; A [string][api.type.String] representing the date when the transaction occurred, represented in `"YYYY-MM-DD HH:mm:ss"` format.

* `subscriptionEndDate` &mdash; A [string][api.type.String] representing the date when the given subscription ends, represented in `"YYYY-MM-DD HH:mm:ss"` format (restored subscriptions only).

* `acknowledgedStatus` &mdash; For restored purchases, a [string][api.type.String] of either `"acknowledged"`, `"notAcknowledged"` or `"unsupported"` (the installed Galaxy Store does not support acknowledging). Acknowledge non-consumable items and subscriptions with a status of `"notAcknowledged"` using [store.acknowledgePurchase()][plugin.samsung-iap.acknowledgePurchase].

* `subscriptionPriceChange` &mdash; For restored subscriptions whose price is changing, a [table][api.type.Table] with the keys `priceChangeMode` (`"priceIncreaseUserAgreementRequired"`, `"priceIncreaseNoUserAgreementRequired"` or `"priceDecrease"`), `isConsented` ([boolean][api.type.Boolean]), `startDate`, `itemName`, `appName`, `originalLocalPrice`, `originalLocalPriceString`, `newLocalPrice`, `newLocalPriceString`, `subscriptionDurationUnit` and `subscriptionDurationMultiplier`. See [store.restore()][plugin.samsung-iap.restore].

* `obfuscatedAccountId` / `obfuscatedProfileId` &mdash; The [strings][api.type.String] passed to [store.purchase()][plugin.samsung-iap.purchase] when the item was bought.

* `passThroughParam` &mdash; The [string][api.type.String] passed to [store.purchase()][plugin.samsung-iap.purchase] when the item was bought (deprecated by Samsung).

* `minorStatus` &mdash; For purchases, a [string][api.type.String] of either `"minor"`, `"notMinor"` or `"unidentified"`, telling whether Samsung identified the buyer as a minor.

* `statusType` &mdash; Type ([string][api.type.String]) which is used for the states `"consumed"` and `"acknowledged"` and returns either `"success"`, `"invalidPurchaseID"`, `"failedOrder"`, `"nonConsumableItem"` (`"invalidProductType"` when acknowledging), `"alreadyConsumed"` (`"alreadyAcknowledged"` when acknowledging), `"unauthorizedUser"` or `"serviceError"`.

* `status` &mdash; Status message ([string][api.type.String]) which is used for the states `"consumed"` and `"acknowledged"`.

* `statusCode` &mdash; The numeric Samsung status code ([number][api.type.Number]) behind `statusType`.

* `downloadUrl` &mdash; Url as a [string][api.type.String] to download the purchased item, if one was configured for the item.

* `imageUrl` &mdash; Url as a [string][api.type.String] of the item's image.

* `originalJson` &mdash; A JSON-formatted [string][api.type.String] representation of the transaction.

* `isError` &mdash; [Boolean][api.type.Boolean] value indicating whether an error occurred. If this is `true`, `errorType` and `errorString` will be [strings][api.type.String] stating the reason.

* `errorType` &mdash; A [string][api.type.String] representing the type of error that occurred if `isError` is `true`.

* `errorString` &mdash; A more descriptive error message ([string][api.type.String]) if `isError` is `true`.

* `errorCode` &mdash; The numeric Samsung IAP error code ([number][api.type.Number]) if `isError` is `true`, for example `-1003` when a non-consumable item is purchased again or `-1008` when the network is not available. `1` marks a purchase cancelled by the user.
