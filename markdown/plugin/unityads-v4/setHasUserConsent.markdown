# unityads.setHasUserConsent()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, unityads, setHasUserConsent
> __See also__          [unityads.show()][plugin.unityads-v4.show]
>                                        [unityads.*][plugin.unityads-v4]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

UnityAds SDK gives an option to work with GDPR user consent manually. You can set a flag indicating whether the user has provided the publisher opt-in consent for the collection and use of personal data.

## Syntax

	unityads.setHasUserConsent( hasUserConsent )

##### hasUserConsent ~^(required)^~
_[Boolean][api.type.Boolean]._ If the user has consented, please set the following flag to `true`, otherwise set it to `false`.


## Example

``````lua
local unityads = require( "plugin.unityads.v4" )

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		-- Set user consention
		unityads.setHasUserConsent( true )
	end
end

-- Initialize the Unity Ads plugin
unityads.init( adListener, { appId="YOUR_UNITYADS_GAME_ID" } )
``````
