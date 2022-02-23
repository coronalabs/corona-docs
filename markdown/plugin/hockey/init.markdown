# hockeyApp.init()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          HockeyApp, testing, distribution, init
> __See also__          [hockeyApp.*][plugin.hockey]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Initializes the HockeyApp plugin with an app&nbsp;ID.


## Syntax

	hockeyApp.init( appID )

##### appID ~^(required)^~
_[String][api.type.String]._ An app ID gathered from the HockeyApp dashboard.


## Example

``````lua
local hockeyApp = require( "plugin.hockey" )

-- Initialize plugin with app ID
hockeyApp.init( "1a2b3c4d5e6f7g8h1a2b3c4d5e6f7g8h" )
``````
