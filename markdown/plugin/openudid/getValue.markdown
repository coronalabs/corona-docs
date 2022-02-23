# openudid.getValue()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [openudid.*][plugin.openudid]
> __Return value__      [String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          udid, openudid
> __See also__          [openudid.setOptOut()][plugin.openudid.setOptOut]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns the UDID value.


## Syntax

	openudid.getValue()


## Example

``````lua
local openudid = require( "plugin.openudid" )
print( openudid.getValue() )
``````