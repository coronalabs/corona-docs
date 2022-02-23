# kochava.logEvent()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__		none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          analytics, attribution, Kochava, logEvent
> __See also__			[kochava.logDeeplinkEvent()][plugin.kochava.logDeeplinkEvent]
>						[kochava.*][plugin.kochava]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sends a custom event or an event with pre-defined types and parameters to Kochava.

## Syntax

	kochava.logEvent( eventType, params )

##### eventType ~^(required)^~
_[String][api.type.String]._ The type of the event. For Standard Events this can be one of the following strings:

* `"achievement"`
* `"adView"`
* `"addToCart"`
* `"addToWishList"`
* `"checkoutStart"`
* `"levelComplete"`
* `"purchase"`
* `"rating"`
* `"registrationComplete"`
* `"search"`
* `"tutorialComplete"`
* `"view"`

For custom events you can specify any valid string that does not begin with an underscore.

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing key-value parameters. Valid keys and associated data types are listed below. You may use these keys and parameters in any combination you see fit.

* `adCampaignId` ([string][api.type.String])
* `adCampaignName` ([string][api.type.String])
* `adDeviceType` ([string][api.type.String])
* `adGroupId` ([string][api.type.String])
* `adGroupName` ([string][api.type.String])
* `adMediationName` ([string][api.type.String])
* `adNetworkName` ([string][api.type.String])
* `adPlacement` ([string][api.type.String])
* `adSize` ([string][api.type.String])
* `adType` ([string][api.type.String])
* `checkoutAsGuest` ([boolean][api.type.Boolean])
* `contentId` ([string][api.type.String])
* `contentType` ([string][api.type.String])
* `currency` ([string][api.type.String])
* `date` ([string][api.type.String] formatted as `"yyyy-mm-dd"`)
* `description` ([string][api.type.String])
* `destination` ([string][api.type.String])
* `durationTimeInterval` ([number][api.type.Number])
* `endDate` ([string][api.type.String] formatted as `"yyyy-mm-dd"`)
* `itemAddedFrom` ([string][api.type.String])
* `level` ([string][api.type.String])
* `maxRating` ([number][api.type.Number])
* `name` ([string][api.type.String])
* `orderId` ([string][api.type.String])
* `origin` ([string][api.type.String])
* `price` ([number][api.type.Number])
* `quantity` ([number][api.type.Number])
* `ratingValue` ([number][api.type.Number])
* `receiptId` ([string][api.type.String])
* `referralFrom` ([string][api.type.String])
* `registrationMethod` ([string][api.type.String])
* `results`  ([string][api.type.String])
* `score` ([string][api.type.String])
* `searchTerm` ([string][api.type.String])
* `spatialX` ([number][api.type.Number])
* `spatialY` ([number][api.type.Number])
* `spatialZ` ([number][api.type.Number])
* `startDate`  ([string][api.type.String] formatted as `"yyyy-mm-dd"`)
* `success` ([string][api.type.String])
* `userId` ([string][api.type.String])
* `userName` ([string][api.type.String])
* `validated` ([string][api.type.String])

You may also specify your own custom key-value parameters. Values may be of type String, Number or Boolean.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

Kochava supports the logging and verification of app store receipts, but only when `eventType` is `"purchase"`. In this case, the following parameters can be added to the `params` table for this purpose:

* `"receiptData"` ([string][api.type.String]) &mdash; This parameter expects the data from `event.transaction.receipt` found in the <nobr>in-app</nobr> purchase transaction callback. Supported markets include [Apple IAP][api.library.store] and [Google IAP][plugin.google-iap-billing].

* `"receiptDataSignature"` ([string][api.type.String]) &mdash; This parameter is mandatory when logging a [Google IAP][plugin.google-iap-billing] receipt. It expects the data from `event.transaction.signature` found in the <nobr>in-app</nobr> purchase transaction callback.

</div>


## Examples

##### In-App Purchase

``````lua
local kochava = require( "plugin.kochava" )

local function kochavaListener( event )
	-- Handle events here
end

-- Initialize plugin
kochava.init( kochavaListener,
	{
		appGUID = "YOUR_APP_GUID"
	}
)
kochava.logEvent( "purchase",
	{
		userId = "USER_ID",
		name = "ITEM_NAME",
		currency = "usd",
		quantity = 2,
		price = 2.50,
		date = "2016-12-30"
	}
)
``````

##### Game Level Completed

``````lua
local kochava = require( "plugin.kochava" )

local function kochavaListener( event )
	-- Handle events here
end

-- Initialize plugin
kochava.init( kochavaListener,
	{
		appGUID = "YOUR_APP_GUID"
	}
)

kochava.logEvent( "levelComplete",
	{
		userId = "USER_ID",
		level = "2",
		score = "22000"
	}
)
``````
