# event.transaction

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Table][api.type.Table]
> __Event__             [storeTransaction][plugin.amazon-iap-v3.event.storeTransaction]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Amazon, IAP, in-app purchases, storeTransaction, transaction
> __See also__			[storeTransaction][plugin.amazon-iap-v3.event.storeTransaction]
>						[store.*][plugin.amazon-iap-v3]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This table contains the following <nobr>read-only</nobr> properties pertaining to the transaction:

* `state` &mdash; A [string][api.type.String] indicating the state of the transaction. This will be `"purchased"` in the case of a normal or restored purchase, `"cancelled"` for a cancelled purchase, or `"failed"` in case of an error.

* `receipt` &mdash; A <nobr>JSON-formatted</nobr> [string][api.type.String] representation of the transaction receipt.

* `identifier` &mdash; The unique [string][api.type.String] identifier for the transaction.

* `productIdentifier` &mdash; A [string][api.type.String] representing the product identifier associated with the transaction.

* `type` &mdash; A [string][api.type.String] representing the type of purchase. Possible values include `"CONSUMABLE"`, `"ENTITLEMENT"`, or `"SUBSCRIPTION"`.

* `date` &mdash; A [string][api.type.String] representing the date when the transaction occurred, represented in Unix epoch milliseconds.

* `cancelDate` &mdash; A [string][api.type.String] representing the date when the transaction was cancelled, represented in Unix epoch milliseconds. If the transaction was not cancelled, this will be `nil`.

* `subscriptionStartDate` &mdash; For a <nobr>subscription-based</nobr> purchase, a [string][api.type.String] which mirrors the value of `date` and indicates the date when the subscription started, represented in Unix epoch milliseconds.

* `subscriptionEndDate` &mdash; For a <nobr>subscription-based</nobr> purchase, a [string][api.type.String] which mirrors the value of `cancelDate` and indicates the date when the subscription ends, represented in Unix epoch milliseconds.

* `userId` &mdash; A [string][api.type.String] value indicating the ID of the currently <nobr>logged-in</nobr> user.

* `marketplace` &mdash; A <nobr>two-character</nobr> <nobr>ISO 3166-1</nobr> country code denoting the marketplace region. For example, `"US"` for the United&nbsp;States or `"GB"` for the United&nbsp;Kingdom.

* `isError` &mdash; [Boolean][api.type.Boolean] value indicating whether an error occurred. If this is `true`, `errorType` and `errorString` will be [strings][api.type.String] stating the reason.

* `errorType` &mdash; A [string][api.type.String] representing the type of error that occurred if `isError` is `true`.

* `errorString` &mdash; A more descriptive error message ([string][api.type.String]) if `isError` is `true`.
