
# gameNetwork.init()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [gameNetwork.*][api.library.gameNetwork]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          gameNetwork, Google Play Game Services
> __See also__          [gameNetwork.request()][plugin.gameNetwork-google.request]
>								[gameNetwork.show()][plugin.gameNetwork-google.show]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Initializes an app for use with Google Play Game Services.


## Syntax

	gameNetwork.init( "google" [, initCallback] )

##### initCallback ~^(optional)^~
_[Listener][api.type.Listener]._ Callback function where, upon successful initialization, `event.isError` will be `nil`. On unsuccessful initialization, `event.isError` will be `true`. When problems such as network errors occur, `event.errorCode` ([integer][api.type.Number]) and `event.errorMessage` ([string][api.type.String]) will be defined. 


## Example

`````lua
local gameNetwork = require( "gameNetwork" )

local function initCallback( event )
	if not event.isError then
		native.showAlert( "Success!", "", { "OK" } )
	else
		native.showAlert( "Failed!", event.errorMessage, { "OK" } )
		print( "Error Code:", event.errorCode )
	end
end

local function onSystemEvent( event )
	if ( event.type == "applicationStart" ) then
		gameNetwork.init( "google", initCallback )
		return true
	end
end
Runtime:addEventListener( "system", onSystemEvent )
`````