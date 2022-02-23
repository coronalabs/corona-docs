# applovinMax.setHasUserConsent()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, AppLovin, setHasUserConsent, Applovin Max
> __See also__          [applovinMax.init()][plugin.applovinMax.init]
>						[applovinMax.load()][plugin.applovinMax.load]
>						[applovinMax.isLoaded()][plugin.applovinMax.isLoaded]
>						[applovinMax.setIsAgeRestrictedUser()][plugin.applovinMax.setIsAgeRestrictedUser]
>						[applovinMax.*][applovinMax.applovin]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

AppLovin SDK requires that publishers set a flag indicating whether the user has provided the publisher opt-in consent for the collection and use of personal data.

## Syntax

	applovinMax.setHasUserConsent( hasUserConsent )

##### hasUserConsent ~^(required)^~
_[Boolean][api.type.Boolean]._ If the user has consented, please set the following flag to `true`, otherwise set it to `false`. The default value is `false`.


## Example

``````lua
local applovinMax = require( "plugin.applovinMax" )

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		applovinMax.setHasUserConsent( true )
	end
end

-- Initialize the AppLovin plugin

applovinMax.init( adListener )
``````
