# mediaBrix.load()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, MediaBrix, load
> __See also__          [mediaBrix.show()][plugin.mediaBrix.show]
>						[mediaBrix.isLoaded()][plugin.mediaBrix.isLoaded]
>						[mediaBrix.*][plugin.mediaBrix]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Preloads a MediaBrix ad. You can also call [mediaBrix.isLoaded()][plugin.mediaBrix.isLoaded] to verify that the ad has been loaded and [mediaBrix.show()][plugin.mediaBrix.show] to show it.

## Syntax

	mediaBrix.load( placementId )

##### placementId ~^(required)^~
_[String][api.type.String]._ The placement ID of the ad you want to load. This will be sent to you following completion of the MediaBrix [registration][plugin.mediaBrix] process.


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
``````
