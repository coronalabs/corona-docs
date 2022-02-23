# applovin.init()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__				[Function][api.type.Function]
> __Return value__		none
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			ads, advertising, AppLovin, Applovin Max, init
> __See also__			[applovinMax.load()][plugin.applovinMax.load]
>						[applovinMax.show()][plugin.applovinMax.show]
>						[applovinMax.*][plugin.applovinMax]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

`applovinMax.init()` initializes the AppLovin plugin.

Once initialized, you can load an ad using [applovinMax.load()][plugin.applovinMax.load] and subsequently show it via [applovinMax.show()][plugin.applovinMax.show].

<div class="guide-notebox">
<div class="notebox-title">Note</div>

This call requires your AppLovin __SDK&nbsp;key__, obtained from the [AppLovin developer portal](https://dash.applovin.com). From the __Account__ section, expand the __Account__ menu on the left side, select __Keys__, and your SDK key should be revealed.

</div>


## Syntax

	applovin.init( adListener, params )

##### adListener ~^(required)^~
_[Listener][api.type.Listener]._ Listener function that will receive [adsRequest][plugin.applovinMax.event.adsRequest] events.

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing AppLovin initialization values &mdash; see the next section for details.


## Parameter Reference

The `params` table includes parameters for the AppLovin initialization.

##### verboseLogging ~^(optional)^~
_[Boolean][api.type.Boolean]._ Set this to `true` to output AppLovin logs to the console.

##### testMode ~^(optional)^~
_[Boolean][api.type.Boolean]._ Set this to `true` to enable test mode. When `true`, test mode will take immediate effect and this will override the test mode setting in the [AppLovin developer portal](https://dash.applovin.com).


## Example

``````lua
local applovinMax = require( "plugin.applovinMax" )

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		print( event.isError )
	end
end

-- Initialize the AppLovin plugin
applovinMax.init( adListener, { testMode=true } )
``````
