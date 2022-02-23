# event.transaction

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Table][api.type.Table]
> __Event__             [init][plugin.google-iap-v3.event.init]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google, IAP, in-app purchases, init, transaction
> __See also__			[init][plugin.google-iap-v3.event.init]
>						[store.*][plugin.google-iap-v3]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This table contains the following <nobr>read-only</nobr> properties pertaining to Google&nbsp;IAP initialization:

* `state` &mdash; A [string][api.type.String] value of `"initialized"` which is dispatched when the initialization process started by [store.init()][plugin.google-iap-v3.init] has completed and Google&nbsp;IAP is ready.

* `isError` &mdash; A [boolean][api.type.Boolean] indicating that an error occurred. In this case, more details are indicated by `errorType` and `errorString`.

* `errorType` &mdash; A [string][api.type.String] representing the type of error that occurred if `isError` is `true`.

* `errorString` &mdash; A more descriptive error message ([string][api.type.String]) if `isError` is `true`.
