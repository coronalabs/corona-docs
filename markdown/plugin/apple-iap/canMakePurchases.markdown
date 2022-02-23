
# store.canMakePurchases

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Apple, IAP, in-app purchases, canMakePurchases
> __See also__          [store.purchase()][plugin.apple-iap.purchase]
>						[store.*][plugin.apple-iap]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

On iOS, there is a setting which disables <nobr>in-app</nobr> purchasing, commonly used to prevent children from purchasing items without permission. Use this property to check in advance if purchasing is allowed and notify the user if purchasing is forbidden.

This property will be `true` if purchasing is allowed, `false` otherwise.


## Syntax

	store.canMakePurchases
