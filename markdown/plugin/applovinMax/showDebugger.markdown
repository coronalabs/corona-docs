# applovinMax.showDebugger()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__				[Function][api.type.Function]
> __Return value__		[Boolean][api.type.Boolean]
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			ads, advertising, AppLovin, showDebugger, AppLovin Max
> __See also__			[applovinMax.show()][plugin.applovinMax.show]
>						[applovinMax.*][plugin.applovinMax]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Will show a pop up on iOS and Android that show mediation integration, SDK versions, load test ads, and more info about your AppLovin Setup.


## Syntax

	applovinMax.showDebugger()


## Example

``````lua
local applovinMax = require( "plugin.applovinMax" )

-- Initialize the AppLovin plugin
applovinMax.init( adListener )

-- After Init, show the debugger pop up
applovinMax.showDebugger()
``````
