# event.transaction

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Table][api.type.Table]
> __Event__             [storeTransaction][api.library.store.event.storeTransaction]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Apple, IAP, in-app purchases, storeTransaction, transaction
> __See also__			[storeTransaction][api.library.store.event.storeTransaction]
>						[store.*][api.library.store]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This table contains the following <nobr>read-only</nobr> properties pertaining to the transaction:

* `state` &mdash; A [string][api.type.String] indicating the state of the transaction. This will be `"purchased"` in the case of a normal purchase, `"restored"` for a restored purchase, `"cancelled"` for a cancelled purchase, or `"failed"` in case of an error.

* `receipt` &mdash; A <nobr>JSON-formatted</nobr> [string][api.type.String] representation of the transaction receipt.

* `identifier` &mdash; The unique [string][api.type.String] identifier for the transaction.

* `productIdentifier` &mdash; A [string][api.type.String] representing the product identifier associated with the transaction.

* `date` &mdash; A [string][api.type.String] representing the date when the transaction occurred, returned in GMT time and `YYYY/MM/DD` locale format.

* `originalReceipt` &mdash; A hexadecimal [string][api.type.String] representing the unique receipt from the original purchase. This is primarily relevant in a case of a `"restored"` transaction state.

* `originalIdentifier` &mdash; A [string][api.type.String] representing the unique transaction identifier from the original purchase. This is primarily relevant in a case of a `"restored"` transaction state.

* `originalDate` &mdash; A [string][api.type.String] representing the date of the original purchase, returned in GMT time and `YYYY/MM/DD` locale format. This is primarily relevant in a case of a `"restored"` transaction state.

* `isError` &mdash; [Boolean][api.type.Boolean] value indicating whether an error occurred. If this is `true`, `errorType` and `errorString` will be [strings][api.type.String] stating the reason.

* `errorType` &mdash; A [string][api.type.String] representing the type of error that occurred if `isError` is `true`.

* `errorString` &mdash; A more descriptive error message ([string][api.type.String]) if `isError` is `true`.
