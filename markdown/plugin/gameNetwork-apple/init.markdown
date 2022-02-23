
# gameNetwork.init()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [gameNetwork.*][api.library.gameNetwork]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          gameNetwork, Game Center
> __See also__          [gameNetwork.request()][plugin.gameNetwork-apple.request]
>								[gameNetwork.show()][plugin.gameNetwork-apple.show]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Initializes an app for use with Game Center.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

If using/testing Game Center on iOS&nbsp;8.x and Xcode&nbsp;6+, you must enable the Game&nbsp;Center sandbox by opening the __Settings__ app on the device, selecting __Game&nbsp;Center__ and enabling __Sandbox__.

</div>


## Syntax

    gameNetwork.init( "gamecenter" [, initCallback] )

##### initCallback ~^(optional)^~
_[Listener][api.type.Listener]._ Callback function where, upon successful login, `event.data` will be `true`. If unsuccessful, `event.data` will be `false`. When problems such as network errors occur, `event.errorCode` ([integer][api.type.Number]) and `event.errorMessage` ([string][api.type.String]) will be defined.

## Gotchas

* The `event.type` called `"showSignIn"` will be invoked before the Game Center login screen appears. This gives you a chance to pause your game or do any special actions you need before the login view takes over the screen. On successful login, `event.data` will return the login status (presumably `false`), so code which does not check for this type will still work. When this view is dismissed, the callback will be invoked again with `event.type` set to `"init"` to handle the results of the login. 

* Be aware that iOS backgrounding will cause your app to automatically log out the user from Game Center. When the app is resumed, Game Center will automatically try to <nobr>re-login</nobr> the user. The callback function you specified here will be invoked again, providing the result of that <nobr>re-login</nobr> attempt. As such, this callback function exists for the life of your application. Note that other Game Center functions should not be called when the user is not logged in.


## Example

`````lua
local gameNetwork = require( "gameNetwork" )

local loggedIntoGC = false

local function initCallback( event )

	if ( event.type == "showSignIn" ) then
		-- This is an opportunity to pause your game or do other things you might need to do while the Game Center Sign-In controller is up.
	elseif ( event.data ) then
		loggedIntoGC = true
		native.showAlert( "Success!", "", { "OK" } )
	end
end

local function onSystemEvent( event ) 
	if ( event.type == "applicationStart" ) then
		gameNetwork.init( "gamecenter", initCallback )
		return true
	end
end
Runtime:addEventListener( "system", onSystemEvent )
`````