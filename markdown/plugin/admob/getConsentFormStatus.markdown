# admob.getConsentFormStatus()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, AdMob, hide
> __See also__          [admob.loadConsentForm()][plugin.admob.loadConsentForm]
>						[admob.*][plugin.admob]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns two [Strings][api.type.String] `formStatus` and `consentStatus`

`formStatus` can be `"available"`, `"unavailable"`, or `"unknown"`

`consentStatus` can be `"obtained"`, `"required"`, `"notRequired"`, or `"unknown"`


## Syntax

	admob.getConsentFormStatus()



## Example

``````lua
local admob = require( "plugin.admob" )


-- Initialize the AdMob plugin

local function adListener( event )

end

admob.init( adListener, { appId="YOUR_ADMOB_APP_ID" } )

local formStatus, consentStatus = admob.getConsentFormStatus()
print("Form Status:".. formStatus .."  Consent Status: "..consentStatus)
``````
