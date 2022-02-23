# supersonic.init()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Supersonic, init
> __See also__          [supersonic.load()][plugin.supersonic.load]
>						[supersonic.show()][plugin.supersonic.show]
>						[supersonic.*][plugin.supersonic]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

`supersonic.init()` initializes the Supersonic plugin.

Once initialized, you can load an ad using [supersonic.load()][plugin.supersonic.load] and subsequently show it via [supersonic.show()][plugin.supersonic.show].


## Syntax

	supersonic.init( adListener, params )

##### adListener ~^(required)^~
_[Listener][api.type.Listener]._ Listener function that will receive [adsRequest][plugin.supersonic.event.adsRequest] events.

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing Supersonic initialization values — see the next section for details.


## Parameter Reference

The `params` table includes initialization properties for the Supersonic plugin.

##### appKey ~^(required)^~
_[String][api.type.String]._ Your Supersonic app key, retrieved from the [Supersonic developer portal](https://platform.supersonic.com/partners/).

##### hasUserConsent ~^(optional)^~
_[Boolean][api.type.Boolean]._ If set to `false`, Chartboost will enable GDPR data collection restrictions, set to `true` for opposite. Default is `false`.


## Example

``````lua
local supersonic = require( "plugin.supersonic" )

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		print( event.isError )
	end
end

-- Initialize the Supersonic plugin
supersonic.init( adListener, { appKey="YOUR_APP_KEY" } )
``````
