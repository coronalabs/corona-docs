# fuse.load()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, monetization, fuse, load
> __See also__          [fuse.init()][plugin.fuse.init]
>						[fuse.checkLoaded()][plugin.fuse.checkLoaded]
>						[fuse.show()][plugin.fuse.show]
>						[fuse.*][plugin.fuse]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Loads and caches a Fuse ad for the specified ad zone. This function will call the listener function specified by [fuse.init()][plugin.fuse.init] with an [event.phase][plugin.fuse.event.adsRequest.phase] value of `"loaded"`, however this does not necessarily mean that an ad of the specified zone was loaded. To determine this condition, check [event.isError][plugin.fuse.event.adsRequest.isError] during the `"loaded"` event phase &mdash; a value of `true` indicates that an ad could __not__ be loaded from the requested zone, while a value of `false` indicates that the requested zone's ad was successfully loaded.

Note that Fuse is already set up to pre-cache a few ads when you call [fuse.init()][plugin.fuse.init], so normally there's no need to call `fuse.load()` prior to calling [fuse.show()][plugin.fuse.show]. Generally, this function should be used to <nobr>pre-cache</nobr> an ad from a specific zone.


## Syntax

	fuse.load( [params] )

##### params ~^(optional)^~
_[Table][api.type.Table]._ A table which specifies properties for the ad request. Within this table, you should specify the `zone` key with a [string][api.type.String] value representing the ad zone for which to load an ad.


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

-- Sometime later, load an ad for a specific zone
fuse.load( { zone="Menu" } )
``````