# unityads.setPersonalizedAds()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, unityads, setPersonalizedAds
> __See also__          [unityads.init()][plugin.unityads-v4.init]
>                                        [unityads.*][plugin.unityads-v4]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Set a user-specific flag that indicates whether a user should receive personalized or contextual advertisements. Call this before initialization (before [unityads.init()][plugin.unityads-v4.init]).

## Syntax

	unityads.setPersonalizedAds( showPersonalizedAds )

##### showPersonalizedAds ~^(required)^~
_[Boolean][api.type.Boolean]._ `true` indicates that the user may receive personalized ads. `false` indicates that the user should receive only contextual (non-personalized) ads.


## Example

``````lua
local unityads = require( "plugin.unityads.v4" )

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization

	end
end

-- Set personalized ads flag before initialize
unityads.setPersonalizedAds( true )

-- Initialize the plugin
unityads.init( adListener, { gameId="YOUR_LEVELPLAY_APP_KEY" } )
``````
