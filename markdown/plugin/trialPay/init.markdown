# trialPay.init()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, TrialPay, init
> __See also__          [trialPay.show()][plugin.trialPay.show]
>						[trialPay.*][plugin.trialPay]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

`trialPay.init()` initializes the TrialPay plugin.

Once initialized, you can show an ad using [trialPay.show()][plugin.trialPay.show].


## Syntax

	trialPay.init( adListener, params )

##### adListener ~^(required)^~
_[Listener][api.type.Listener]._ Listener function that will receive [adsRequest][plugin.trialPay.event.adsRequest] events.

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing TrialPay initialization values — see the next section for details.


## Parameter Reference

The `params` table includes parameters for TrialPay initialization.

##### appKey ~^(required)^~
_[String][api.type.String]._ Your TrialPay app key, obtained from the [TrialPay dashboard](https://merchant.trialpay.com/login/).

##### sid ~^(required)^~
_[String][api.type.String]._ The ID for the current user of your app. This must be an alphanumeric string that is 2 to 150 characters long and it must not begin with `0`.


## Example

``````lua
local trialPay = require( "plugin.trialPay" )

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		print( event.isError )
	end
end

-- Initialize the TrialPay plugin
trialPay.init( adListener, { appKey="YOUR_APP_KEY", sid="user1" } )
``````
