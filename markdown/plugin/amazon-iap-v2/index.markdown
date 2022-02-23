# amazon.iap.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Amazon, IAP, in-app purchases
> __Platforms__			Android
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The Amazon IAP plugin lets you sell digital content and subscriptions from within your apps, including <nobr>in-game</nobr> currency, expansion packs, upgrades, magazine issues, and more.

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* This plugin corresponds to <nobr>Amazon IAP v2</nobr>. If you are migrating from the previous version to v2, please see the [migration][plugin.amazon-iap-v2.migration] page for a summary of changes.

* If you're new to <nobr>Amazon In-App Purchasing</nobr>, read Amazon's [In-App Purchasing Overview](https://developer.amazon.com/docs/in-app-purchasing/iap-overview.html) guide.

* You must install the [Amazon App Tester](https://developer.amazon.com/docs/in-app-purchasing/iap-install-and-configure-app-tester.html) or publish your app in the Amazon Appstore to use this plugin. Details on testing can be found [here](https://developer.amazon.com/docs/in-app-purchasing/iap-testing-overview.html).

</div>

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

For in-app purchasing on other platforms, see the documentation for [Google IAP][plugin.google-iap-billing], [Apple IAP][plugin.apple-iap] or [Store API][api.library.store].

</div>
</div>


## Registration

To use Amazon in-app purchasing, you must first register for an [Amazon Developer](http://developer.amazon.com) account.


## Syntax

	local store = require( "plugin.amazon.iap" )


## Properties

#### [store.target][plugin.amazon-iap-v2.target]

#### [store.isActive][plugin.amazon-iap-v2.isActive]


## Functions

#### [store.init()][plugin.amazon-iap-v2.init]

#### [store.loadProducts()][plugin.amazon-iap-v2.loadProducts]

#### [store.purchase()][plugin.amazon-iap-v2.purchase]

#### [store.finishTransaction()][plugin.amazon-iap-v2.finishTransaction]

#### [store.restore()][plugin.amazon-iap-v2.restore]

#### [store.getUserId()][plugin.amazon-iap-v2.getUserId]

#### [store.getUserData()][plugin.amazon-iap-v2.getUserData]

#### [store.isSandboxMode()][plugin.amazon-iap-v2.isSandboxMode]


## Events

#### [storeTransaction][plugin.amazon-iap-v2.event.storeTransaction]

#### [productList][plugin.amazon-iap-v2.event.productList]

#### [userData][plugin.amazon-iap-v2.event.userData]


## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

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


## CORONA_NATIVE_PRODUCT

To use this plugin with CORONA_NATIVE_PRODUCT:

1. Copy `plugin.amazon.iap.jar` and `in-app-purchasing-2.0.61.jar` into the `libs/` directory of your project.

2. Add the following section into your `AndroidManifest.xml` file, inside the `application` tag:

<div class="code-indent">

``````xml
<receiver android:name = "com.amazon.device.iap.ResponseReceiver">
	<intent-filter>
		<action android:name = "com.amazon.inapp.purchasing.NOTIFY"
			android:permission = "com.amazon.inapp.purchasing.Permission.NOTIFY"/>
	</intent-filter>
</receiver>
``````

</div>

3. Also, set `targetedAppStore` to `"amazon"` in your `AndroidManifest.xml` file:

<div class="code-indent">

``````xml
<meta-data android:name="targetedAppStore" android:value="amazon"/>
``````

</div>


<!---

## Example

``````lua
local store = require('plugin.amazon.iap')
local widget = require('widget')
local json = require('json')

-- The main store listener receives events when you make a purchase, restore or if Amazon decides it needs to send you an update
local function storeListener(event)
	print('storeListener event:')
	if not event.isError then
		print('status:', event.status)
		print('transaction:', json.prettify(event.transaction))

		-- You can fulfill the purchase if everything is ok or you can tell Amazon, that this receipt
		-- is no longer valid with store.notifyUnavailable()
		store.notifyFulfilled(event.transaction.receiptId)
	else
		print(json.prettify(event))
	end
end

-- You must call init() before anything else
store.init(storeListener)
print('isSandboxMode:', store.isSandboxMode) -- true if you are testing with App Tester
print('isActive:', store.isActive) -- true if the plugin was properly initialized

local _W, _H = display.actualContentWidth, display.actualContentHeight
local _CX = display.contentCenterX

local width = _W * 0.8
local size = _H * 0.1
local buttonFontSize = 16

local y = size * 0.5
local spacing = _H * 0.15

widget.newButton{
	x = _CX, y = y,
	width = width, height = size,
	label = 'getUserData()',
	fontSize = buttonFontSize,
	onRelease = function()
		local requestId = store.getUserData(function(event)
			print('getUserData() event:')
			if not event.isError then
				print('userId:', event.userId)
				print('marketplace:', event.marketplace)
			else
				print(json.prettify(event))
			end
		end)
		print('getUserData() Request ID:', requestId)
	end
}

widget.newButton{
	x = _CX, y = y + spacing,
	width = width, height = size,
	label = 'getProductData()',
	fontSize = buttonFontSize,
	onRelease = function()
		local requestId = store.getProductData({'consumable1', 'subscription1weekly', 'entitlement1', 'someinvalidsku'}, function(event)
			print('getProductData() event:')
			if not event.isError then
				print('products:', json.prettify(event.products))
				print('invalidProducts:', json.prettify(event.invalidProducts))
			else
				print(json.prettify(event))
			end
		end)
		print('getProductData() Request ID:', requestId)
	end
}

widget.newButton{
	x = _CX, y = y + spacing * 2,
	width = width, height = size,
	label = 'purchase() consumable',
	fontSize = buttonFontSize,
	onRelease = function()
		local requestId = store.purchase('consumable1')
		print('purchase() Request ID:', requestId)
	end
}

widget.newButton{
	x = _CX, y = y + spacing * 3,
	width = width, height = size,
	label = 'purchase() entitlement',
	fontSize = buttonFontSize,
	onRelease = function()
		local requestId = store.purchase('entitlement1')
		print('purchase() Request ID:', requestId)
	end
}

widget.newButton{
	x = _CX, y = y + spacing * 4,
	width = width, height = size,
	label = 'purchase() subscription',
	fontSize = buttonFontSize,
	onRelease = function()
		local requestId = store.purchase('subscription1weekly')
		print('purchase() Request ID:', requestId)
	end
}

widget.newButton{
	x = _CX, y = y + spacing * 5,
	width = width, height = size,
	label = 'restore()',
	fontSize = buttonFontSize,
	onRelease = function()
		local requestId = store.restore()
		print('restore() Request ID:', requestId)
	end
}
``````

-->
