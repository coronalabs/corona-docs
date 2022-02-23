# advertisingId.getAdvertisingId()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__		[String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          advertising, ID
> __See also__          [advertisingId.isTrackingEnabled()][plugin.advertisingId.isTrackingEnabled]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Provides access to the advertising identifier.


## Example

``````lua
local adID = require( "plugin.advertisingId" )
print( "Advertising ID:", adID.getAdvertisingId() )
``````