# inMobi.init()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, InMobi, init
> __See also__          [inMobi.load()][plugin.inmobi.load]
>						[inMobi.show()][plugin.inmobi.show]
>						[inMobi.*][plugin.inmobi]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

`inMobi.init()` initializes the InMobi plugin.

Once initialized, you can load an ad using [inMobi.load()][plugin.inmobi.load] and subsequently show it via [inMobi.show()][plugin.inmobi.show].


## Syntax

	inMobi.init( adListener, params )

##### adListener ~^(required)^~
_[Listener][api.type.Listener]._ Listener function that will receive [adsRequest][plugin.inmobi.event.adsRequest] events.

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing InMobi initialization values &mdash; see the next section for details.


## Parameter Reference

The `params` table includes initialization properties for the InMobi plugin.

##### accountId ~^(required)^~
_[String][api.type.String]._ Your InMobi account ID. You can find this ID in the [InMobi developer portal](https://www.inmobi.com/portal/), located under your account <nobr>drop-down</nobr> menu.

##### logLevel ~^(optional)^~
_[String][api.type.String]._ The InMobi log level you wish to use. Valid options are `"debug"` or `"error"`. The `"debug"` log level is useful for gathering specific device IDs from the Xcode Organizer or Android monitor which can be entered into the InMobi developer portal during testing. Default behavior is no logging.

##### hasUserConsent ~^(optional)^~
_[Boolean][api.type.Boolean]._ If set to `false`, InMobi will enable GDPR data collection restrictions, set to `true` for opposite.


## Example

``````lua
local inMobi = require( "plugin.inMobi" )

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		print( event.isError )
	end
end

-- Initialize the InMobi plugin
inMobi.init( adListener, { accountId="YOUR_ACCOUNT_ID", logLevel="debug", hasUserConsent=true } )
``````
