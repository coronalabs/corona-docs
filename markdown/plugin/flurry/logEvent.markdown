# analytics.logEvent()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [analytics.*][api.library.analytics]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          analytics, Flurry
> __See also__          [analytics.init()][plugin.flurry.init]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Reports a custom event defined by a string value. However, regardless of whether you call `analytics.logEvent()` or not, Flurry will still send basic data like number of users, session length, etc.

Note that it takes some time for the analytics data to appear in the Flurry statistics &mdash; it does not appear immediately even if you log an event.


## Syntax

	analytics.logEvent( eventID )
	analytics.logEvent( eventID, params )

##### eventID ~^(required)^~
_[String][api.type.String]._ Contains the event information to be logged with Flurry.

##### params ~^(optional)^~
_[Table][api.type.Table]._ A table of key/value pairs for defining customized events. Each value associated with a key should be either a [number][api.type.Number] or a [string][api.type.String].


## Example

``````lua
local analytics = require( "analytics" )

analytics.init( "API_KEY" )

local function newGame()

	--log event
	analytics.logEvent( "NewGame" )
	--analytics.logEvent( "NewGame", { skillSetting="Easy", previousScore="20500" } )

	--new game code follows...
end

newGame()
``````