# peanutlabs.init()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Peanut Labs, init
> __See also__          [peanutlabs.show()][plugin.peanutlabs.show]
>						[peanutlabs.*][plugin.peanutlabs]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

`peanutlabs.init()` initializes the Peanut&nbsp;Labs plugin.

Once initialized, you can show a survey using [peanutlabs.show()][plugin.peanutlabs.show].


## Syntax

	peanutlabs.init( listener, params )

##### listener ~^(required)^~
_[Listener][api.type.Listener]._ Listener function that will receive [adsRequest][plugin.peanutlabs.event.adsRequest] events.

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing Peanut&nbsp;Labs initialization values — see the next section for details.


## Parameter Reference

The `params` table includes parameters for PeauntLabs initialization.

##### userId ~^(required)^~
_[String][api.type.String]._ The ID for the current user of your app.

##### appKey ~^(required)^~
_[String][api.type.String]._ Your Peanut Labs app key, gathered from the [PeauntLabs dashboard](https://www.peanutlabs.com/js/pubdash/bin/index.php).

##### appId ~^(required)^~
_[Number][api.type.Number]._ Your Peanut Labs app ID, gathered from the [PeauntLabs dashboard](https://www.peanutlabs.com/js/pubdash/bin/index.php).


## Example

``````lua
local peanutlabs = require( "plugin.peanutlabs" )

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		print( event.provider )
	end
end

-- Initialize the Peanut Labs plugin
peanutlabs.init( adListener,
	{
		userId = "x1",
		appKey = "YOUR_APP_KEY",
		appId = 2222
	}
)
``````
