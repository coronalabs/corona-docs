
# store.changeSubscriptionPlan()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Samsung, IAP, in-app purchases, subscription, changeSubscriptionPlan
> __See also__          [store.purchase()][plugin.samsung-iap.purchase]
>						[store.acknowledgePurchase()][plugin.samsung-iap.acknowledgePurchase]
>						[store.*][plugin.samsung-iap]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Upgrades or downgrades an active subscription to another subscription product, then dispatches a [storeTransaction][plugin.samsung-iap.event.storeTransaction] event to the listener defined in [store.init()][plugin.samsung-iap.init]. On success the event has a `state` of `"purchased"` for the new subscription and `previousProductIdentifier` set to the replaced one; acknowledge the new purchase with [store.acknowledgePurchase()][plugin.samsung-iap.acknowledgePurchase].


## Syntax

	store.changeSubscriptionPlan( currentProductIdentifier, newProductIdentifier [,options] )

##### currentProductIdentifier ~^(required)^~
_[String][api.type.String]._ The product identifier of the subscription the user currently owns.

##### newProductIdentifier ~^(required)^~
_[String][api.type.String]._ The product identifier of the subscription to switch to.

##### options ~^(optional)^~
_[Table][api.type.Table]._ A table with the following optional keys:

* `prorationMode` &mdash; A [string][api.type.String] telling Samsung IAP how to handle the remaining time of the current subscription:
	* `"instantProratedDate"` (default) &mdash; The change takes effect immediately; the remaining time is converted into time on the new plan based on the price difference.
	* `"instantProratedCharge"` &mdash; The change takes effect immediately; the price difference for the remaining period is charged.
	* `"instantNoProration"` &mdash; The change takes effect immediately; the new price is charged from the next renewal.
	* `"deferred"` &mdash; The change takes effect at the next renewal.

* `obfuscatedAccountId`, `obfuscatedProfileId`, `passThroughParam` &mdash; Same as for [store.purchase()][plugin.samsung-iap.purchase].


## Example

``````lua
store.changeSubscriptionPlan( "com.mycompany.mygame.premium.monthly", "com.mycompany.mygame.premium.yearly", {
	prorationMode = "instantProratedDate",
} )
``````
