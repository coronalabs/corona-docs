# applovin.setHasUserConsent()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, AppLovin, setHasUserConsent
> __See also__          [applovin.init()][plugin.applovin.init]
>						[applovin.load()][plugin.applovin.load]
>						[applovin.isLoaded()][plugin.applovin.isLoaded]
>						[applovin.setIsAgeRestrictedUser()][plugin.applovin.setIsAgeRestrictedUser]
>						[applovin.*][plugin.applovin]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

AppLovin SDK requires that publishers set a flag indicating whether the user has provided the publisher opt-in consent for the collection and use of personal data.

## Syntax

	applovin.setHasUserConsent( hasUserConsent )

##### hasUserConsent ~^(required)^~
_[Boolean][api.type.Boolean]._ If the user has consented, please set the following flag to `true`, otherwise set it to `false`. The default value is `false`.


## Example

``````lua
local applovin = require( "plugin.applovin" )

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		-- Set user consention
		applovin.setHasUserConsent( true )
	end
end

-- Initialize the AppLovin plugin
applovin.init( adListener, { sdkKey="YOUR_SDK_KEY" } )
``````
