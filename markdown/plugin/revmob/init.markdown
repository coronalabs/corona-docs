# revmob.init()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, RevMob, init
> __See also__          [revmob.load()][plugin.revmob.load]
>						[revmob.show()][plugin.revmob.show]
>						[revmob.*][plugin.revmob]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

`revmob.init()` initializes the RevMob plugin.

Once initialized, you can load an ad using [revmob.load()][plugin.revmob.load] and subsequently show it via [revmob.show()][plugin.revmob.show].

<div class="guide-notebox">
<div class="notebox-title">Note</div>

This call requires your RevMob app ID. You can get this from the [RevMob Developer Portal](https://coronalabs.revmobmobileadnetwork.com/home/).

</div>


## Syntax

	revmob.init( adListener, params )

##### adListener ~^(required)^~
_[Listener][api.type.Listener]._ Listener function that will receive [adsRequest][plugin.revmob.event.adsRequest] events.

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing RevMob initialization values &mdash; see the next section for details.


## Parameter Reference

The `params` table includes parameters for RevMob initialization.

##### appId ~^(required)^~
_[String][api.type.String]._ Your app ID from RevMob.


## Example

``````lua
local revmob = require( "plugin.revmob" )

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		print( event.isError )
	end
end

-- Initialize RevMob
revmob.init( adListener, { appId="YOUR_APP_ID" } )
``````
