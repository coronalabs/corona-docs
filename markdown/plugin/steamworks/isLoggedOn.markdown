# steamworks.isLoggedOn

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, isLoggedOn
> __See also__          [steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This property will be `true` if all of the following are true:

* The Steam client is currently running.
* User is currently logged into the Steam client.
* The Steam `appId` set in `config.lua` was accepted by Steam.
* The application has successfully established a connection with the Steam client.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

If this property is `false`, most of this plugin's APIs will fail to work and return `false` or `nil`. Assuming that the application is set up correctly, you must assume that the user is not currently logged into the Steam client and is running the application directly. In this case, you should request the user to exit the application, log into Steam, and then <nobr>re-launch</nobr> the application via the Steam client. 

Note that if this property returns `false`, it'll never return `true` for the lifetime of the application, even if the user logs into the Steam client while the application is running. The user __must__ exit the application and restart it after logging into Steam.

</div>


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

-- Do not continue if a logged in Steam user can't be found
-- This means the Steam client is not running or the user is not logged in
if ( steamworks.isLoggedOn == false ) then

	-- Handle the native alert's result displayed below
	local function onAlertHandler( event )
		-- If user logged in, display the Steam client via its custom URL scheme
		if ( event.action == "clicked" ) and ( event.index == 1 ) then
			system.openURL( "steam:" )
		end

		-- Exit this app, regardless of which button was pressed
		-- The Steam client MUST be running when this app starts up
		native.requestExit()
	end

	-- Display a native alert asking the user to log into Steam
	local message =
		"You must log into Steam in order to play this game.\n" ..
		"After logging in, you must then relaunch this app."
	native.showAlert( "Alert", message, { "Log In", "Close" }, onAlertHandler )

	-- Exit out of the "main.lua" file
	-- The screen will be black, only showing the native alert above
	return
end

-- Successfully connected to Steam
print( "Successfully connected to Steam!" )
``````
