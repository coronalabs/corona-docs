# tenjin.logPurchase()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__		none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          analytics, attribution, Tenjin, logPurchase
> __See also__			[tenjin.init()][plugin.tenjin.init]
>						[tenjin.logEvent()][plugin.tenjin.logEvent]
>						[tenjin.*][plugin.tenjin]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sends an IAP purchase event to Tenjin.


## Syntax

	tenjin.logPurchase( purchaseData [, purchaseReceipt] )

##### purchaseData ~^(required)^~
_[Table][api.type.Table]._ Table containing IAP purchase data &mdash; see the next section for details.

##### purchaseReceipt ~^(required)^~
_[Table][api.type.Table]._ Table containing <nobr>Apple App Store</nobr> or <nobr>Google Play</nobr> receipt data &mdash; see the next section for details.


## Parameter Reference

The `purchaseData` table includes parameters for logging IAP purchases.

##### productId ~^(required)^~
_[String][api.type.String]._ The product ID/name for the IAP purchase.

##### currencyCode ~^(required)^~
_[String][api.type.String]._ The currency of the IAP transaction.

##### quantity ~^(required)^~
_[Number][api.type.Number]._ The number of units bought.

##### unitPrice ~^(required)^~
_[Number][api.type.Number]._ The unit price of the IAP item.

<div style="margin-top: 16px;"></div>

The `purchaseReceipt` table includes parameters for logging IAP receipts.

##### receipt ~^(required)^~
_[String][api.type.String]._ This parameter is an <nobr>in-app</nobr> purchase receipt. It expects the data from `event.transaction.receipt` found in the <nobr>in-app</nobr> purchase transaction callback. Supported markets include [Apple IAP][api.library.store] and [Google IAP][plugin.google-iap-billing].

##### signature ~^(required)^~
_[String][api.type.String]._ This parameter applies to Google&nbsp;Play transactions only and is mandatory when logging a [Google IAP][plugin.google-iap-billing] receipt. It expects the data from `event.transaction.signature` found in the <nobr>in-app</nobr> purchase transaction callback.

##### transactionId ~^(required)^~
_[String][api.type.String]._ This parameter applies to <nobr>Apple App Store</nobr> transactions only and is mandatory when logging an [Apple IAP][api.library.store] receipt. It expects the data from `event.transaction.identifier` found in the <nobr>in-app</nobr> purchase transaction callback.


## Example

``````lua
local tenjin = require( "plugin.tenjin" )

local function tenjinListener( event )
	-- Handle events here
end

-- Initialize plugin
tenjin.init( tenjinListener, { apiKey="YOUR_API_KEY" } )

-- Sometime later, log an IAP purchase
tenjin.logPurchase( 
	{ 
		productId = "Bonus Pack",
		currencyCode = "USD",
		quantity = 1,
		unitPrice = 0.99
	}
)
``````
