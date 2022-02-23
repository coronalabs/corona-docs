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

This table contains the following <nobr>read-only</nobr> properties pertaining to the transaction:


* `state` &mdash; A [string][api.type.String] indicating the state of the transaction. This will be `"purchased"` in the case of a normal or restored purchase, `"cancelled"` for a cancelled purchase, `"consumed"` for a consumed purchase, `"restoreCompleted"` for when a restore is completed, or `"failed"` in case of an error.

* `identifier` &mdash; The unique [string][api.type.String] identifier for the transaction.

* `productIdentifier` &mdash; A [string][api.type.String] representing the product identifier associated with the transaction.

* `purchaseType` &mdash; Type ([string][api.type.String]) which is either `"item"` or `"subscription"`.

* `isConsumable` &mdash; A ([boolean][api.type.Boolean]) whether or not the in-app item is consumable.

* `statusType` &mdash; Type ([string][api.type.Boolean]) which is used for state `"consumed"` and returns either `"success"`, `"invalidPurchaseID"`, `"failedOrder"`, `"nonConsumableItem"`, `"unauthorizedUser"`, `"serviceError"`

* `status` &mdash; Status message ([string][api.type.Boolean]) which is used for state `"consumed"`

* `date` &mdash; A [string][api.type.String] representing the date when the transaction occurred, represented in `"YYYY-MM-DD HH:mm:ss"` format.

* `subscriptionEndDate` &mdash; A [string][api.type.String] representing the date when the given subscription ends, represented in `"YYYY-MM-DD HH:mm:ss"` format.

* `originalJson` &mdash; A JSON-formatted [string][api.type.String] representation of the transaction.

* `isError` &mdash; [Boolean][api.type.Boolean] value indicating whether an error occurred. If this is `true`, `errorType` and `errorString` will be [strings][api.type.String] stating the reason.

* `errorType` &mdash; A [string][api.type.String] representing the type of error that occurred if `isError` is `true`.

* `errorString` &mdash; A more descriptive error message ([string][api.type.String]) if `isError` is `true`.
