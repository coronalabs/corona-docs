
# store.purchaseSubscription()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google, IAP, in-app purchases, purchase
> __See also__          [store.init()][plugin.google-iap-billing-v2.init]
>						[store.*][plugin.google-iap-billing-v2]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Initiates a purchase transaction on a provided product by sending out a purchase request to the store, then dispatches a [storeTransaction][plugin.google-iap-billing-v2.event.storeTransaction] event to the listener defined in [store.init()][plugin.google-iap-billing-v2.init].


## Gotchas

This call does not work for subscription purchases.


## Syntax

	store.purchaseSubscription( productIdentifier [, options] )

##### productIdentifier ~^(required)^~
_[String][api.type.String]._ String representing the product identifier of the item to purchase.

##### options ~^(optional)^~
_[Table][api.type.Table]._ A table that specifies additional parameters of the purchase API call.

## Options Reference

The `options` table contains details about the purchase request.

##### accountId ~^(optional)^~
_[String][api.type.String]._ Specifies an optional string that is uniquely associated with the user's account in your app. This value would be obfuscated (SHA-256 hash) before sending to Google. For more details see [documentation](https://developer.android.com/reference/com/android/billingclient/api/BillingFlowParams.Builder#setObfuscatedAccountId%28java.lang.String%29).

##### obfuscatedAccountId ~^(optional)^~
_[String][api.type.String]._ Specifies an optional obfuscated string that is uniquely associated with the user's account in your app. If set, `accountId` would be ignored. For more details see [documentation](https://developer.android.com/reference/com/android/billingclient/api/BillingFlowParams.Builder#setObfuscatedAccountId%28java.lang.String%29).


##### profileId ~^(optional)^~
_[String][api.type.String]._ Specifies an optional string that is uniquely associated with the user's profile in your app. This value would be obfuscated (SHA-256 hash) before sending to Google. For more details see [documentation](https://developer.android.com/reference/com/android/billingclient/api/BillingFlowParams.Builder#setObfuscatedProfileId%28java.lang.String%29).

##### obfuscatedProfileId ~^(optional)^~
_[String][api.type.String]._ Specifies an optional obfuscated string that is uniquely associated with the user's profile in your app. If set, `profileId` would be ignored. For more details see [documentation](https://developer.android.com/reference/com/android/billingclient/api/BillingFlowParams.Builder#setObfuscatedProfileId%28java.lang.String%29)).

##### offerPersonalized ~^(optional)^~
_[Boolean][api.type.Boolean]._ Specifies whether the offer is personalized to the buyer see [documentation](https://developer.android.com/reference/com/android/billingclient/api/BillingFlowParams.Builder#setIsOfferPersonalized(boolean)).

##### subscriptionUpdate ~^(optional)^~
_[Table][api.type.Table]._  Params used to upgrade or downgrade a subscription. [documentation](https://developer.android.com/reference/com/android/billingclient/api/BillingFlowParams.Builder#setIsOfferPersonalized(boolean)).

## subscriptionUpdate Reference

##### purchaseToken ~^(required)^~
_[String][api.type.String]._ Value which is Google Play Billing purchase token that the user is upgrading or downgrading from

##### prorationMode ~^(required)^~
_[String][api.type.String]._ Specifies the Google Play Billing mode of proration during subscription upgrade/downgrade. Supported values for `prorationMode`: `unknownSubscriptionUpgrade`, `deferred`, `immediateAndChargeFullPrice`, `immediateAndChargeProratedPrice`, `immediateWithoutProration`, and `immediateWithTimeProration`. i.e `{purchaseToken="abcd123",prorationMode="immediateWithoutProration" }`
