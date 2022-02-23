# mediaBrix.isLoaded()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, MediaBrix, isLoaded
> __See also__          [mediaBrix.show()][plugin.mediaBrix.show]
>						[mediaBrix.*][plugin.mediaBrix]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Checks to see if a MediaBrix ad is already loaded. Returns `true` if an ad is loaded/ready, otherwise returns `false`.


## Syntax

	mediaBrix.isLoaded( placementId )

##### placementId ~^(required)^~
_[String][api.type.String]._ The placement ID of the ad you want to check is loaded. This will be sent to you following completion of the MediaBrix [registration][plugin.mediaBrix] process.


## Example

``````lua
local mediaBrix = require( "plugin.mediaBrix" )

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		print( event.isError )
		-- Load a MediaBrix ad
		mediaBrix.load( "PLACEMENT_ID" )

	elseif ( event.phase == "loaded" ) then  -- The ad was successfully loaded
		print( event.type )

	elseif ( event.phase == "failed" ) then  -- The ad failed to load
		print( event.type )
		print( event.isError )
		print( event.response )
	end
end

-- Initialize MediaBrix
mediaBrix.init( adListener, { appId="YOUR_APP_ID" } )

-- Sometime later, check if the ad is loaded
local isAdLoaded = mediaBrix.isLoaded( "PLACEMENT_ID" )
print( isAdLoaded )
``````
