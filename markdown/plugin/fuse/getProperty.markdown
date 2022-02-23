# fuse.getProperty()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      (various)
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, monetization, fuse, getProperty
> __See also__          [fuse.*][plugin.fuse]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Queries the Fuse engine for various properties.


## Syntax

	fuse.getProperty( property )
	fuse.getProperty( property, params )

##### property ~^(required)^~
_[String][api.type.String]._ String which specifies the property type. Valid options include:

* `"numGamesPlayed"` &mdash; The number of times that the user has opened the application. On iOS, this is regarded as the app being opened from either the springboard or the system tray (minimized).
* `"versionString"` &mdash; The version string of the Fuse engine.
* `"isConnected"` &mdash; Boolean value of `true` if the application is connected to the Internet; `false` otherwise.
* `"rewardedPayload"` &mdash; The [payload][plugin.fuse.event.adsRequest.payload] of the rewarded object for a specific zone. The zone should be specified within the `params` table via the `zone` key. If a `params` table is not supplied, the payload for the default zone is given.

##### params ~^(optional)^~
_[Table][api.type.Table]._ A table in which to specify the zone for the `"rewardedPayload"` property. The zone should be specified with the `zone` key and a [string][api.type.String] value representing the ad zone.


## Example

``````lua
local fuse = require( "plugin.fuse" )

-- Event listener function
local function adListener( event )

	if ( event.isError ) then
		print( "Fuse error: " .. event.response )
	else
		if ( event.phase == "init" ) then
			-- Fuse system initialized
		end
	end
end

-- Initialize the Fuse service
fuse.init( adListener )

-- Check the number of games played
fuse.getProperty( "numGamesPlayed" )

-- Get the rewarded payload for a specified zone
fuse.getProperty( "rewardedPayload", { zone="Menu" } )
``````