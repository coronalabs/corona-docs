# overlayStatus

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, overlay, overlayStatus
> __See also__          [steamworks.addEventListener()][plugin.steamworks.addEventListener]
>                       [steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This event occurs when the Steam overlay has been shown or hidden. An overlay can be shown by calling the plugin's "show" APIs or when the user has pressed <nobr>Shift+Tab</nobr> (the&nbsp;default Steam key binding to show its&nbsp;overlay). If the user is in the middle of gameplay, it's best to pause the game while the overlay is shown.

You can receive these events by adding a [listener][api.type.Listener] to the plugin via the [steamworks.addEventListener()][plugin.steamworks.addEventListener] function.


## Properties

#### [event.name][plugin.steamworks.event.overlayStatus.name]

#### [event.phase][plugin.steamworks.event.overlayStatus.phase]


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

-- Called when the Steam overlay has been shown/hidden
local function onOverlayStatusChanged( event )
	if ( event.phase == "shown" ) then
		-- Steam overlay is being shown
		-- You might want to pause gameplay here
	else
		-- Steam overlay is no longer being shown
	end
end

-- Set up a listener to be invoked when the Steam overlay has been shown/hidden
steamworks.addEventListener( "overlayStatus", onAchievementUpdated )
``````
