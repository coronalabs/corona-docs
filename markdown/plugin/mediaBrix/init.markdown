# mediaBrix.init()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, MediaBrix, init
> __See also__          [mediaBrix.load()][plugin.mediaBrix.load]
>						[mediaBrix.show()][plugin.mediaBrix.show]
>						[mediaBrix.*][plugin.mediaBrix]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

`mediaBrix.init()` initializes the MediaBrix plugin.

Once initialized, you can load an ad using [mediaBrix.load()][plugin.mediaBrix.load] and subsequently show it via [mediaBrix.show()][plugin.mediaBrix.show].

<div class="guide-notebox">
<div class="notebox-title">Note</div>

This call requires your MediaBrix app ID. This will be sent to you following completion of the MediaBrix [registration][plugin.mediaBrix] process.

</div>


## Syntax

	mediaBrix.init( adListener, params )

##### adListener ~^(required)^~
_[Listener][api.type.Listener]._ Listener function that will receive [adsRequest][plugin.mediaBrix.event.adsRequest] events.

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing MediaBrix initialization values &mdash; see the next section for details.


## Parameter Reference

The `params` table includes parameters for MediaBrix initialization.

##### appId ~^(required)^~
_[String][api.type.String]._ Your app ID from MediaBrix.

##### testMode ~^(optional)^~
_[Boolean][api.type.Boolean]._ If you wish to enable test mode, set this value to `true`. Default is `false`.


## Example

``````lua
local mediaBrix = require( "plugin.mediaBrix" )

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		print( event.isError )
	end
end

-- Initialize MediaBrix
mediaBrix.init( adListener, { appId="YOUR_APP_ID" } )
``````
