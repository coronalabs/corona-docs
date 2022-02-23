# appnext.getApiVersion()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Appnext, getApiVersion
> __See also__          [appnext.*][plugin.appnext]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Returns the OS-specific SDK version.


## Syntax

	appnext.getApiVersion()


## Example

``````lua
local appnext = require( "plugin.appnext" )

local platform = system.getInfo( "platformName" )

print( "Appnext SDK version for " .. platform .. " is: " .. appnext.getApiVersion() )
``````
