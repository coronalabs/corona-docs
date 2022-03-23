# unityads.setPersonalizedAds()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, unityads, setHasUserConsent
> __See also__          [unityads.init()][plugin.unityad-v4.init]
>                                        [unityads.*][plugin.unityad-v4]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Set a user-specific flag that indicates whether a user should receive personalized or contextual advertisement before initialization (before [unityads.init()][plugin.unityad-v4.init])

## Syntax

	unityads.setPersonalizedAds( showPersonalizedAds )

##### showPersonalizedAds ~^(required)^~
_[Boolean][api.type.Boolean]._ `true` indicates that the user may not receive personalized ads and `false` indicates that the user may receive personalized ads


## Example

``````lua
local unityads = require( "plugin.unityads.v4" )

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization

	end
end

-- Flag for personalized ads before initialize
unityads.setPersonalizedAds( true )

-- Initialize the Unity Ads plugin
unityads.init( adListener, { appId="YOUR_UNITYADS_GAME_ID" } )
``````
