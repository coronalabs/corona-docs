# admob.loadConsentForm()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, AdMob, hide
> __See also__          [admob.showConsentForm()][plugin.admob.showConsentForm]
>						[admob.*][plugin.admob]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This function loads Consent Form to be displayed (if needed)


## Syntax

	admob.loadConsentForm()



## Example

``````lua
local admob = require( "plugin.admob" )


-- Initialize the AdMob plugin
local function adListener( event )

end
admob.init( adListener, { appId="YOUR_ADMOB_APP_ID" } )
local formStatus, consentStatus = admob.getConsentFormStatus()

if(formStatus == "available")then -- recommend (not required)
	admob.loadConsentForm()
end
``````
