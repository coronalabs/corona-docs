# store.availableStores

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Array][api.type.Array]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Amazon, IAP, in-app purchases, availableStores
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Array of store names for which Corona supports <nobr>in-app</nobr> purchases on the current device. For Amazon&nbsp;IAP, this will be a Lua table containing just one [string][api.type.String] entry of `"amazon"`.


## Syntax

	store.availableStores


## Example

``````lua
local store = require( "plugin.amazon.iap.v3" )

local availableStores = store.availableStores
print( availableStores[1] )  --> "amazon"
``````
