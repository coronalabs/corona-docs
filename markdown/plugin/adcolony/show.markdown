# adcolony.show()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__		none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, AdColony, show
> __See also__			[adcolony.init()][plugin.adcolony.init]
>						[adcolony.isLoaded()][plugin.adcolony.isLoaded]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Shows an AdColony video interstitial or rewarded video.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

Before calling this function, you must call [adcolony.init()][plugin.adcolony.init] and ensure that the `"init"` event [phase][plugin.adcolony.event.adsRequest.phase] occurs.

</div>


## Syntax

	adcolony.show( zoneName )

##### zoneName ~^(required)^~
_[String][api.type.String]._ The user-defined AdColony zone name to be displayed. Zone names should be specified in the call to [adcolony.init()][plugin.adcolony.init].

<div class="guide-notebox">
<div class="notebox-title">Note</div>

For developers migrating from the Corona Ads incarnation of the AdColony plugin, the following parameters have been __removed__ from this new plugin:

* `params.prePopup` and `params.postPopup`; these options are now specified during [adcolony.load()][plugin.adcolony.load].

</div>


## Example

``````lua
local adcolony = require( "plugin.adcolony" )

-- AdColony listener function
local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		print( event.provider )
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

-- Sometime later, show an ad
if ( adcolony.isLoaded( "interstitial" ) ) then
	adcolony.show( "interstitial" )
end
``````
