# unityads.setPrivacyMode()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, unityads, setPrivacyMode
> __See also__          [unityads.init()][plugin.unityads-v4.init]
>                                        [unityads.*][plugin.unityads-v4]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Set a COPPA compliance mode for the app. Call this before initialization (before [unityads.init()][plugin.unityads-v4.init]).

## Syntax

	unityads.setPrivacyMode( privacyMode )

##### privacyMode ~^(required)^~
_[String][api.type.String]._ Supported modes:

* `"app"` &mdash; The entire app is directed at children (COPPA applies).
* `"mixed"` &mdash; The app has a mixed audience (COPPA applies as a precaution).
* `"none"` &mdash; The app is not directed at children.


## Example

``````lua
local unityads = require( "plugin.unityads.v4" )

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization

	end
end

-- Set privacy mode before initialize
unityads.setPrivacyMode( "app" )

-- Initialize the plugin
unityads.init( adListener, { gameId="YOUR_LEVELPLAY_APP_KEY" } )
``````
