# vungle-v4.showCacheFiles()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, vungle
> __See also__          [vungle-v4.*][plugin.vungle-v4]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Writes the list of files in the Vungle cache to the log. This feature is only available for iOS.


## Syntax

	vungle-v4.showCacheFiles()


## Example

``````lua
local ads = require( "ads" )

ads.init( "vungle", "myAppId" )

-- Writes the list of files in the Vungle cache to the log
ads.showCacheFiles()
``````
