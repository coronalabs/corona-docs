# openudid.setOptOut()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [openudid.*][plugin.openudid]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          udid, openudid, privacy
> __See also__          [openudid.getValue()][plugin.openudid.getValue]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Allows for disabling of the UDID.


## Syntax

	openudid.setOptOut( optOut )

##### optOut ~^(required)^~
_[Boolean][api.type.Boolean]._ Controls whether UDID tracking is disabled or not.


## Example

``````lua
local openudid = require( "plugin.openudid" )
openudid.setOptOut( true )
``````