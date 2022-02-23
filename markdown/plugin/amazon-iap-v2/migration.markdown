# Amazon IAP v2 Migration

The current [Amazon IAP][plugin.amazon-iap-v2] plugin corresponds to <nobr>Amazon IAP v2</nobr>. If you are migrating from the previous version to v2, please see the migration notes below.

## Differences

* When including the plugin within `build.settings`, change <nobr>`publisherId = "com.amazon"`</nobr> to <nobr>`publisherId = "com.coronalabs"`</nobr>. The key name of <nobr>`["plugin.amazon.iap"]`</nobr> remains the same.

* You must now call [store.finishTransaction()][plugin.amazon-iap-v2.finishTransaction] following every transaction. This notifies Amazon about the transaction being processed.

* Amazon IAP v2 does not include a `"restored"` state for transactions. The [store.restore()][plugin.amazon-iap-v2.restore] function should be called to retrieve all of the user's purchases and, in this case, all valid transactions will be of the `"purchased"` state.

## Additions

* [store.isActive][plugin.amazon-iap-v2.isActive] is now supported. This property will be `true` if the plugin was initialized successfully.

* New [store.getUserData()][plugin.amazon-iap-v2.getUserData] function added to retrieve the user&nbsp;ID and marketplace code of the currently <nobr>logged-in</nobr> user.

* New properties available in the [productList][plugin.amazon-iap-v2.event.productList] event table associated with [store.loadProducts()][plugin.amazon-iap-v2.loadProducts], as well as the [storeTransaction][plugin.amazon-iap-v2.event.storeTransaction] event table associated with [initialization][plugin.amazon-iap-v2.init], [purchase][plugin.amazon-iap-v2.purchase], and [restore][plugin.amazon-iap-v2.restore] requests.

* [store.canLoadProducts][plugin.amazon-iap-v2.canLoadProducts] and [store.canMakePurchases][plugin.amazon-iap-v2.canMakePurchases] are supported, but only for <nobr>cross-platform</nobr> compatibility with other IAP providers. They mirror the value of [store.isActive][plugin.amazon-iap-v2.isActive] and do not need to be checked to proceed with store transactions or requests.

## Other

* In Kindle FreeTime, only IAP subscription/entitlement or <nobr>non-consumable</nobr> IAP items will be shared along within the app in different profiles.
