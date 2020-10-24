
<style>

.icon-box-border {
    border-top: 2px solid #6cb3ef;
    margin-top: 24px;
    margin-bottom: 32px;
}
.icon-box-border p {
    margin-top: 16px;
}
.icon-box-right {
	float: right;
    width: 86px;
    min-height: 84px;
    max-width: 86px;
    max-height: 84px;
    background-color: #6cb3ef;
    color: #fff;
    text-align: center;
    margin-left: 25px;
    margin-bottom: 20px;
	overflow: hidden;
}
.icon-box-right .fa {
	font-size: 66px;
}

</style>


# In-App Purchasing (IAP)

This guide discusses how to implement <nobr>in-app</nobr> purchasing (IAP) within Corona apps.

<div class="guides-toc">

* [Overview](#overview)
* [Product Types](#products)
* [Setup / Configuration](#setup)
* [Initializing IAP](#initialization)
* [Loading Products](#products)
* [Handling Transactions](#transactions)
* [Purchasing Products](#purchasing)
* [Restoring Purchased Items](#restoring)
* [Store-Specific Functionality](#store-specific)

</div>


<a id="overview"></a>

## Overview

In-app purchasing (IAP) allows users to purchase additional content from within an app. However, this content cannot be delivered through a marketplace as if it were physical inventory&nbsp;&mdash; you must either bundle the content with your app when you build it, anticipating that it will be unlocked/enabled upon purchase, or you must download additional content into the app using the [network][api.library.network] APIs.




<a id="products"></a>

## Product Types

There are four basic product types supported for <nobr>in-app</nobr> purchasing:

1. Items which the user can only buy once, for instance paying to unlock the full game, activate a special player ability, unlock levels <nobr>20-40</nobr>, etc.
2. Items which the user can buy multiple times, for example gem/coin&nbsp;packs, extra&nbsp;lives, etc. Note that for Google&nbsp;IAP, these items must be [consumed](#consuming-items-google) before they can be purchased again.
3. Items that can be purchased on a subscription basis that <nobr>auto-renews</nobr>, such as a monthly service fee to play a multiplayer game.
4. Items that can be purchased on a subscription basis that does not <nobr>auto-renew</nobr>, for instance an annual fee to see premium content within an informational app.

Each store names these differently. Consider this chart:

<div class="inner-table nobr">

Product Type						Apple							Google						Amazon
----------------------------------	------------------------------	--------------------------	-----------------
__one-time purchase__				non-consumable					managed						entitlement
__multiple-time purchase__			consumable						managed with consumption	consumable
__auto-renewing subscription__		auto-renewable subscription		subscriptions				subscription
__non-renewing subscription__		non-renewing subscription		&nbsp;						&nbsp;
----------------------------------	------------------------------	--------------------------	-----------------

</div>

### Product Identifiers

Products are individually identified by a unique string known as a __product&nbsp;identifier__. Each store may use a different term, but in all cases it's a string value which must be unique for your app. It's recommended that you follow the <nobr>reverse-domain</nobr> naming convention across all stores, for&nbsp;example:

``````
com.acmegames.SuperRunner.UnlockFullGame
``````

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

When configuring products within a store's portal, product identifiers should be named clearly and accurately since you'll need to use them within your Corona code to load products, submit purchase requests, and identify the item after a completed transaction. In addition, if you intend to support multiple stores/platforms, you should use a consistent name for each product across all of them&nbsp;&mdash; this will prevent the need for extra conditional code throughout your IAP implementation.

</div>
</div>




<a id="setup"></a>

## Setup / Configuration

Each marketplace &mdash; the Apple&nbsp;App&nbsp;Store, Google&nbsp;Play, and the Amazon&nbsp;Appstore&nbsp;&mdash; has different requirements and setup procedures for configuring <nobr>in-app</nobr> purchasing. Please follow the steps below for each marketplace you intend to target.

<!--- iOS -->
<a id="setup-ios"></a>
<div class="icon-box-border" style="border-color: #a5aec9;">
<div class="icon-box-right" style="background-color: #a5aec9;">
<div class="fa fa-apple" style="font-size: 60px; padding-top: 8px;"></div>
</div>

The following steps pertain to <nobr>in-app</nobr> purchasing on __iOS__.

1. Start by configuring your banking and tax information within [iTunes Connect](https://itunesconnect.apple.com/). <nobr>In-app</nobr> purchases will __not__ work until these steps are cleared, and you won't get an error message reporting so.

2. In the [Apple Developer](https://developer.apple.com/) portal, create a new App&nbsp;ID that is unique and fully qualified <nobr>(you can __not__ use</nobr> a wildcard App&nbsp;ID for apps that utilize <nobr>in-app purchasing)</nobr>. If you need guidance on this process, please see [here][guide.distribution.iOSBuild#creating-app-ids].

3. Back in [iTunes Connect](https://itunesconnect.apple.com/), create a new app with the same __Bundle&nbsp;ID__ as your app in the Apple&nbsp;Developer portal.

4. Finally, configure your <nobr>in-app</nobr> purchases (products) within [iTunes Connect](https://itunesconnect.apple.com/). This task is beyond the scope of this guide, so please see Apple's [In-App Purchase Configuration Guide](https://developer.apple.com/library/content/documentation/LanguagesUtilities/Conceptual/iTunesConnectInAppPurchase_Guide/Chapters/Introduction.html) for further assistance.

</div>

<!--- Android -->
<a id="setup-android"></a>
<div class="icon-box-border">
<div class="icon-box-right">
<div class="fa fa-android" style="padding-top: 4px;"></div>
</div>

The following steps pertain to in-app purchasing on __Android__.

1. Start by setting up your Google merchant account and link it to the [Google Play Developer Console](https://play.google.com/apps/publish/). <nobr>In-app</nobr> purchases will __not__ work until these steps are cleared, and you won't get an error message reporting so. Please see [here](https://support.google.com/payments/merchant/answer/7161426) for detailed instructions. 

2. While still in console, create a new app and fill out all of the information needed for publishing the app&nbsp;&mdash; note,&nbsp;however, that some details don't need to be final for simply testing <nobr>in-app</nobr> purchasing.

3. Configure your <nobr>in-app</nobr> purchases (products). This task is beyond the scope of this guide, so please see Google's [Administering In-App Billing](https://developer.android.com/google/play/billing/billing_admin.html) guide for further assistance.

4. On the Corona side, integrate the [Google Biling][plugin.google-iap-billing] plugin by adding an entry into the `plugins` table of the project's `build.settings` file:

<div class="code-indent">

``````{ brush="lua" gutter="false" first-line="1" highlight="[5,6,7,8]" }
settings =
{
	plugins =
	{
		["plugin.google.iap.billing"] =
		{
			publisherId = "com.coronalabs"
		},
	},
}
``````

</div>

5. Optionally add a `license` table to the project's `config.lua` file. Inside this table, the `key` value should be set to the corresponding <nobr>per-app</nobr> Licensing key obtained from the [Google Play Developer Console](https://play.google.com/apps/publish/). This key is indicated in the <nobr>__Monetization setup__</nobr> section of <nobr>__Monetize__</nobr>. This key would allow the plugin to cryptographically verify purchase receipts right on the device.

<div class="code-indent">

``````{ brush="lua" gutter="false" first-line="1" highlight="[3,4,5,6,7,8,9]" }
application = 
{
	license =
	{
		google =
		{
			key = "YOUR_KEY",
		},
	},
}
``````

</div>

6. When you're ready to test <nobr>in-app</nobr> purchasing, [build][guide.distribution.androidBuild] your app to create a `.apk` file which can be uploaded to the [Google Play Developer Console](https://play.google.com/apps/publish/). Then, proceed to Google's [Testing In-App Billing](https://developer.android.com/google/play/billing/billing_testing.html) guide.

</div>

<!--- Amazon -->
<a id="setup-amazon"></a>
<div class="icon-box-border" style="border-color: #fd9827; margin-bottom: 16px;">
<div class="icon-box-right" style="background-color: #fd9827;">
<div class="fa fa-amazon" style="font-size: 58px; padding-top: 12px;"></div>
</div>

The following steps pertain to in-app purchasing on __Amazon__.

1. If you haven't already, register for an [Amazon Developer](http://developer.amazon.com) account.

2. If you're new to <nobr>Amazon in-app purchasing</nobr>, read Amazon's [Understanding In-App Purchasing](https://developer.amazon.com/public/apis/earn/in-app-purchasing/docs-v2/understanding-in-app-purchasing) guide.

3. Configure your <nobr>in-app</nobr> purchases (products). This task is beyond the scope of this guide, so please see Amazon's [Submitting IAP Items](https://developer.amazon.com/public/apis/earn/in-app-purchasing/docs-v2/submitting-iap-items) guide for further assistance.

4. On the Corona side, integrate the [Amazon IAP][plugin.amazon-iap-v2] plugin by adding an entry into the `plugins` table of the project's `build.settings` file:

<div class="code-indent">

``````{ brush="lua" gutter="false" first-line="1" highlight="[5,6,7,8]" }
settings =
{
	plugins =
	{
		["plugin.amazon.iap"] =
		{
			publisherId = "com.coronalabs"
		},
	},
}
``````

</div>

5. Finally, install the [Amazon App Tester](https://developer.amazon.com/public/apis/earn/in-app-purchasing/docs-v2/installing-and-configuring-app-tester) or publish your app in the Amazon&nbsp;Appstore. Details on testing can be found [here](https://developer.amazon.com/public/apis/earn/in-app-purchasing/docs-v2/testing-iap-2.0).

</div>




<!---

Now you should [build][guide.distribution.androidBuild] your app — even if it's still in development — to create a `.apk` file which can be uploaded to the [Google&nbsp;Play&nbsp;Developer&nbsp;Console](https://play.google.com/apps/publish/). Upload your `.apk` to either the &ldquo;Alpha&rdquo; or &ldquo;Beta&nbsp;Testing&rdquo; channels, provide all of the required infomation about your app for distribution, and publish it in that channel. Be sure that you do __not__ publish it to the &ldquo;Production&rdquo; channel, or else your untested app might go public!

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

When you set up test accounts, be sure they're added to the &ldquo;Gmail accounts with testing access&rdquo; list. Otherwise, anyone testing your app will be charged for the <nobr>in-app</nobr> product.

</div>

-->




<a id="initialization"></a>

## Initializing IAP

### Module Inclusion

Because each IAP provider utilizes a different module/plugin on the Corona side, you must load the proper one.

If you are only supporting one store, you can simply `require()` the proper module as follows:

<div class="docs-tip-outer" style="background-color: #a5aec9;">
<div class="docs-tip-inner-left">
<div class="fa fa-apple" style="font-size: 36px; margin-left: 1px;"></div>
</div>
<div class="docs-tip-inner-right">

``````lua
local store = require( "store" )  -- iOS
``````

</div>
</div>

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-android" style="font-size: 39px; padding-top: 2px;"></div>
</div>
<div class="docs-tip-inner-right">

``````lua
local store = require( "plugin.google.iap.billing" )  -- Android
``````

</div>
</div>

<div class="docs-tip-outer" style="background-color: #fd9827;">
<div class="docs-tip-inner-left">
<div class="fa fa-amazon" style="padding-top: 6px;"></div>
</div>
<div class="docs-tip-inner-right">

``````lua
local store = require( "plugin.amazon.iap" )  -- Amazon
``````

</div>
</div>

Alternatively, if you want to support multiple platforms, a conditional routine can be implemented. In the following example, the [system.getInfo()][api.library.system.getInfo#targetappstore] call is used to detect which store the built app will target, and that property is used to load the proper module.

``````lua
local store

local targetAppStore = system.getInfo( "targetAppStore" )

if ( "apple" == targetAppStore ) then  -- iOS
	store = require( "store" )
elseif ( "google" == targetAppStore ) then  -- Android
	store = require( "plugin.google.iap.billing" )
elseif ( "amazon" == targetAppStore ) then  -- Amazon
	store = require( "plugin.amazon.iap" )
else
	print( "In-app purchases are not available for this platform." )
end
``````

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

When building your app for <nobr>Android-based</nobr> devices, including Amazon's Kindle&nbsp;Fire devices, remember to select the correct __Target&nbsp;App&nbsp;Store__ from the Corona build dialog window \([guide][guide.distribution.androidBuild]\).

</div>
</div>

### Initialization

Once the proper module is loaded, you must initialize it using the `store.init()` call:

``````lua
store.init( transactionListener )
``````

The only required argument, `transactionListener`, is the function you intend to use to handle store __transaction__ requests, including purchases and potential refunds. For&nbsp;example:

``````{ brush="lua" gutter="false" first-line="1" highlight="[1,2,3,4,5,6,7,8,9,10,11]" }
local function transactionListener( event )

	local transaction = event.transaction

	if ( transaction.isError ) then
		print( transaction.errorType )
		print( transaction.errorString )
	else
		-- No errors; proceed
	end
end

-- Initialize store
store.init( transactionListener )
``````

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

The `store.init()` call is required and must be executed before you attempt to call any other <nobr>store-related</nobr> functions.

</div>
</div>

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

For Google IAP, this same transaction listener function also handles initialization ([init][plugin.google-iap-billin.event.init]) events. Thus, if you're using Google&nbsp;IAP, you should differentiate store transaction events from initialization events by conditionally checking the value of [event.name][plugin.google-iap-billing.event.storeTransaction.name]. Please see the Google&nbsp;IAP [store.init()][plugin.google-iap-billing.init] documentation for an example of doing so.

</div>
</div>

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

Sometime after calling `store.init()`, you may check the `store.isActive` property to confirm that the store has successfully initialized (value&nbsp;of&nbsp;`true`). 

</div>
</div>




<a id="products"></a>

## Loading Products

In your Corona app, you can use the `store.loadProducts()` function to load product information which you've entered into the respective stores:

``````lua
store.loadProducts( productIdentifiers, productListener )
``````

This function requires the following two arguments:

* `productIdentifiers` &mdash; A Lua [table][api.type.Table] (array) where each element is a [string][api.type.String] representing the product identifier of the item. Product identifiers must match those you entered within [iTunes Connect](https://itunesconnect.apple.com/), the [Google Play Developer Console](https://play.google.com/apps/publish/), and/or the [Amazon Developer](http://developer.amazon.com) portal. For&nbsp;example:

<div class="code-indent">

``````lua
local productIdentifiers = {
	"com.domainname.testProduct1",
	"com.domainname.testProduct2",
	"com.domainname.testProduct3",
}
``````

</div>

* `productListener` &mdash; The listener function which will be invoked when the store finishes retrieving the product information. For&nbsp;instance:

<div class="code-indent">

``````{ brush="lua" gutter="false" first-line="1" highlight="[7,8,9]" }
local productIdentifiers = {
	"com.domainname.testProduct1",
	"com.domainname.testProduct2",
	"com.domainname.testProduct3",
}

local function productListener( event )

end

-- Load store products; store must be properly initialized by this point!
store.loadProducts( productIdentifiers, productListener )
``````

</div>

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

If you kept your product identifiers consistent for all platforms, you can use one product array, but if your identifiers vary between stores, you'll need to use separate arrays and conditional logic with <nobr>`system.getInfo( "targetAppStore" )`</nobr> to load the appropriate products for the respective store.

</div>
</div>

### Product Properties

When products are loaded, the product listener function (`productListener`&nbsp;argument for&nbsp;`store.loadProducts()`) will receive an `event` table as its sole argument. The properties/keys associated with this table will differ slightly because of core variances in store functionality, but at the very minimum, these two properties will be available:

* `event.products` &mdash; A table in which each element is another table containing detailed product information. This is primarily the table you'll need to inspect to get detailed information about the loaded products.

* `event.invalidProducts` &mdash; A table in which each element is a string representing a product identifier. This table will only be populated by products that don't exist or aren't available.

Typically, you should iterate (loop) through `event.products` to determine which products are available. For&nbsp;example:

``````{ brush="lua" gutter="false" first-line="1" highlight="[9,10,11]" }
local productIdentifiers = {
	"com.domainname.testProduct1",
	"com.domainname.testProduct2",
	"com.domainname.testProduct3",
}

local function productListener( event )

	for i = 1,#event.products do
		print( event.products[i].productIdentifier )
	end
end

-- Load store products; store must be properly initialized by this point!
store.loadProducts( productIdentifiers, productListener )
``````

For each instance within `event.products`, various properties will be available and these properties can be used to create an interface (store&nbsp;scene) or display available products in some other manner. Because of core variances in store functionality, these properties will differ for each store, but the following common properties will be available for products in __all__ stores:

* `productIdentifier` &mdash; A [string][api.type.String] representing the product identifier.
* `title` &mdash; A [string][api.type.String] representing the product title.
* `description` &mdash; A [string][api.type.String] representing the product description.
* `localizedPrice` &mdash; The product price as a localized currency [string][api.type.String], for example `$0.99`.

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

Together, the above properties should be sufficient to display an informative product listing to the user/player, but you may want to consult the documentation for [iOS][api.library.store.event.productList.products], [Android][plugin.google-iap-billing.event.productList.products], and [Amazon][plugin.amazon-iap-v2.event.productList.products] to inspect additional properties.

</div>
</div>




<a id="transactions"></a>

## Handling Transactions

When a user/player chooses to buy a product within your app, a connection will be made with the store's servers to initiate a __transaction__. The store will then process the transaction and send data back to your app with the results. As outlined above, this event is handled by the transaction listener function <nobr>(`transactionListener` argument within `store.init()`)</nobr>.

Your transaction listener function should handle all of the following circumstances:

* An item was just __purchased__ via `store.purchase()`.
* A purchase transaction was __cancelled__ by the user after `store.purchase()` was called.
* A purchase transaction __failed__ for various reasons.
* A __restore purchased items__ request was initiated via `store.restore()`.

### Transaction Properties

When a transaction occurs, various properties will be available within the `event.transaction` table which is dispatched to the transaction listener function. Because of core variances in store functionality, these properties will differ for each store, but the following common properties will be available for transactions in __all__ stores:

* `state` &mdash; A [string][api.type.String] indicating the state of the transaction, for example `"purchased"`, `"cancelled"`, or `"failed"`.
* `identifier` &mdash; The unique [string][api.type.String] identifier for the transaction.
* `productIdentifier` &mdash; A [string][api.type.String] representing the product identifier associated with the transaction.
* `receipt` &mdash; A JSON-formatted [string][api.type.String] representation of the transaction receipt.
* `date` &mdash; A [string][api.type.String] representing the date when the transaction occurred.
* `isError` &mdash; [Boolean][api.type.Boolean] value indicating whether an error occurred. If this is `true`, `errorType` and `errorString` will be [strings][api.type.String] stating the reason.
* `errorType` &mdash; A [string][api.type.String] representing the type of error that occurred if `isError` is `true`.
* `errorString` &mdash; A more descriptive error message ([string][api.type.String]) if `isError` is `true`.

After you receive a transaction event, you should take the appropriate action. For example, if the user successfully purchased an item, you might save this information to a file or local database and unlock the ability to use the item. This file can then be referenced in future sessions so you know that the item has been purchased.

The following is an example framework for the transaction listener function:

``````lua
local function transactionListener( event )

	local transaction = event.transaction

	if ( transaction.isError ) then
		print( transaction.errorType )
		print( transaction.errorString )
	else
		-- No errors; proceed
		if ( transaction.state == "purchased" or transaction.state == "restored" ) then
			-- Handle a normal purchase or restored purchase here
			print( transaction.state )
			print( transaction.productIdentifier )
			print( transaction.date )

		elseif ( transaction.state == "cancelled" ) then
			-- Handle a cancelled transaction here

		elseif ( transaction.state == "failed" ) then
			-- Handle a failed transaction here
		end

		-- Tell the store that the transaction is complete
		-- If you're providing downloadable content, do not call this until the download has completed
		store.finishTransaction( transaction )
	end
end

-- Initialize store
store.init( transactionListener )
``````

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

For Google IAP, this same transaction listener function also handles initialization ([init][plugin.google-iap-billing.event.init]) events. Thus, if you're using Google&nbsp;IAP, you should differentiate store transaction events from initialization events by conditionally checking the value of [event.name][plugin.google-iap-billing.event.storeTransaction.name]. Please see the Google&nbsp;IAP [store.init()][plugin.google-iap-billing.init] documentation for an example of doing so.

</div>
</div>

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

As indicated, you must call `store.finishTransaction()` on the transaction object when the transaction is complete. If you don't, the store will think that the transaction was interrupted and will attempt to resume it on the next application launch.

``````{ brush="lua" gutter="false" first-line="1" highlight="[5]" }
		end

		-- Tell the store that the transaction is complete
		-- If you're providing downloadable content, do not call this until the download has completed
		store.finishTransaction( transaction )
	end
end
``````

</div>
</div>

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

As noted above, the properties and values returned will vary slightly because of core variances in store functionality. For example, Apple will return `"restored"` for the `state` property of restored purchases, but Google&nbsp;Play and Amazon will group normal purchases and restored purchases collectively under the `"purchased"` state. In&nbsp;addition, each store returns an assortment of unique properties which you may need to inspect, so please consult the documentation for [iOS][api.library.store.event.storeTransaction.transaction], [Android][plugin.google-iap-billing.event.storeTransaction.transaction], and [Amazon][plugin.amazon-iap-v2.event.storeTransaction.transaction] respectively.

</div>
</div>




<a id="purchasing"></a>

## Purchasing Products

To initiate a purchase, use the `store.purchase()` function. When called, this will submit a purchase request to the store and, when the store finishes processing the transaction, the listener function you specified in `store.init()` will be invoked.

``````lua
store.purchase( productIdentifier )
``````

As noted in [Transaction Properties](#transaction-properties) above, `event.transaction` within the transaction listener function will receive a `state` property of `"purchased"` for a successfully processed purchase.




<a id="restoring"></a>

## Restoring Purchased Items

If a user wipes clean the information on a device or buys a new device, he/she needs a way to restore items previously purchased from your app (without&nbsp;paying for them&nbsp;again). The `store.restore()` function initiates this process:

``````lua
store.restore()
``````

When called, a restore process will be initiated and, during this process, the transaction listener function may be called multiple times <nobr>(once for each item)</nobr>. Using each product identifier (`event.transaction.productIdentifier`), you can then reset those products to "owned" or "unlocked" using whatever integration is suitable for your app.

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

As noted above, Apple will return `"restored"` for the `state` property of restored purchases, but Google&nbsp;Play and Amazon will group normal purchases and restored purchases collectively under the `"purchased"` state. Typically, you can simply handle both conditions using an `or` operator as in the example shown under [Transaction Properties](#transaction-properties) above.

``````{ brush="lua" gutter="false" first-line="1" highlight="[3]" }
local transaction = event.transaction

if ( transaction.state == "purchased" or transaction.state == "restored" ) then
	-- Handle a normal purchase or restored purchase here
``````

</div>
</div>




<a id="store-specific"></a>

## Store-Specific Functionality

Each marketplace offers some unique and potentially critical functionality which you must be aware of. The following list summarizes these, but you should always consult the documentation for [iOS][api.library.store], [Android][plugin.google-iap-billing], and [Amazon][plugin.amazon-iap-v2] to inspect <nobr>platform-specific</nobr> functionality in detail.

### Purchasing Disabled (Apple)

iOS devices have a setting which can disable <nobr>in-app</nobr> purchasing entirely. This is commonly used to prevent children from accidentally purchasing items without permission. For Apple&nbsp;IAP, Corona provides the [store.canMakePurchases][api.library.store.canMakePurchases] property to check whether purchasing is enabled or disabled. You should use this to check in advance if purchasing is allowed and notify the user if it's forbidden.

### Consuming Items (Google)

Google IAP requires that you __consume__ purchases to make item(s) available for purchase again. Essentially, once a product is purchased, it is considered "owned" and it cannot be purchased again. However, since you'll almost certainly want to encourage players to buy certain items again&nbsp;&mdash; gem/coin&nbsp;packs, extra&nbsp;lives,&nbsp;etc.&nbsp;&mdash; you must send a consumption request to revert "owned" products to "unowned" products so that they become available for purchase again. Consuming products also discards their previous purchase data.

To consume items, call [store.consumePurchase()][plugin.google-iap-billing.consumePurchase] with the associated product identifier:

``````lua
store.consumePurchase( productIdentifier )
``````

When invoked, and upon receipt of a successful consumption event, the value of `event.transaction.state` within the transaction listener function will be `"consumed"`. At this point, you may <nobr>re-enable</nobr> the product for purchase within your user interface or store scene.

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

Note that some items are designed to be purchased only once and you should __not__ consume them. For example, if a purchase unlocks a new world within a game or grants a permanent <nobr>power-up</nobr> to a character, it should be ineligible for future purchase.

</div>
</div>

### Handling Refunds (Google)

Google IAP allows for transactions to be refunded ([instructions](https://support.google.com/payments/merchant/answer/7162697)). Upon receipt of a successful refund event, the value of `event.transaction.state` within the transaction listener function will be `"refunded"` and, in this case, you can disable the content that was refunded and/or delete it from the app locally if it was downloaded.

### Sandbox Mode (Amazon)

Amazon lets you test <nobr>in-app</nobr> purchasing via a "sandbox" mode in which no real purchases are made. If you want to implement some form of debugging in your Corona app, you can use the [store.isSandboxMode()][plugin.amazon-iap-v2.isSandboxMode] API to check if the app is currently in testing mode.

