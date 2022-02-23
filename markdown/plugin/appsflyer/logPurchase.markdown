# appsflyer.logPurchase()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__		none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          analytics, attribution, AppsFlyer, logPurchase
> __See also__			[appsflyer.getVersion()][plugin.appsflyer.getVersion]
>						[appsflyer.*][plugin.appsflyer]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

AppsFlyer’s SDK provides server verification for in-app purchases. This method automatically generates an `af_purchase` in-app event.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

For a list of possible return values for validating receipts, please refer to Apple's documentation [here](https://developer.apple.com/library/content/releasenotes/General/ValidateAppStoreReceipt/Chapters/ValidateRemotely.html).
</div>

## Syntax

	appsflyer.logPurchase( productData )

##### productData ~^(required)^~
_[Table][api.type.Table]._ Table containing key-value parameters. In-App Events provide insights on what is happening in your app. It is recommended to take the time and define the events you want to measure to allow you to track ROI (Return on Investment) and LTV (Lifetime Value).

You may specify your own custom key-value parameters (optional). Values should be of type `String`.


## Parameter Reference

The `productData` table for iOS includes following parameters for logging IAP purchases:

##### productId ~^(required)^~
_[String][api.type.String]._ The product ID/name for the IAP purchase.

##### currency ~^(required)^~
_[String][api.type.String]._ The currency of the IAP transaction.

##### transactionId ~^(required)^~
_[String][api.type.String]._ The transaction ID. This parameter applies to Apple App Store transactions only and is mandatory when logging an Apple IAP receipt. It expects the data from event.transaction.identifier found in the in-app purchase transaction callback.

##### price ~^(required)^~
_[String][api.type.String]._ The unit price of the IAP item. The `price` parameter should contain the total revenue associated to the validated purchase event.

##### parameters ~^(optional)^~
_[Table][api.type.Table]._ Table containing additional key-value parameters.

<div style="margin-top: 16px;"></div>

The `productData` table for Android includes following parameters for logging IAP purchases:

##### publicKey ~^(required)^~
_[String][api.type.String]._ API Key, the developer gets this from the Google portal.

##### signature ~^(required)^~
_[String][api.type.String]._ The transaction signature. The developer gets it from google api when purchase succeeded.  This parameter applies to Google Play transactions only and is mandatory when logging a Google IAP receipt. It expects the data from event.transaction.signature found in the in-app purchase transaction callback.

##### purchaseData ~^(required)^~
_[String][api.type.String]._ Purchase data is the actual product purchased in json format. The developer gets it from google api when purchase succeeded. 

##### price ~^(required)^~
_[String][api.type.String]._ The unit price of the IAP item. The `price` parameter should contain the total revenue associated to the validated purchase event.

##### currency ~^(required)^~
_[String][api.type.String]._ The currency of the IAP transaction.

##### parameters ~^(optional)^~
_[Table][api.type.Table]._ Table containing additional key-value parameters.


## Examples

##### iOS

``````lua
local appsflyer = require( "plugin.appsflyer" )

local function appsflyerListener( event )
	-- Handle events here
end

-- Initialize plugin
appsflyer.init( appsflyerListener,
	{
		appID = "YOUR_APP_ID",
       devKey = "YOUR_DEV_KEY"
	}
)

appsflyer.logPurchase(
    {
       productId = "111",
       price = "100",
       currency = "USD",
       transactionId = "222",
       parameters = { first = "1", second = "2" }
	}
)
``````

##### Android

``````lua
local appsflyer = require( "plugin.appsflyer" )

local function appsflyerListener( event )
   -- Handle events here
end

-- Initialize plugin
appsflyer.init( appsflyerListener,
    {
       appID = "YOUR_APP_ID",
       devKey = "YOUR_DEV_KEY"
    }
)

appsflyer.logPurchase(
    {
       publicKey = "111",
       signature = "222",
       purchaseData = "333",
       price = "100",
       currency = "USD",
       parameters = { first = "1", second = "2" }
    }
)
``````
