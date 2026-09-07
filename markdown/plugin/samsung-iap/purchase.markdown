
# store.purchase()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Samsung, IAP, in-app purchases, purchase
> __See also__          [store.init()][plugin.samsung-iap.init]
>						[store.consumePurchase()][plugin.samsung-iap.consumePurchase]
>						[store.acknowledgePurchase()][plugin.samsung-iap.acknowledgePurchase]
>						[store.*][plugin.samsung-iap]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Initiates a purchase transaction on a provided product by sending out a purchase request to the store, then dispatches a [storeTransaction][plugin.samsung-iap.event.storeTransaction] event to the listener defined in [store.init()][plugin.samsung-iap.init]. Consumable items, non-consumable items and subscriptions can all be purchased with this function.


## Gotchas

* After the `"purchased"` event, grant the item to the user and then call [store.consumePurchase()][plugin.samsung-iap.consumePurchase] (consumable items) or [store.acknowledgePurchase()][plugin.samsung-iap.acknowledgePurchase] (non-consumable items and subscriptions) with the `purchaseId` of the transaction.

* Samsung IAP processes one request at a time; do not start another purchase before the event of the previous one arrived.


## Syntax

	store.purchase( productIdentifier [,options] )

##### productIdentifier ~^(required)^~
_[String][api.type.String]._ String representing the product identifier of the item to purchase.

##### options ~^(optional)^~
_[Table][api.type.Table]._ A table with the following optional keys:

* `obfuscatedAccountId` &mdash; A [string][api.type.String] (up to 64 bytes) that identifies the user's account in your app, for example a SHA-256 hash of the account name. Samsung uses it for fraud detection and returns it in the purchase, in [store.restore()][plugin.samsung-iap.restore] results and in receipts. Never pass the plain account name.

* `obfuscatedProfileId` &mdash; A [string][api.type.String] (up to 64 bytes) that identifies the user's profile in your app, obfuscated like `obfuscatedAccountId`. Requires `obfuscatedAccountId`.

* `passThroughParam` &mdash; A [string][api.type.String] (up to 255 bytes) that is attached to the transaction and returned in the `passThroughParam` field of the purchase. Deprecated by Samsung since IAP SDK 6.4 in favor of the obfuscated identifiers; it is ignored when `obfuscatedAccountId` or `obfuscatedProfileId` is set.

For backwards compatibility, a [string][api.type.String] can be passed instead of the table; it is used as `passThroughParam`.


## Example

``````lua
-- Consumable item
store.purchase( "com.mycompany.mygame.coins100" )

-- Subscription, tagged with the (hashed) account of the signed in user
store.purchase( "com.mycompany.mygame.premium.monthly", {
	obfuscatedAccountId = hashedAccountId,
} )
``````
