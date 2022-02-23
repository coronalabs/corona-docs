# fuse.checkLoaded()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, monetization, fuse, checkLoaded
> __See also__          [fuse.init()][plugin.fuse.init]
>						[fuse.load()][plugin.fuse.load]
>						[fuse.show()][plugin.fuse.show]
>						[fuse.*][plugin.fuse]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns `true` or `false` depending on whether an ad of the specified zone has been loaded and cached.

Note that Fuse is already set up to <nobr>pre-cache</nobr> a few ads when you call [fuse.init()][plugin.fuse.init], so usually there's no need to call `fuse.checkLoaded()` prior to calling [fuse.show()][plugin.fuse.show]. Generally, the only time to call `fuse.checkLoaded()` is when you're calling [fuse.show()][plugin.fuse.show] and you want to ensure that Fuse has <nobr>pre-cached</nobr> an ad from a specific zone.


## Syntax

	fuse.checkLoaded( [params] )

##### params ~^(optional)^~
_[Table][api.type.Table]._ A table which specifies properties for the `fuse.checkLoaded()` query. Within this table, you should specify the `zone` key with a [string][api.type.String] value representing the ad zone to query.


## Example

``````lua
local fuse = require( "plugin.fuse" )

-- Preset an ad zone
local adZone = "Menu"

-- Event listener function
local function adListener( event )

	if ( event.isError ) then
		print( "Fuse error: " .. event.response )
	else
		if ( event.phase == "init" ) then
			-- Fuse system initialized; load/cache a zone-specific ad
			fuse.load( { zone=adZone } )

		elseif ( event.phase == "loaded" ) then
			if ( event.isError == false ) then
				-- Ad successfully loaded for requested zone
			end
			
		elseif ( event.phase == "shown" ) then
			-- An ad finished showing
		end
	end
end

-- Initialize the Fuse service
fuse.init( adListener )

-- Sometime later, check if the ad has been loaded/cached
local isLoaded = fuse.checkLoaded( { zone=adZone } )
-- If true, show the ad
if ( isLoaded == true ) then
	fuse.show( { zone=adZone } )
end
``````