# applovinMax.setIsAgeRestrictedUser()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, AppLovin, setHasUserConsent, AppLovin Max
> __See also__          [applovinMax.init()][plugin.applovinMax.init]
>						[applovinMax.load()][plugin.applovin.load]
>						[applovinMax.isLoaded()][plugin.applovinMax.isLoaded]
>						[applovinMax.setHasUserConsent()][plugin.applovinMax.setHasUserConsent]
>						[applovinMax.*][plugin.applovinMax]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Used to mark user as age restricted for AppLovin SDK, which is important for Google Play's child policies.

## Syntax

	applovin.setIsAgeRestrictedUser( shouldAgeRestrictedUser )

##### shouldAgeRestrictedUser ~^(required)^~
_[Boolean][api.type.Boolean]._ If the user is underage, please set the following flag to `true`, otherwise set it to `false`. The default value is `false`.


## Example

``````lua
local applovinMax = require( "plugin.applovinMax" )

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		-- Set age restriction
		applovinMax.setIsAgeRestrictedUser( true )
	end
end

-- Initialize the AppLovin plugin
applovinMax.init( adListener )
``````
