# chartboost.onBackPressed()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__		[Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Chartboost, onBackPressed
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns whether an ad was closed when the "back" key was pressed. This should be implemented in your handler function for the key handler <nobr>(see example below)</nobr>.


## Syntax

	chartboost.onBackPressed()


## Example

``````lua
local chartboost = require( "plugin.chartboost" )

-- Called when a key event has been received
local function onKeyEvent( event )

    if ( event.keyName == "back" and event.phase == "up" ) then
		local platformName = system.getInfo( "platformName" )
		if ( platformName == "Android" ) then
			if ( chartboost.onBackPressed() ) then
				-- Chartboost closed an active ad
				return true  -- Don't pass the event down the responder chain
			end
		end
    end

	-- IMPORTANT! Return false to indicate that this app is NOT overriding the received key
	-- This lets the operating system execute its default handling of the key
    return false
end

-- Add the key event listener
Runtime:addEventListener( "key", onKeyEvent )
``````
