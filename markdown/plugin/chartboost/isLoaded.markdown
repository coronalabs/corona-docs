# chartboost.isLoaded()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__		[Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Chartboost, isLoaded
> __See also__			[chartboost.load()][plugin.chartboost.load]
>						[chartboost.show()][plugin.chartboost.show]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns whether an ad is loaded or not.

## Syntax

	chartboost.isLoaded( adType [, namedLocation] )

##### adType ~^(required)^~
_[String][api.type.String]._ One of the following values:

* `"interstitial"`
* `"rewardedVideo"`
* `"moreApps"`

##### namedLocation ~^(optional)^~
_[String][api.type.String]._ The advertisement location. If omitted, the legacy `"Default"` location will be used. See [chartboost.show()][plugin.chartboost.show] for a list of valid <nobr>pre-defined</nobr> options.

<!--- USE ANCHOR LINK ABOVE --->


## Example

``````lua
local chartboost = require( "plugin.chartboost" )

-- Check if default interstitial is loaded
print( chartboost.isLoaded( "interstitial" ) )
``````
