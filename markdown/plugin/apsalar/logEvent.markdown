# apsalar.logEvent()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__		none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          analytics, Apsalar, logEvent
> __See also__			[apsalar.*][plugin.apsalar]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Use this function to record certain events which occur during a session of your application.


## Syntax

	apsalar.logEvent( event )

##### event ~^(required)^~
_[String][api.type.String]._ The event to record.


## Example

``````lua
local apsalar = require( "plugin.apsalar" )

-- Initialize the Apsalar plugin
apsalar.init( "YOUR_API_KEY", "YOUR_SECRET_KEY" )

-- Log an event
apsalar.logEvent( "Level 1 completed" )
``````
