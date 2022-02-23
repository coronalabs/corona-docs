# appodeal.trackInAppPurchase()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Appodeal, trackInAppPurchase
> __See also__          [appodeal.init()][plugin.appodeal.init]
>						[appodeal.*][plugin.appodeal]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

This method is not supported by the legacy plugin version]. Make sure to use new modular plugin or beta to get the latest and greatest.

</div>

This method helps you keep track of an inApp purchase. It allows to group users by the fact of purchasing in-apps. This will help you adjust the ads for such users or simply turn it off, if needed. 


## Syntax

	appodeal.trackInAppPurchase( options )

##### options ~^(required)^~
_[Table][api.type.Table]._ Table containing option values &mdash; see the next section for details.


## Options Reference

The `options` table includes parameters for specifying user details.

##### amount ~^(required)^~
_[Number][api.type.Number]._ In app purchase cost amount.

##### currency ~^(required)^~
_[String][api.type.String]._ In app purchase currency. Should be ISO 4217 Code (3 digit code).


## Example

``````lua
local appodeal = require( "plugin.appodeal" )

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		-- Track inApp purchase
		appodeal.trackInAppPurchase( { amount = 10, currency = "USD" } )
    end
end

-- Initialize the Appodeal plugin
appodeal.init( adListener, { appKey = "YOUR_APP_KEY" } )
``````
