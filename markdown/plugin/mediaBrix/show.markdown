# mediaBrix.show()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, MediaBrix, show
> __See also__          [mediaBrix.init()][plugin.mediaBrix.init]
>						[mediaBrix.load()][plugin.mediaBrix.load]
>						[mediaBrix.isLoaded()][plugin.mediaBrix.isLoaded]
>						[mediaBrix.*][plugin.mediaBrix]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Shows a MediaBrix ad which was previously loaded via [mediaBrix.load()][plugin.mediaBrix.load].


## Syntax

	mediaBrix.show( placementId )

##### placementId ~^(required)^~
_[String][api.type.String]._ The placement ID of the ad you want to show. This will be sent to you following completion of the MediaBrix [registration][plugin.mediaBrix] process.


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
		-- Show the ad
		mediaBrix.show( "PLACEMENT_ID" )

	elseif ( event.phase == "failed" ) then  -- The ad failed to load
		print( event.type )
		print( event.isError )
		print( event.response )

	elseif ( event.phase == "displayed" ) then  -- The ad was displayed
		print( event.type )

	elseif ( event.phase == "closed" ) then  -- The ad was closed
		print( event.type )
	end
end

-- Initialize MediaBrix
mediaBrix.init( adListener, { appId="YOUR_APP_ID" } )
``````
