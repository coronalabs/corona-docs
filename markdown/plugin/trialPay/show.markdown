# trialPay.show()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, TrialPay, show
> __See also__          [trialPay.init()][plugin.trialPay.init]
>						[trialPay.*][plugin.trialPay]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Shows a TrialPay ad.


## Syntax

	trialPay.show( eventName )

##### eventName ~^(required)^~
_[String][api.type.String]._ The event name for the ad that matches the event name you created in the [TrialPay dashboard](https://merchant.trialpay.com/login/).


## Example

``````lua
local trialPay = require( "plugin.trialPay" )

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		-- Show an ad
		trialPay.show( "offerWall" )

	elseif ( event.phase == "failed" ) then  -- The ad failed to load
		print( event.type )
		print( event.isError )
	end
end

-- Initialize the TrialPay plugin
trialPay.init( adListener, { appKey="YOUR_APP_KEY", sid="user1" } )
``````
