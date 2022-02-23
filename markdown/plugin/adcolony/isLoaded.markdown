# adcolony.isLoaded()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__		[Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, AdColony, isLoaded
> __See also__			[adcolony.show()][plugin.adcolony.show]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns whether an ad is loaded or not.

## Syntax

	adcolony.isLoaded( zoneName )

##### zoneName ~^(required)^~
_[String][api.type.String]._ The user-defined AdColony zone name to be checked for availability. Zone names should be specified in the call to [adcolony.init()][plugin.adcolony.init].


## Example

``````lua
local adcolony = require( "plugin.adcolony" )

-- Check if default interstitial is loaded
print( adcolony.isLoaded( "interstitial" ) )
``````
