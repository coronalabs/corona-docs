# vungle-v4.getVersionString()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Vungle
> __See also__          [vungle-v4.*][plugin.vungle-v4]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns the plugin and underlying SDK version numbers as a string.


## Syntax

	vungle-v4.getVersionString()


## Example

``````lua
local ads = require( "ads" )

ads.init( "vungle", "myAppId" )

-- Outputs a string in the form "1.0.0 (VungleDroid/1.2.2)"
print( ads.getVersionString() )
``````
