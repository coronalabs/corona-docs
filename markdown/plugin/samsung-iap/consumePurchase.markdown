
# store.consumePurchase()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google, IAP, in-app purchases, consumePurchase
> __See also__          [store.purchase()][plugin.google-iap-v3.purchase]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This function "consumes" purchases and makes the item(s) available for purchase again. In Google&nbsp;IAP, once a product is purchased, it is considered "owned" and it cannot be purchased again. Thus, you must use this function to revert "owned" products to "unowned" products so they become available for purchase again.

Note that some items are designed to be purchased only once and you should __not__ consume them. For example, if a purchase unlocks a new world within a game, it should be ineligible for future consumption. Alternatively, some items can be purchased multiple times, for example energy packs and gems &mdash; these type of items must be consumed before they can be purchased again. For further information, please see Google's [documentation](http://developer.android.com/google/play/billing/api.html#consume).


## Gotchas

* Consuming purchases is __not__ instantaneous. It's recommended that you wait a few minutes after calling `store.consumePurchase()`, then verify that the consumption actually happened.

* Consuming products also discards their previous purchase data.

* When a product is consumed, the transaction state will be `"consumed"`. There are no callbacks for invalid products.


## Syntax

	store.consumePurchase( productIdentifier )

##### productIdentifier ~^(required)^~
_[String][api.type.String]._ String representing the product identifier of the item to consume.
