# adSense.init()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          AdSense, Google Ads, Google AdSense, init
> __See also__          [adSense.show()][plugin.adSense.show]
>						[adSense.*][plugin.adSense]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Initalizes the Google AdSense plugin. This step is mandatory before any other features or methods can be used.


## Syntax

	adSense.init( listener, parameters )

##### listener ~^(required)^~
_[Listener][api.type.Listener]._ Listener function that will receive [adsRequest][plugin.adSense.event.adsRequest] events.

##### parameters ~^(required)^~
_[Table][api.type.Table]._ Table containing AdMob initialization values — see the next section for details.

## Parameter Reference

The params table includes parameters for Ad Sense initialization.

##### clientId ~^(required)^~
_[String][api.type.String]._ Also the `data-ad-client` in code and should look like `ca-pub-xxxxxxxxxxxxxxxx`



## Example

``````lua
local adSense = require( "plugin.adSense" )

-- AdSense Ads listener function
local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization

	end
end
-- Initialize AdSense
adSense.init(adListener, {clientId="ca-pub-xxxxxxxxxxxxxxxx"} )
``````
