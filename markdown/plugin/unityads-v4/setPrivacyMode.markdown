# unityads.setPrivacyMode()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, unityads, setHasUserConsent
> __See also__          [unityads.init()][plugin.unityad-v4.init]
>                                        [unityads.*][plugin.unityad-v4]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Set flag for compliance mode for the app before initialization (before [unityads.init()][plugin.unityad-v4.init])

## Syntax

	unityads.setPrivacyMode( privacyMode )

##### privacyMode ~^(required)^~
_[String][api.type.String]._ supported modes are "app" (indicates that an app is directed at children), "mixed" (indicates that an app is directed at mixed audiences), or "none" (indicates that the entire app is not directed at children)


## Example

``````lua
local unityads = require( "plugin.unityads.v4" )

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization

	end
end

-- Flag for privacy mode before initialize
unityads.setPrivacyMode( "app" )

-- Initialize the Unity Ads plugin
unityads.init( adListener, { appId="YOUR_UNITYADS_GAME_ID" } )
``````
