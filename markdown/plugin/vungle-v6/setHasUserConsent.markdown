# vungle.setHasUserConsent()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Vungle, setHasUserConsent
> __See also__          [vungle.show()][plugin.vungle-v6.show]
>                                        [vungle.*][plugin.vungle-v6]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

UnityAds SDK gives an option to work with GDPR user consent manually. You can set a flag indicating whether the user has provided the publisher opt-in consent for the collection and use of personal data.

## Syntax

	vungle.setHasUserConsent( hasUserConsent [, version] )

##### hasUserConsent ~^(required)^~
_[Boolean][api.type.Boolean]._ If the user has consented, please set the following flag to `true`, otherwise set it to `false`.

##### consentMessageVersion ~^(optional)^~
_[String][api.type.String]._ Optional version string that can be passed indicating the version of your shown consent message users acted on, default value `1.0.0`


## Example

``````lua
local vungle = require( "plugin.vungle.v6" )

local appID
if ( system.getInfo("platform") == "android" ) then
	appID = "YOUR_ANDROID_APP_ID"
else
	appID = "YOUR_IOS_APP_ID"
end

-- Vungle listener function
local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		vungle.setHasUserConsent( true )
	end
end

-- Initialize the Vungle plugin
vungle.init( appID, adListener )
``````
