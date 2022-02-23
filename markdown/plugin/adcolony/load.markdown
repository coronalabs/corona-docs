# adcolony.load()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__		none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, AdColony, load
> __See also__			[adcolony.init()][plugin.adcolony.init]
>						[adcolony.isLoaded()][plugin.adcolony.isLoaded]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Loads an AdColony video interstitial or rewarded video.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

Before calling this function, you must call [adcolony.init()][plugin.adcolony.init] and ensure that the `"init"` event [phase][plugin.adcolony.event.adsRequest.phase] occurs.

</div>


## Syntax

	adcolony.load( zoneName [, params ] )

##### zoneName ~^(required)^~
_[String][api.type.String]._ The user-defined AdColony zone name to be loaded. Zone names should be specified in the call to [adcolony.init()][plugin.adcolony.init].

##### params ~^(optional)^~
_[Table][api.type.Table]._ Table containing params for rewarded videos — see the next section for details.


## Parameter Reference

The `params` table includes parameters for rewarded videos.

##### prePopup ~^(optional)^~
_[Boolean][api.type.Boolean]._ If `true`, displays a confirmation popup prior to displaying a rewarded video. Default is `false`.

##### postPopup ~^(optional)^~
_[Boolean][api.type.Boolean]._ If `true`, displays a popup with reward info after displaying a rewarded video. Default is `false`.


## Example

``````lua
local adcolony = require( "plugin.adcolony" )

-- AdColony listener function
local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		-- Load an interstitial ad
		adcolony.load( "interstitial" )
	end
end

-- Initialize the AdColony plugin
adcolony.init( adListener,
	{
		appId = "YOUR_ADCOLONY_APP_ID",
		adZones = {
			interstitial = "YOUR_ADCOLONY_ZONE_ID_1",
			rewardedVideo = "YOUR_ADCOLONY_ZONE_ID_2"
		}
	})
``````
