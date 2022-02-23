# applovin.init()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__				[Function][api.type.Function]
> __Return value__		none
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			ads, advertising, AppLovin, init
> __See also__			[applovin.load()][plugin.applovin.load]
>						[applovin.show()][plugin.applovin.show]
>						[applovin.*][plugin.applovin]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

`applovin.init()` initializes the AppLovin plugin.

Once initialized, you can load an ad using [applovin.load()][plugin.applovin.load] and subsequently show it via [applovin.show()][plugin.applovin.show].

<div class="guide-notebox">
<div class="notebox-title">Note</div>

This call requires your AppLovin __SDK&nbsp;key__, obtained from the [AppLovin developer portal](https://www.applovin.com/manage). From the __Account__ section, expand the __Account__ menu on the left side, select __Keys__, and your SDK key should be revealed.

</div>


## Syntax

	applovin.init( adListener, params )

##### adListener ~^(required)^~
_[Listener][api.type.Listener]._ Listener function that will receive [adsRequest][plugin.applovin.event.adsRequest] events.

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing AppLovin initialization values &mdash; see the next section for details.


## Parameter Reference

The `params` table includes parameters for the AppLovin initialization.

##### sdkKey ~^(required)^~
_[String][api.type.String]._ Your SDK key from AppLovin, found within the [AppLovin developer portal](https://www.applovin.com/account).

##### verboseLogging ~^(optional)^~
_[Boolean][api.type.Boolean]._ Set this to `true` to output AppLovin logs to the console.

##### testMode ~^(optional)^~
_[Boolean][api.type.Boolean]._ Set this to `true` to enable test mode. When `true`, test mode will take immediate effect and this will override the test mode setting in the [AppLovin developer portal](https://www.applovin.com/manage).


## Example

``````lua
local applovin = require( "plugin.applovin" )

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		print( event.isError )
	end
end

-- Initialize the AppLovin plugin
applovin.init( adListener, { sdkKey="YOUR_SDK_KEY" } )
``````
