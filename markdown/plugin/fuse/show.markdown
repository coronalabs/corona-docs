# fuse.show()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, monetization, fuse, show
> __See also__          [fuse.load()][plugin.fuse.load]
>						[fuse.checkLoaded()][plugin.fuse.checkLoaded]
>						[fuse.*][plugin.fuse]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Shows a Fuse ad of the specified zone, assuming one has been loaded/cached. If no zone is specified, the default zone will be used. To check whether an ad of the specific zone exists in the cache, call [fuse.checkLoaded()][plugin.fuse.checkLoaded].

For rewarded videos, you may specify additional parameters pertaining to user interaction.

This function will call the listener function specified by [fuse.init()][plugin.fuse.init] with an `event.phase` value of `"shown"` if the ad has been successfully shown.


## Syntax

	fuse.show( [params] )

##### params ~^(optional)^~
_[Table][api.type.Table]._ A table of <nobr>key-value</nobr> pairs which specifies properties for the ad — see the next section for details.


## Parameter Reference

Valid keys for the `params` table include:

* `zone` &mdash; Optional [string][api.type.String] value specifying the ad zone for which to show an ad. If omitted, the default zone will be used.

* `hidePreRoll` &mdash; Optional [boolean][api.type.Boolean] value pertaining to rewarded videos. By default, a <nobr>pre-roll</nobr> dialog is shown before the video, providing the user with options to either accept (watch) or reject (skip) the video. Set this key to `true` to omit the <nobr>pre-roll</nobr> dialog.

* `hidePostRoll` &mdash; Optional [boolean][api.type.Boolean] value pertaining to rewarded videos. By default, a <nobr>post-roll</nobr> dialog is shown after the user watches the video, informing them that a reward has been earned. Set this key to `true` to omit the <nobr>post-roll</nobr> dialog.

* `preRollYesButtonText` &mdash; Optional [string][api.type.String] value pertaining to rewarded videos. This specifies the text shown for the accept/watch option in the <nobr>pre-roll</nobr> dialog.

* `preRollNoButtonText` &mdash; Optional [string][api.type.String] value pertaining to rewarded videos. This specifies the text shown for the reject/skip option in the <nobr>pre-roll</nobr> dialog.

* `postRollContinueButtonText` &mdash; Optional [string][api.type.String] value pertaining to rewarded videos. This specifies the text shown for the continue/close option in the <nobr>post-roll</nobr> dialog.


## Examples

##### Simple

``````lua
local fuse = require( "plugin.fuse" )

-- Event listener function
local function adListener( event )

	if ( event.isError ) then
		print( "Fuse error: " .. event.response )
    else
		if ( event.phase == "init" ) then
			-- Fuse system initialized

		elseif ( event.phase == "shown" ) then
			-- An ad finished showing

		elseif ( event.phase == "completed" ) then
			-- User accepted an offer or completed a task for a reward
			-- The event.payload table contains details about the reward
        end
    end
end

-- Initialize the Fuse service
fuse.init( adListener )

-- Sometime later, show an ad from the default zone
fuse.show()
``````

##### Specific Zone

``````lua
local fuse = require( "plugin.fuse" )

-- Preset a zone
local zone = "1a2b3c4d"

-- Event listener function
local function adListener( event )

	if ( event.isError ) then
		print( "Fuse error: " .. event.response )
    else
		if ( event.phase == "init" ) then
			-- Fuse system initialized; load/cache a zone-specific ad
			fuse.load( { zone=zone } )

        elseif ( event.phase == "shown" ) then
			-- An ad finished showing

		elseif ( event.phase == "completed" ) then
			-- User accepted an offer or completed a task for a reward
			-- The event.payload table contains details about the reward
        end
    end
end

-- Initialize the Fuse service
fuse.init( adListener )

-- Sometime later, show the ad
local isLoaded = fuse.checkLoaded( { zone=zone } )
if ( isLoaded == true ) then
	fuse.show( { zone=zone } )
end
``````