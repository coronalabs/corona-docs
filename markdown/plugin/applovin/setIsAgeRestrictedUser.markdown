# applovin.setIsAgeRestrictedUser()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, AppLovin, setHasUserConsent
> __See also__          [applovin.init()][plugin.applovin.init]
>						[applovin.load()][plugin.applovin.load]
>						[applovin.isLoaded()][plugin.applovin.isLoaded]
>						[applovin.setHasUserConsent()][plugin.applovin.setHasUserConsent]
>						[applovin.*][plugin.applovin]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Used to mark user as age restricted for AppLovin SDK, which is important for Google Play's child policies.

## Syntax

	applovin.setIsAgeRestrictedUser( shouldAgeRestrictUser )

##### shouldAgeRestrictUser ~^(required)^~
_[Boolean][api.type.Boolean]._ If the user is underage, please set the following flag to `true`, otherwise set it to `false`. The default value is `false`.


## Example

``````lua
local applovin = require( "plugin.applovin" )

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		-- Set age restriction
		applovin.setIsAgeRestrictedUser( true )
	end
end

-- Initialize the AppLovin plugin
applovin.init( adListener, { sdkKey="YOUR_SDK_KEY" } )
``````
