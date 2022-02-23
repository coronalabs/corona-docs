# store.getUserId()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [String][api.type.String] or `nil`
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Amazon, IAP, in-app purchases, getUserId
> __See also__			[store.getUserData()][plugin.amazon-iap-v2.getUserData]
>						[store.*][plugin.amazon-iap-v2]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This function can be called any time after calling [store.init()][plugin.amazon-iap-v2.init] to determine the ID of the currently <nobr>logged-in</nobr> user. If called before [store.init()][plugin.amazon-iap-v2.init], this function will return `nil`. If the user is unknown, it will return `"unknown"`.

Alternatively, the user&nbsp;ID and additional information can be gathered via the [store.getUserData()][plugin.amazon-iap-v2.getUserData] function and its [userData][plugin.amazon-iap-v2.event.userData] event listener.


## Syntax

	store.getUserId()
